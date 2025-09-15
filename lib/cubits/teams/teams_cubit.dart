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
import '../../l10n/localizer.dart';
import '../../models/team_model.dart';
import '../../repositories/teams_repository.dart';
import '../../services/toaster_service.dart';
import 'teams_state.dart';
import 'teams_status.dart';

class TeamsCubit extends Cubit<TeamsState> {
  static const int _pageSize = 20;
  final TeamsRepository teamsRepository;
  final ToasterService toasterService;

  TeamsCubit({required this.teamsRepository, required this.toasterService})
    : super(const TeamsState(status: TeamsStatus.initial));

  Future<TeamModel?> add(TeamModel model) async {
    try {
      final teamEntity = await teamsRepository.add(model.toEntity());
      final teamModel = TeamModel.fromEntity(entity: teamEntity);
      return teamModel;
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    } finally {
      await refresh();
    }

    return null;
  }

  Future<TeamModel> edit(TeamModel model) async {
    try {
      final entity = await teamsRepository.edit(model.toEntity());
      return TeamModel.fromEntity(entity: entity);
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
      return model;
    } finally {
      await refresh();
    }
  }

  Future<void> delete(TeamModel model) async {
    try {
      await teamsRepository.delete(model.toEntity());
      toasterService.show(title: Localizer.current.toasterTeamDeleted);
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
    if (state.status == TeamsStatus.loading || !state.hasMore) {
      return;
    }

    emit(state.copyWith(status: TeamsStatus.loading));
    try {
      final response = await teamsRepository.getList(state.teams.length, _pageSize, state.selectedTags);
      final teams = state.teams + response.map((e) => TeamModel.fromEntity(entity: e)).toList();

      final tags = teams
          .selectMany((e) => e.tags)
          .map((e) => e.name)
          .groupListsBy((e) => e)
          .values
          .sorted((a, b) => b.length - a.length)
          .map((e) => e.first)
          .toList();

      emit(
        state.copyWith(
          status: TeamsStatus.success,
          teams: teams,
          tags: tags,
          selectedTags: state.selectedTags.where((t) => tags.contains(t)).toList(),
          hasMore: response.length == _pageSize,
        ),
      );
    } catch (exception) {
      emit(TeamsState(status: TeamsStatus.error, error: exception.toString()));
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    }
  }

  Future<void> refresh() async {
    if (state.status != TeamsStatus.initial) {
      emit(TeamsState(status: TeamsStatus.initial, tags: state.tags, selectedTags: state.selectedTags));
      await fetch();
    }
  }

  Future<TeamModel?> import() async {
    try {
      const params = OpenFileDialogParams(
        dialogType: OpenFileDialogType.document,
        sourceType: SourceType.photoLibrary,
        fileExtensionsFilter: ['json'],
      );

      final filePath = await FlutterFileDialog.pickFile(params: params);
      if (filePath != null) {
        final teamValue = await File(filePath).readAsString();
        final team = TeamModelMapper.fromJson(teamValue);
        final newTeamEntity = await teamsRepository.add(
          team
              .copyWith(
                id: 0,
                performers: team.performers.map((e) => e.copyWith(id: -e.id.abs())).toList(),
                tags: team.tags.map((e) => e.copyWith(id: 0)).toList(),
              )
              .toEntity(),
        );
        toasterService.show(title: Localizer.current.toasterTeamImported);

        return TeamModel.fromEntity(entity: newTeamEntity);
      }
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    } finally {
      await refresh();
    }

    return null;
  }

  Future<bool> shareFile(TeamModel model) async {
    try {
      final data = Uint8List.fromList(utf8.encode(jsonEncode(model.toJson())));
      final fileName = sanitizeFilename('${Localizer.current.team}-${model.name}.json', replacement: '-');
      final params = ShareParams(
        title: fileName,
        files: [XFile.fromData(data, mimeType: 'application/json', name: fileName)],
        fileNameOverrides: [fileName],
      );

      final result = await SharePlus.instance.share(params);

      if (result.status == ShareResultStatus.success) {
        toasterService.show(title: Localizer.current.toasterTeamShared);
        return true;
      }
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    }

    return false;
  }

  Future<bool> saveFile(TeamModel model) async {
    try {
      final data = Uint8List.fromList(utf8.encode(jsonEncode(model.toJson())));
      final fileName = sanitizeFilename('${Localizer.current.team}-${model.name}.json', replacement: '-');
      final params = SaveFileDialogParams(data: data, fileName: fileName);
      final filePath = await FlutterFileDialog.saveFile(params: params);
      if (filePath != null) {
        toasterService.show(title: Localizer.current.toasterTeamShared);
        return true;
      }
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    }

    return false;
  }
}
