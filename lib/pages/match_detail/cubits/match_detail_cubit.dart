import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/settings/settings_cubit.dart';
import '../../../extensions/color_extensions.dart';
import '../../../extensions/iterable_extensions.dart';
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

  MatchDetailCubit({required this.settingsCubit, this.pacing, this.match})
    : super(
        MatchDetailState(
          editMode: match != null,
          match: match != null
              ? match.copyWith()
              : MatchModel(
                  id: 0,
                  name: pacing!.name,
                  createdDate: null,
                  modifiedDate: null,
                  // Temporary id to support ReorderableListView
                  improvisations: List<ImprovisationModel>.from(
                    pacing.improvisations.map((e) => e.copyWith(id: -e.id)),
                  ),
                  tags: List<TagModel>.from(pacing.tags.map((e) => e.copyWith(id: 0))),
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

  void editTeam(TeamModel team) {
    final teams = List<TeamModel>.from(state.match.teams);
    teams[teams.indexWhere((t) => t.id == team.id)] = team;
    final match = state.match.copyWith(teams: teams);
    emit(state.copyWith(match: match));
  }

  void removeTeam(TeamModel team) {
    final teams = List<TeamModel>.from(state.match.teams);
    teams.removeAt(teams.indexWhere((t) => t.id == team.id));
    final match = state.match.copyWith(teams: teams);
    emit(state.copyWith(match: match));
  }

  void addPerformer(TeamModel team) {
    final performers = List<PerformerModel>.from(team.performers);
    final allPerformers = List<PerformerModel>.from(state.match.teams.selectMany((t) => t.performers));
    performers.add(_createPerformer(allPerformers));
    editTeam(team.copyWith(performers: performers));
  }

  void editPerformer(TeamModel team, PerformerModel performer) {
    final performers = List<PerformerModel>.from(team.performers);
    performers[performers.indexWhere((p) => p.id == performer.id)] = performer;
    editTeam(team.copyWith(performers: performers));
  }

  void removePerformer(TeamModel team, PerformerModel performer) {
    final performers = List<PerformerModel>.from(team.performers);
    performers.removeAt(performers.indexWhere((p) => p.id == performer.id));
    editTeam(team.copyWith(performers: performers));
  }

  void movePerformer(TeamModel team, int oldIndex, int newIndex) {
    final performers = List<PerformerModel>.from(team.performers);

    final performer = performers.removeAt(oldIndex);

    if (oldIndex < newIndex) {
      newIndex--;
    }

    performers.insert(newIndex, performer);
    editTeam(team.copyWith(performers: performers));
  }

  void onTeamSelected(TeamModel team, TeamModel selectedTeam) {
    final allPerformers = List<PerformerModel>.from(state.match.teams.selectMany((t) => t.performers));
    // Temporary id to support ReorderableListView
    int tempId = allPerformers.isNotEmpty ? allPerformers.map((e) => e.id).toList().reduce(min) - 1 : 0;
    final newTeam = team.copyWith(
      name: selectedTeam.name,
      color: selectedTeam.color,
      performers: selectedTeam.performers.map((p) => p.copyWith(id: tempId--)).toList(),
    );

    editTeam(newTeam);
  }

  TeamModel _createTeam(List<TeamModel> teams) {
    final random = Random();
    final allPerformers = List<PerformerModel>.from(teams.selectMany((t) => t.performers));
    return TeamModel(
      id: teams.isNotEmpty ? teams.map((e) => e.id).toList().reduce(min) - 1 : 0,
      createdDate: null,
      modifiedDate: null,
      name: '${Localizer.current.team} ${teams.length + 1}',
      color: Constants.colors.elementAt(random.nextInt(Constants.colors.length)).getIntvalue,
      performers: [_createPerformer(allPerformers)],
    );
  }

  PerformerModel _createPerformer(List<PerformerModel> allPerformers) {
    return PerformerModel(
      // Temporary id to support ReorderableListView
      id: allPerformers.isNotEmpty ? allPerformers.map((e) => e.id).toList().reduce(min) - 1 : 0,
      name: '',
    );
  }
}
