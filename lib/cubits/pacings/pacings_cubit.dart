import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:sanitize_filename/sanitize_filename.dart';
import 'package:toastification/toastification.dart';

import '../../l10n/localizer.dart';
import '../../models/pacing_model.dart';
import '../../repositories/pacings_repository.dart';
import '../../services/toaster_service.dart';
import 'pacings_state.dart';
import 'pacings_status.dart';

class PacingsCubit extends Cubit<PacingsState> {
  static const int _pageSize = 20;
  final PacingsRepository pacingsRepository;
  final ToasterService toasterService;

  PacingsCubit({required this.pacingsRepository, required this.toasterService})
    : super(const PacingsState(status: PacingsStatus.initial));

  Future<PacingModel?> add(PacingModel model) async {
    try {
      final pacingEntity = await pacingsRepository.add(model.toEntity());
      final pacingModel = PacingModel.fromEntity(entity: pacingEntity);
      return pacingModel;
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    } finally {
      await refresh();
    }

    return null;
  }

  Future<void> edit(PacingModel model) async {
    try {
      await pacingsRepository.edit(model.toEntity());
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    } finally {
      await refresh();
    }
  }

  Future<void> delete(PacingModel model) async {
    try {
      await pacingsRepository.delete(model.toEntity());
      toasterService.show(title: Localizer.current.toasterPacingDeleted);
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    } finally {
      await refresh();
    }
  }

  Future<void> fetch() async {
    if (state.status == PacingsStatus.loading || !state.hasMore) {
      return;
    }

    emit(state.copyWith(status: PacingsStatus.loading));
    try {
      final response = await pacingsRepository.getList(state.pacings.length, _pageSize);
      emit(
        state.copyWith(
          status: PacingsStatus.success,
          pacings: state.pacings + response.map((e) => PacingModel.fromEntity(entity: e)).toList(),
          hasMore: response.length == _pageSize,
        ),
      );
    } catch (exception) {
      emit(PacingsState(status: PacingsStatus.error, error: exception.toString()));
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    }
  }

  Future<void> refresh() async {
    emit(const PacingsState(status: PacingsStatus.initial));
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
        final pacing = PacingModelMapper.fromJson(pacingValue);
        final newPacingEntity = await pacingsRepository.add(pacing.createNew().toEntity());
        toasterService.show(title: Localizer.current.toasterPacingImported);

        return PacingModel.fromEntity(entity: newPacingEntity);
      }
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    } finally {
      await refresh();
    }

    return null;
  }

  Future<bool> export(PacingModel model) async {
    try {
      final data = Uint8List.fromList(utf8.encode(jsonEncode(model.toJson())));
      final fileName = sanitizeFilename('${Localizer.current.pacing}-${model.name}.json', replacement: '-');
      final params = SaveFileDialogParams(data: data, fileName: fileName);
      final filePath = await FlutterFileDialog.saveFile(params: params);
      if (filePath != null) {
        toasterService.show(title: Localizer.current.toasterPacingExported);
        return true;
      }
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    }

    return false;
  }
}
