import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:sanitize_filename/sanitize_filename.dart';
import 'package:toastification/toastification.dart';

import '../../models/team_model.dart';
import '../../repositories/teams_repository.dart';
import '../../services/toaster_service.dart';
import '../settings/settings_cubit.dart';
import 'teams_state.dart';

class TeamsCubit extends Cubit<TeamsState> {
  static const int _pageSize = 20;
  final TeamsRepository teamsRepository;
  final ToasterService toasterService;
  final SettingsCubit settingsCubit;
  bool _isFetching = false;

  TeamsCubit({
    required this.teamsRepository,
    required this.toasterService,
    required this.settingsCubit,
  }) : super(const TeamsState.initial());

  Future<TeamModel?> add(TeamModel model) async {
    try {
      final team = await teamsRepository.add(model);
      return team;
    } catch (exception) {
      toasterService.show(title: settingsCubit.localizer.toasterGenericError, type: ToastificationType.error);
    } finally {
      await refresh();
    }

    return null;
  }

  Future<void> edit(TeamModel model) async {
    try {
      await teamsRepository.edit(model);
    } catch (exception) {
      toasterService.show(title: settingsCubit.localizer.toasterGenericError, type: ToastificationType.error);
    } finally {
      await refresh();
    }
  }

  Future<void> delete(TeamModel model) async {
    try {
      await teamsRepository.delete(model.id);
      // TODO
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
          final response = await teamsRepository.getList(0, _pageSize);
          emit(TeamsState.success(response, response.length == _pageSize));
        },
        error: (error) async {
          final response = await teamsRepository.getList(0, _pageSize);
          emit(TeamsState.success(response, response.length == _pageSize));
        },
        success: (teams, hasReachedMax) async {
          final response = await teamsRepository.getList(teams.length, _pageSize);
          emit(TeamsState.success(teams + response, response.length == _pageSize));
        },
      );
    } catch (exception) {
      emit(TeamsState.error(exception.toString()));
      toasterService.show(title: settingsCubit.localizer.toasterGenericError, type: ToastificationType.error);
    } finally {
      _isFetching = false;
    }
  }

  Future<List<String>> getAllTags({String query = ''}) async {
    return await teamsRepository.getAllTags(query: query);
  }

  Future<void> refresh() async {
    emit(const TeamsState.initial());
    await fetch();
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
        final team = TeamModel.fromJson(jsonDecode(teamValue));
        final newTeam = await teamsRepository.add(team.copyWith(id: 0));
        // TODO
        toasterService.show(title: settingsCubit.localizer.toasterPacingImported);

        return newTeam;
      }
    } catch (exception) {
      toasterService.show(title: settingsCubit.localizer.toasterGenericError, type: ToastificationType.error);
    } finally {
      await refresh();
    }

    return null;
  }

  Future<bool> export(TeamModel model) async {
    try {
      final data = Uint8List.fromList(utf8.encode(jsonEncode(model.toJson())));
      final fileName = sanitizeFilename('${model.name}.json', replacement: '-');
      final params = SaveFileDialogParams(data: data, fileName: fileName);
      final filePath = await FlutterFileDialog.saveFile(params: params);
      if (filePath != null) {
        // TODO
        toasterService.show(title: settingsCubit.localizer.toasterPacingExported);
        return true;
      }
    } catch (exception) {
      toasterService.show(title: settingsCubit.localizer.toasterGenericError, type: ToastificationType.error);
    }

    return false;
  }
}
