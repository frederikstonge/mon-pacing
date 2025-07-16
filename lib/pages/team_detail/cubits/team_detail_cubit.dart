import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/settings/settings_cubit.dart';
import '../../../extensions/color_extensions.dart';
import '../../../models/constants.dart';
import '../../../models/performer_model.dart';
import '../../../models/team_model.dart';
import 'team_detail_state.dart';

class TeamDetailCubit extends Cubit<TeamDetailState> {
  final SettingsCubit settingsCubit;
  final TeamModel? team;
  final bool editMode;

  TeamDetailCubit({required this.settingsCubit, required this.editMode, this.team})
    : super(
        TeamDetailState(
          editMode: editMode,
          team: team != null
              ? editMode
                    ? team.copyWith()
                    // Temporary id to support ReorderableListView
                    : team.copyWith(id: 0, performers: team.performers.map((e) => e.copyWith(id: -e.id)).toList())
              : const TeamModel(id: 0, createdDate: null, modifiedDate: null, name: '', color: 0),
        ),
      );

  void initialize() {
    if (!state.editMode) {
      final random = Random();
      final performers = List<PerformerModel>.from(state.team.performers);
      final newTeam = state.team.copyWith(
        color: Constants.colors.elementAt(random.nextInt(Constants.colors.length)).getIntvalue,
        performers: [_createPerformer(performers)],
      );
      emit(state.copyWith(team: newTeam));
    }
  }

  void edit(TeamModel team) {
    emit(state.copyWith(team: team));
  }

  void addPerformer() {
    final team = state.team;
    final performers = List<PerformerModel>.from(team.performers);
    performers.add(_createPerformer(performers));
    edit(team.copyWith(performers: performers));
  }

  void editPerformer(PerformerModel performer) {
    final team = state.team;
    final performers = List<PerformerModel>.from(team.performers);
    performers[performers.indexWhere((p) => p.id == performer.id)] = performer;
    edit(team.copyWith(performers: performers));
  }

  void removePerformer(PerformerModel performer) {
    final team = state.team;
    final performers = List<PerformerModel>.from(team.performers);
    performers.removeAt(performers.indexWhere((p) => p.id == performer.id));
    edit(team.copyWith(performers: performers));
  }

  void movePerformer(int oldIndex, int newIndex) {
    final team = state.team;
    final performers = List<PerformerModel>.from(team.performers);

    final performer = performers.removeAt(oldIndex);

    if (oldIndex < newIndex) {
      newIndex--;
    }

    performers.insert(newIndex, performer);
    edit(team.copyWith(performers: performers));
  }

  PerformerModel _createPerformer(List<PerformerModel> allPerformers) {
    // Temporary id is used for new entities before they are saved in the database.
    int tempId = allPerformers.isNotEmpty ? allPerformers.map((e) => e.id).toList().reduce(min) - 1 : 0;
    if (tempId > 0) {
      tempId = 0;
    }

    return PerformerModel(id: tempId, name: '');
  }
}
