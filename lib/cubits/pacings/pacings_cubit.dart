import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:sanitize_filename/sanitize_filename.dart';
import 'package:toastification/toastification.dart';

import '../../models/pacing_model.dart';
import '../../repositories/pacings_repository.dart';
import '../../services/toaster_service.dart';
import '../settings/settings_cubit.dart';
import 'pacings_state.dart';

class PacingsCubit extends Cubit<PacingsState> {
  static const int _pageSize = 20;
  final PacingsRepository pacingsRepository;
  final ToasterService toasterService;
  final SettingsCubit settingsCubit;
  bool _isFetching = false;

  PacingsCubit({
    required this.pacingsRepository,
    required this.toasterService,
    required this.settingsCubit,
  }) : super(const PacingsState.initial());

  Future<PacingModel?> add(PacingModel model) async {
    try {
      final pacing = await pacingsRepository.add(model);
      return pacing;
    } catch (exception) {
      toasterService.show(title: settingsCubit.localizer.toasterGenericError, type: ToastificationType.error);
    } finally {
      await refresh();
    }

    return null;
  }

  Future<void> edit(PacingModel model) async {
    try {
      await pacingsRepository.edit(model);
    } catch (exception) {
      toasterService.show(title: settingsCubit.localizer.toasterGenericError, type: ToastificationType.error);
    } finally {
      await refresh();
    }
  }

  Future<void> delete(PacingModel model) async {
    try {
      await pacingsRepository.delete(model.id);
      toasterService.show(title: settingsCubit.localizer.toasterPacingDeleted);
    } catch (exception) {
      toasterService.show(title: settingsCubit.localizer.toasterGenericError, type: ToastificationType.error);
    } finally {
      await refresh();
    }
  }

  Future<void> fetch() async {
    if (_isFetching) {
      return;
    }

    _isFetching = true;
    try {
      await state.when(
        initial: () async {
          final response = await pacingsRepository.getList(0, _pageSize);
          emit(PacingsState.success(response, response.length == _pageSize));
        },
        error: (error) async {
          final response = await pacingsRepository.getList(0, _pageSize);
          emit(PacingsState.success(response, response.length == _pageSize));
        },
        success: (pacings, hasReachedMax) async {
          final response = await pacingsRepository.getList(pacings.length, _pageSize);
          emit(PacingsState.success(pacings + response, response.length == _pageSize));
        },
      );
    } catch (exception) {
      emit(PacingsState.error(exception.toString()));
      toasterService.show(title: settingsCubit.localizer.toasterGenericError, type: ToastificationType.error);
    } finally {
      _isFetching = false;
    }
  }

  Future<List<String>> getAllTags() async {
    return await pacingsRepository.getAllTags();
  }

  Future<List<String>> getAllCategories() {
    return pacingsRepository.getAllCategories();
  }

  Future<void> refresh() async {
    emit(const PacingsState.initial());
    await fetch();
  }

  Future<PacingModel?> import() async {
    try {
      const params = OpenFileDialogParams(
        dialogType: OpenFileDialogType.document,
        sourceType: SourceType.photoLibrary,
        fileExtensionsFilter: ['json'],
      );

      final filePath = await FlutterFileDialog.pickFile(params: params);
      if (filePath != null) {
        final pacingValue = await File(filePath).readAsString();
        final pacing = PacingModel.fromJson(jsonDecode(pacingValue));
        final newPacing = await pacingsRepository.add(pacing.copyWith(id: 0));
        toasterService.show(title: settingsCubit.localizer.toasterPacingImported);

        return newPacing;
      }
    } catch (exception) {
      toasterService.show(title: settingsCubit.localizer.toasterGenericError, type: ToastificationType.error);
    } finally {
      await refresh();
    }

    return null;
  }

  Future<bool> export(PacingModel model) async {
    try {
      final data = Uint8List.fromList(utf8.encode(jsonEncode(model.toJson())));
      final fileName = sanitizeFilename('${model.name}.json', replacement: '-');
      final params = SaveFileDialogParams(data: data, fileName: fileName);
      final filePath = await FlutterFileDialog.saveFile(params: params);
      if (filePath != null) {
        toasterService.show(title: settingsCubit.localizer.toasterPacingExported);
        return true;
      }
    } catch (exception) {
      toasterService.show(title: settingsCubit.localizer.toasterGenericError, type: ToastificationType.error);
    }

    return false;
  }
}
