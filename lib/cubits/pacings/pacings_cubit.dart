import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:sanitize_filename/sanitize_filename.dart';
import 'package:share_plus/share_plus.dart';
import 'package:toastification/toastification.dart';

import '../../extensions/iterable_extensions.dart';
import '../../extensions/pacing_extensions.dart';
import '../../l10n/localizer.dart';
import '../../models/pacing_model.dart';
import '../../repositories/pacings_repository.dart';
import '../../services/toaster_service.dart';
import '../settings/settings_cubit.dart';
import 'pacings_state.dart';
import 'pacings_status.dart';

class PacingsCubit extends Cubit<PacingsState> {
  static const int _pageSize = 20;
  final PacingsRepository pacingsRepository;
  final SettingsCubit settingsCubit;
  final ToasterService toasterService;

  PacingsCubit({required this.pacingsRepository, required this.toasterService, required this.settingsCubit})
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

  Future<PacingModel> edit(PacingModel model) async {
    try {
      final entity = await pacingsRepository.edit(model.toEntity());
      return PacingModel.fromEntity(entity: entity);
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
      return model;
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

  Future<void> selectTag(String tag) async {
    if (state.selectedTags.contains(tag)) {
      return;
    }

    emit(state.copyWith(selectedTags: [...state.selectedTags, tag]));
    await refresh();
  }

  Future<void> deselectTag(String tag) async {
    if (!state.selectedTags.contains(tag)) {
      return;
    }

    emit(state.copyWith(selectedTags: state.selectedTags.where((t) => t != tag).toList()));
    await refresh();
  }

  Future<void> fetch() async {
    if (state.status == PacingsStatus.loading || !state.hasMore) {
      return;
    }

    emit(state.copyWith(status: PacingsStatus.loading));
    try {
      final response = await pacingsRepository.getList(state.pacings.length, _pageSize, state.selectedTags);
      final pacings = state.pacings + response.map((e) => PacingModel.fromEntity(entity: e)).toList();

      final tags = pacings
          .selectMany((e) => e.tags)
          .map((e) => e.name)
          .groupListsBy((e) => e)
          .values
          .sorted((a, b) => b.length - a.length)
          .map((e) => e.first)
          .toList();
      emit(
        state.copyWith(
          status: PacingsStatus.success,
          pacings: pacings,
          tags: tags,
          selectedTags: state.selectedTags.where((t) => tags.contains(t)).toList(),
          hasMore: response.length == _pageSize,
        ),
      );
    } catch (exception) {
      emit(PacingsState(status: PacingsStatus.error, error: exception.toString()));
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    }
  }

  Future<void> refresh() async {
    if (state.status != PacingsStatus.initial) {
      emit(PacingsState(status: PacingsStatus.initial, tags: state.tags, selectedTags: state.selectedTags));
      await fetch();
    }
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

        final newPacingEntity = await pacingsRepository.add(
          pacing
              .copyWith(
                id: 0,
                improvisations: pacing.improvisations.map((e) => e.copyWith(id: -e.id.abs())).toList(),
                tags: pacing.tags.map((e) => e.copyWith(id: 0)).toList(),
              )
              .toEntity(),
        );
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

  Future<bool> shareText(PacingModel model) async {
    try {
      final params = ShareParams(
        title: model.name,
        text: model.toHumanReadableString(settingsCubit.state.improvisationFieldsOrder),
      );
      final result = await SharePlus.instance.share(params);

      if (result.status == ShareResultStatus.success) {
        toasterService.show(title: Localizer.current.toasterPacingShared);
        return true;
      }
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    }

    return false;
  }

  Future<bool> shareFile(PacingModel model) async {
    try {
      final data = Uint8List.fromList(utf8.encode(model.toJson()));
      final fileName = sanitizeFilename('${Localizer.current.pacing}-${model.name}.json', replacement: '-');
      final params = ShareParams(
        title: fileName,
        files: [XFile.fromData(data, mimeType: 'application/json', name: fileName)],
        fileNameOverrides: [fileName],
      );

      final result = await SharePlus.instance.share(params);

      if (result.status == ShareResultStatus.success) {
        toasterService.show(title: Localizer.current.toasterPacingShared);
        return true;
      }
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    }

    return false;
  }

  Future<bool> saveFile(PacingModel model) async {
    try {
      final data = Uint8List.fromList(utf8.encode(model.toJson()));
      final fileName = sanitizeFilename('${Localizer.current.pacing}-${model.name}.json', replacement: '-');
      final params = SaveFileDialogParams(data: data, fileName: fileName);
      final filePath = await FlutterFileDialog.saveFile(params: params);
      if (filePath != null) {
        toasterService.show(title: Localizer.current.toasterPacingShared);
        return true;
      }
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    }

    return false;
  }
}
