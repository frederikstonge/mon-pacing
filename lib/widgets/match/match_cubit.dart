import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

import '../../generated/l10n.dart';
import '../../models/match_model.dart';
import '../../models/point_model.dart';
import '../../models/team_model.dart';
import '../matches/matches_cubit.dart';

class MatchCubit extends Cubit<MatchModel> {
  final MatchesCubit matchesCubit;

  MatchCubit({required MatchModel model, required this.matchesCubit}) : super(model);

  Future<void> initialize() async {
    if (state.teams.isEmpty) {
      var teams = List<TeamModel>.from(state.copyWith().teams);

      var team1 = _createRandomTeam(teams);
      teams.add(team1);

      var team2 = _createRandomTeam(teams);
      teams.add(team2);

      var match = state.copyWith(teams: teams);
      emit(match);
      await matchesCubit.edit(match);
    }
  }

  Future<void> editName(String name) async {
    var match = state.copyWith(name: name);
    emit(match);
    await matchesCubit.edit(match);
  }

  Future<void> editTeam(TeamModel team) async {
    var teams = List<TeamModel>.from(state.copyWith().teams);
    teams[team.order] = team;

    var match = state.copyWith(teams: teams);
    emit(match);
    await matchesCubit.edit(match);
  }

  Future<void> removeTeam(TeamModel team) async {
    var teams = List<TeamModel>.from(state.copyWith().teams);
    teams.removeAt(team.order);
    _reOrderTeams(teams);

    var match = state.copyWith(teams: teams);
    emit(match);
    await matchesCubit.edit(match);
  }

  Future<void> addTeam() async {
    var teams = List<TeamModel>.from(state.copyWith().teams);
    var team = _createRandomTeam(teams);

    teams.add(team);
    var match = state.copyWith(teams: teams);

    emit(match);
    await matchesCubit.edit(match);
  }

  Future<void> setPoint(int improvisationId, int teamId) async {
    var points = List<PointModel>.from(state.copyWith().points);
    if (points.any((element) => element.teamId == teamId && element.improvisationId == improvisationId)) {
      points.removeWhere((element) => element.teamId == teamId && element.improvisationId == improvisationId);
    } else {
      var nextPointId = points.isNotEmpty ? points.map((e) => e.id).reduce(max) + 1 : 0;
      points.add(PointModel(id: nextPointId, teamId: teamId, improvisationId: improvisationId));
    }

    var match = state.copyWith(points: points);

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
    var nextOrder = teams.isNotEmpty ? teams.map((e) => e.order).toList().reduce(max) + 1 : 0;
    var nextId = teams.isNotEmpty ? teams.map((e) => e.id).toList().reduce(max) + 1 : 0;
    var random = Random();
    return TeamModel(
      id: nextId,
      order: nextOrder,
      name: '${S.current.MatchOptionsView_Team} ${nextOrder + 1}',
      color: Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1).value,
    );
  }
}
