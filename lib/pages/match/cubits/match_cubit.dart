import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/matches/matches_cubit.dart';
import '../../../models/match_model.dart';
import '../../../models/penalty_model.dart';
import '../../../models/point_model.dart';
import '../../../repositories/matches_repository.dart';
import 'match_state.dart';

class MatchCubit extends Cubit<MatchState> {
  final MatchesRepository matchesRepository;
  final MatchesCubit matchesCubit;

  MatchCubit({required this.matchesRepository, required this.matchesCubit}) : super(const MatchState.initial());

  Future<void> initialize(int id, {int? improvisationId, int? durationIndex}) async {
    final newMatch = await matchesRepository.get(id);
    var selectedImprovisationIndex = improvisationId != null ? newMatch!.improvisations.indexWhere((i) => i.id == improvisationId) : 0;
    selectedImprovisationIndex = selectedImprovisationIndex >= 0 ? selectedImprovisationIndex : 0;
    emit(MatchState.success(newMatch!, selectedImprovisationIndex, durationIndex ?? 0));
  }

  Future<void> edit(MatchModel match) async {
    await state.whenOrNull(
      success: (_, selectedImprovisationIndex, selectedDurationIndex) async {
        emit(MatchState.success(match, selectedImprovisationIndex, selectedDurationIndex));
        await matchesCubit.edit(match);
      },
    );
  }

  void changePage(int page) {
    state.whenOrNull(
      success: (match, _, selectedDurationIndex) => emit(
        MatchState.success(
          match,
          page,
          0,
        ),
      ),
    );
  }

  void changeDuration(int durationIndex) {
    state.whenOrNull(
      success: (match, selectedImprovisationIndex, _) => emit(
        MatchState.success(
          match,
          selectedImprovisationIndex,
          durationIndex,
        ),
      ),
    );
  }

  Future<void> setPoint(int improvisationId, int teamId, int value) async {
    await state.whenOrNull(success: (match, selectedImprovisationIndex, selectedDurationIndex) async {
      final points = List<PointModel>.from(match.copyWith().points);
      if (points.any((element) => element.teamId == teamId && element.improvisationId == improvisationId)) {
        final index = points.indexWhere((element) => element.teamId == teamId && element.improvisationId == improvisationId);
        if (value > 0) {
          points[index] = points[index].copyWith(value: value);
        } else {
          points.removeAt(index);
        }
      } else {
        if (value > 0) {
          final nextPointId = points.isNotEmpty ? points.map((e) => e.id).reduce(max) + 1 : 0;
          points.add(PointModel(id: nextPointId, teamId: teamId, improvisationId: improvisationId, value: value));
        }
      }

      final newMatch = match.copyWith(points: points);

      emit(MatchState.success(newMatch, selectedImprovisationIndex, selectedDurationIndex));
      await matchesCubit.edit(newMatch);
    });
  }

  Future<void> addPenalty(PenaltyModel penalty) async {
    await state.whenOrNull(
      success: (match, selectedImprovisationIndex, selectedDurationIndex) async {
        final penalties = List<PenaltyModel>.from(match.copyWith().penalties);
        final nextPenaltyId = penalties.isNotEmpty ? penalties.map((e) => e.id).reduce(max) + 1 : 0;
        penalties.add(penalty.copyWith(id: nextPenaltyId));
        final newMatch = match.copyWith(penalties: penalties);
        emit(MatchState.success(newMatch, selectedImprovisationIndex, selectedDurationIndex));
        await matchesCubit.edit(newMatch);
      },
    );
  }

  Future<void> editPenalty(PenaltyModel penalty) async {
    await state.whenOrNull(
      success: (match, selectedImprovisationIndex, selectedDurationIndex) async {
        final penalties = List<PenaltyModel>.from(match.copyWith().penalties);
        final index = penalties.indexWhere((element) => element.id == penalty.id);
        penalties[index] = penalty;
        final newMatch = match.copyWith(penalties: penalties);
        emit(MatchState.success(newMatch, selectedImprovisationIndex, selectedDurationIndex));
        await matchesCubit.edit(newMatch);
      },
    );
  }

  Future<void> removePenalty(int penaltyId) async {
    await state.whenOrNull(
      success: (match, selectedImprovisationIndex, selectedDurationIndex) async {
        final penalties = List<PenaltyModel>.from(match.copyWith().penalties);
        penalties.removeWhere((element) => element.id == penaltyId);
        final newMatch = match.copyWith(penalties: penalties);
        emit(MatchState.success(newMatch, selectedImprovisationIndex, selectedDurationIndex));
        await matchesCubit.edit(newMatch);
      },
    );
  }
}
