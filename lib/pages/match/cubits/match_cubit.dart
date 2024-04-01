import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/matches/matches_cubit.dart';
import '../../../models/match_model.dart';
import '../../../models/point_model.dart';
import '../../../repositories/matches_repository.dart';
import 'match_state.dart';

class MatchCubit extends Cubit<MatchState> {
  final int id;
  final MatchesRepository matchesRepository;
  final MatchesCubit matchesCubit;

  MatchCubit({required this.id, required this.matchesRepository, required this.matchesCubit}) : super(const MatchState.initial());

  Future<void> initialize() async {
    final match = await matchesRepository.get(id);
    emit(MatchState.success(match!));
  }

  Future<void> edit(MatchModel match) async {
    await matchesCubit.edit(match);
    emit(MatchState.success(match));
  }

  Future<void> setPoint(int improvisationId, int teamId, int value) async {
    await state.whenOrNull(success: (match) async {
      final points = List<PointModel>.from(match.copyWith().points);
      if (points.any((element) => element.teamId == teamId && element.improvisationId == improvisationId)) {
        final index = points.indexWhere((element) => element.teamId == teamId && element.improvisationId == improvisationId);
        points[index] = points[index].copyWith(value: value);
      } else {
        final nextPointId = points.isNotEmpty ? points.map((e) => e.id).reduce(max) + 1 : 0;
        points.add(PointModel(id: nextPointId, teamId: teamId, improvisationId: improvisationId, value: value));
      }

      final newMatch = match.copyWith(points: points);

      await matchesCubit.edit(newMatch);
      emit(MatchState.success(newMatch));
    });
  }
}
