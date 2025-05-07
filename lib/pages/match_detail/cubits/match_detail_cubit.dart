import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/settings/settings_cubit.dart';
import '../../../extensions/color_extensions.dart';
import '../../../l10n/localizer.dart';
import '../../../models/constants.dart';
import '../../../models/improvisation_model.dart';
import '../../../models/match_model.dart';
import '../../../models/pacing_model.dart';
import '../../../models/performer_model.dart';
import '../../../models/tag_model.dart';
import '../../../models/team_model.dart';
import 'match_detail_state.dart';

class MatchDetailCubit extends Cubit<MatchDetailState> {
  final SettingsCubit settingsCubit;
  final PacingModel? pacing;
  final MatchModel? match;
  final FutureOr<bool> Function(MatchModel value) onConfirm;

  MatchDetailCubit({required this.settingsCubit, required this.onConfirm, this.pacing, this.match})
    : super(
        MatchDetailState(
          editMode: match != null,
          match:
              match != null
                  ? match.copyWith()
                  : MatchModel(
                    id: 0,
                    name: pacing!.name,
                    createdDate: null,
                    modifiedDate: null,
                    improvisations: List<ImprovisationModel>.from(pacing.improvisations.map((e) => e.createNew())),
                    tags: List<TagModel>.from(pacing.tags.map((e) => e.createNew())),
                    teams: [],
                    penalties: [],
                    points: [],
                    enableStatistics: settingsCubit.state.defaultEnableStatistics,
                    enablePenaltiesImpactPoints: settingsCubit.state.enableDefaultPenaltiesImpactPoints,
                    penaltiesImpactType: settingsCubit.state.defaultPenaltiesImpactType,
                    penaltiesRequiredToImpactPoints: settingsCubit.state.defaultPenaltiesRequiredToImpactPoints,
                    enableMatchExpulsion: settingsCubit.state.enableDefaultMatchExpulsion,
                    penaltiesRequiredToExpel: settingsCubit.state.defaultPenaltiesRequiredToExpel,
                  ),
        ),
      );

  void initialize() {
    if (!state.editMode || state.match.teams.isEmpty) {
      final teams = List<TeamModel>.from(state.match.teams);
      for (int i = 0; i < pacing!.defaultNumberOfTeams; i++) {
        teams.add(_createTeam(teams));
      }

      final match = state.match.copyWith(teams: teams);
      emit(state.copyWith(match: match));
    }
  }

  void edit(MatchModel match) {
    emit(state.copyWith(match: match));
  }

  void addTeam() {
    final teams = List<TeamModel>.from(state.match.teams);
    teams.add(_createTeam(teams));
    final match = state.match.copyWith(teams: teams);
    emit(state.copyWith(match: match));
  }

  void editTeam(int index, TeamModel team) {
    final teams = List<TeamModel>.from(state.match.teams);
    teams[index] = team;
    final match = state.match.copyWith(teams: teams);
    emit(state.copyWith(match: match));
  }

  void removeTeam(int index) {
    final teams = List<TeamModel>.from(state.match.teams);
    teams.removeAt(index);
    final match = state.match.copyWith(teams: teams);
    emit(state.copyWith(match: match));
  }

  void addPerformer(TeamModel team) {
    final performers = List<PerformerModel>.from(team.performers);
    performers.add(_createPerformer());
    editTeam(state.match.teams.indexOf(team), team.copyWith(performers: performers));
  }

  void editPerformer(TeamModel team, int index, PerformerModel performer) {
    final performers = List<PerformerModel>.from(team.performers);
    performers[index] = performer;
    editTeam(state.match.teams.indexOf(team), team.copyWith(performers: performers));
  }

  void removePerformer(TeamModel team, int index) {
    final performers = List<PerformerModel>.from(team.performers);
    performers.removeAt(index);
    editTeam(state.match.teams.indexOf(team), team.copyWith(performers: performers));
  }

  void movePerformer(TeamModel team, int oldIndex, int newIndex) {
    final performers = List<PerformerModel>.from(team.performers);

    final performer = performers.removeAt(oldIndex);

    if (oldIndex < newIndex) {
      newIndex--;
    }

    performers.insert(newIndex, performer);
    editTeam(state.match.teams.indexOf(team), team.copyWith(performers: performers));
  }

  void onTeamSelected(TeamModel team, TeamModel selectedTeam) {
    final newTeam = team.copyWith(
      name: selectedTeam.name,
      color: selectedTeam.color,
      performers: selectedTeam.performers.map((p) => p.createNew()).toList(),
    );

    editTeam(state.match.teams.indexOf(team), newTeam);
  }

  TeamModel _createTeam(List<TeamModel> teams) {
    final random = Random();
    return TeamModel(
      id: 0,
      createdDate: null,
      modifiedDate: null,
      name: '${Localizer.current.team} ${teams.length + 1}',
      color: Constants.colors.elementAt(random.nextInt(Constants.colors.length)).getIntvalue,
      performers: [_createPerformer()],
    );
  }

  PerformerModel _createPerformer() {
    return PerformerModel(id: 0, name: '');
  }
}
