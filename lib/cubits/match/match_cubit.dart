import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../l10n/generated/l10n.dart';
import '../../models/match_model.dart';
import '../../models/point_model.dart';
import '../../models/team_model.dart';
import '../matches/matches_cubit.dart';

class MatchCubit extends Cubit<MatchModel> {
  final MatchesCubit matchesCubit;

  MatchCubit({required MatchModel model, required this.matchesCubit}) : super(model);

  Future<void> initialize() async {
    if (state.teams.isEmpty) {
      final teams = List<TeamModel>.from(state.copyWith().teams);

      final team1 = _createRandomTeam(teams);
      teams.add(team1);
      final team2 = _createRandomTeam(teams);
      teams.add(team2);

      final match = state.copyWith(teams: teams);
      emit(match);
      await matchesCubit.edit(match);
    }
  }

  Future<void> editName(String name) async {
    final match = state.copyWith(name: name);
    emit(match);
    await matchesCubit.edit(match);
  }

  Future<void> editTeam(TeamModel team) async {
    final teams = List<TeamModel>.from(state.copyWith().teams);
    teams[team.order] = team;

    final match = state.copyWith(teams: teams);
    emit(match);
    await matchesCubit.edit(match);
  }

  Future<void> removeTeam(TeamModel team) async {
    final teams = List<TeamModel>.from(state.copyWith().teams);
    teams.removeAt(team.order);
    _reOrderTeams(teams);

    final match = state.copyWith(teams: teams);
    emit(match);
    await matchesCubit.edit(match);
  }

  Future<void> addTeam() async {
    final teams = List<TeamModel>.from(state.copyWith().teams);
    final team = _createRandomTeam(teams);
    teams.add(team);
    final match = state.copyWith(teams: teams);

    emit(match);
    await matchesCubit.edit(match);
  }

  Future<void> setPoint(int improvisationId, int teamId, int value) async {
    final points = List<PointModel>.from(state.copyWith().points);
    if (points.any((element) => element.teamId == teamId && element.improvisationId == improvisationId)) {
      points.removeWhere((element) => element.teamId == teamId && element.improvisationId == improvisationId);
    } else {
      final nextPointId = points.isNotEmpty ? points.map((e) => e.id).reduce(max) + 1 : 0;
      points.add(PointModel(id: nextPointId, teamId: teamId, improvisationId: improvisationId, value: value));
    }

    final match = state.copyWith(points: points);

    emit(match);
    await matchesCubit.edit(match);
  }

  List<TeamModel> _reOrderTeams(List<TeamModel> teams) {
    for (var i = 0; i < teams.length; i++) {
      teams[i] = teams[i].copyWith(order: i);
    }

    return teams;
  }

  TeamModel _createRandomTeam(List<TeamModel> teams) {
    final nextOrder = teams.isNotEmpty ? teams.map((e) => e.order).toList().reduce(max) + 1 : 0;
    final nextId = teams.isNotEmpty ? teams.map((e) => e.id).toList().reduce(max) + 1 : 0;
    final random = Random();
    return TeamModel(
      id: nextId,
      order: nextOrder,
      name: '${S.current.MatchOptionsView_Team} ${nextOrder + 1}',
      color: Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1).value,
    );
  }
}
