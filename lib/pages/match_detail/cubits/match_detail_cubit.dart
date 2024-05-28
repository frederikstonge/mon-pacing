import 'dart:async';
import 'dart:math';

import 'package:darq/darq.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/settings/settings_cubit.dart';
import '../../../models/improvisation_model.dart';
import '../../../models/match_model.dart';
import '../../../models/pacing_model.dart';
import '../../../models/performer_model.dart';
import '../../../models/team_model.dart';
import 'match_detail_state.dart';

class MatchDetailCubit extends Cubit<MatchDetailState> {
  final SettingsCubit settingsCubit;
  final PacingModel? pacing;
  final MatchModel? match;
  final FutureOr<void> Function(MatchModel value) onConfirm;

  MatchDetailCubit({
    required this.settingsCubit,
    required this.onConfirm,
    this.pacing,
    this.match,
  }) : super(
          MatchDetailState(
            editMode: match != null,
            match: match != null
                ? match.copyWith()
                : MatchModel(
                    id: 0,
                    name: pacing!.name,
                    createdDate: null,
                    modifiedDate: null,
                    improvisations: List<ImprovisationModel>.from(pacing.improvisations),
                    teams: [],
                    penalties: [],
                    points: [],
                    enablePenaltiesImpactPoints: settingsCubit.state.enableDefaultPenaltiesImpactPoints,
                    penaltiesImpactType: settingsCubit.state.defaultPenaltiesImpactType,
                    penaltiesRequiredToImpactPoints: settingsCubit.state.defaultPenaltiesRequiredToImpactPoints,
                  ),
          ),
        );

  Future<void> initialize() async {
    if (!state.editMode) {
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

  void selectTeam(int index) {
    emit(state.copyWith(selectedTeamIndex: index));
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

  void addPerformer(int teamId) {
    final team = state.match.teams.firstWhere((t) => t.id == teamId);
    final performers = List<PerformerModel>.from(team.performers);
    performers.add(_createPerformer());
    editTeam(state.match.teams.indexOf(team), team.copyWith(performers: performers));
  }

  void editPerformer(int teamId, int index, PerformerModel performer) {
    final team = state.match.teams.firstWhere((t) => t.id == teamId);
    final performers = List<PerformerModel>.from(team.performers);
    performers[index] = performer;
    editTeam(state.match.teams.indexOf(team), team.copyWith(performers: performers));
  }

  void removePerformer(int teamId, int index) {
    final team = state.match.teams.firstWhere((t) => t.id == teamId);
    final performers = List<PerformerModel>.from(team.performers);
    performers.removeAt(index);
    editTeam(state.match.teams.indexOf(team), team.copyWith(performers: performers));
  }

  TeamModel _createTeam(List<TeamModel> teams) {
    final nextId = teams.isNotEmpty ? teams.map((e) => e.id).toList().reduce(max) + 1 : 0;
    final performers = List<PerformerModel>.from(teams.selectMany((t, i) => t.performers));
    final random = Random();
    return TeamModel(
      id: nextId,
      name: '${settingsCubit.localizer.team} ${teams.length + 1}',
      color: Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1).value,
      performers: [
        _createPerformer(performers: performers),
      ],
    );
  }

  PerformerModel _createPerformer({List<PerformerModel>? performers}) {
    performers ??= state.match.teams.selectMany((t, i) => t.performers).toList();
    final nextId = performers.isNotEmpty ? performers.map((e) => e.id).toList().reduce(max) + 1 : 0;
    return PerformerModel(id: nextId, name: '');
  }
}
