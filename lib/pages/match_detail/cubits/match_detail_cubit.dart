import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/settings/settings_cubit.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/improvisation_model.dart';
import '../../../models/match_model.dart';
import '../../../models/pacing_model.dart';
import '../../../models/team_model.dart';
import 'match_detail_state.dart';

class MatchDetailCubit extends Cubit<MatchDetailState> {
  final SettingsCubit settingsCubit;
  final PacingModel? pacing;
  final MatchModel? match;
  final S localizer;
  final FutureOr<void> Function(MatchModel value) onConfirm;

  MatchDetailCubit({
    required this.settingsCubit,
    required this.onConfirm,
    required this.localizer,
    this.pacing,
    this.match,
  }) : super(
          MatchDetailState(
            editMode: match != null,
            match: match != null
                ? match.copyWith()
                : MatchModel(
                    id: 0,
                    name: '',
                    createdDate: null,
                    modifiedDate: null,
                    improvisations: List<ImprovisationModel>.from(pacing!.improvisations),
                    teams: [],
                    penalties: [],
                    points: [],
                  ),
          ),
        );

  void initialize() {
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

  TeamModel _createTeam(List<TeamModel> teams) {
    final nextId = teams.isNotEmpty ? teams.map((e) => e.id).toList().reduce(max) + 1 : 0;
    final random = Random();
    return TeamModel(
      id: nextId,
      name: '${localizer.team} ${teams.length + 1}',
      color: Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1).value,
    );
  }
}
