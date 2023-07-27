import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../l10n/generated/l10n.dart';
import '../../models/point_model.dart';
import '../../models/team_model.dart';
import '../../repositories/matches_repository.dart';
import '../matches/matches_cubit.dart';
import 'match_state.dart';

class MatchCubit extends Cubit<MatchState> {
  final int id;
  final MatchesRepository matchesRepository;
  final MatchesCubit matchesCubit;

  MatchCubit({required this.id, required this.matchesRepository, required this.matchesCubit}) : super(const MatchState.initial());

  Future<void> initialize() async {
    final match = await matchesRepository.get(id);
    if (match!.teams.isEmpty) {
      final teams = List<TeamModel>.from(match.copyWith().teams);

      final team1 = _createRandomTeam(teams);
      teams.add(team1);
      final team2 = _createRandomTeam(teams);
      teams.add(team2);

      final newMatch = match.copyWith(teams: teams);
      emit(MatchState.success(newMatch));
      await matchesCubit.edit(newMatch);
    } else {
      emit(MatchState.success(match));
    }
  }

  Future<void> editName(String name) async {
    await state.whenOrNull(
      success: (match) async {
        final newMatch = match.copyWith(name: name);
        emit(MatchState.success(newMatch));
        await matchesCubit.edit(newMatch);
      },
    );
  }

  Future<void> editTeam(TeamModel team) async {
    await state.whenOrNull(success: (match) async {
      final teams = List<TeamModel>.from(match.copyWith().teams);
      teams[team.order] = team;

      final newMatch = match.copyWith(teams: teams);
      emit(MatchState.success(newMatch));
      await matchesCubit.edit(newMatch);
    });
  }

  Future<void> removeTeam(TeamModel team) async {
    await state.whenOrNull(success: (match) async {
      final teams = List<TeamModel>.from(match.copyWith().teams);
      teams.removeAt(team.order);
      _reOrderTeams(teams);

      final newMatch = match.copyWith(teams: teams);
      emit(MatchState.success(newMatch));
      await matchesCubit.edit(newMatch);
    });
  }

  Future<void> addTeam() async {
    await state.whenOrNull(success: (match) async {
      final teams = List<TeamModel>.from(match.copyWith().teams);
      final team = _createRandomTeam(teams);
      teams.add(team);
      final newMatch = match.copyWith(teams: teams);

      emit(MatchState.success(newMatch));
      await matchesCubit.edit(newMatch);
    });
  }

  Future<void> setPoint(int improvisationId, int teamId, int value) async {
    await state.whenOrNull(success: (match) async {
      final points = List<PointModel>.from(match.copyWith().points);
      if (points.any((element) => element.teamId == teamId && element.improvisationId == improvisationId)) {
        points.removeWhere((element) => element.teamId == teamId && element.improvisationId == improvisationId);
      } else {
        final nextPointId = points.isNotEmpty ? points.map((e) => e.id).reduce(max) + 1 : 0;
        points.add(PointModel(id: nextPointId, teamId: teamId, improvisationId: improvisationId, value: value));
      }

      final newMatch = match.copyWith(points: points);

      emit(MatchState.success(newMatch));
      await matchesCubit.edit(newMatch);
    });
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
