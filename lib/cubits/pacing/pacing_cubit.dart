import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/improvisation_model.dart';
import '../../models/improvisation_type.dart';
import '../../models/pacing_model.dart';
import '../../repositories/pacings_repository.dart';
import 'pacing_state.dart';

class PacingCubit extends Cubit<PacingState> {
  final int id;
  final PacingsRepository pacingsRepository;

  PacingCubit({required this.pacingsRepository, required this.id}) : super(const PacingState.initial());

  Future<void> initialize() async {
    final pacing = await pacingsRepository.get(id);
    emit(PacingState.success(pacing!));
  }

  void edit(PacingModel model) {
    emit(PacingState.success(model));
  }

  void addImprovisation() {
    state.whenOrNull(
      success: (pacing) {
        final improvisations = List<ImprovisationModel>.from(pacing.copyWith().improvisations);
        final nextOrder = improvisations.isNotEmpty ? improvisations.map((e) => e.order).reduce(max) + 1 : 0;
        final nextId = improvisations.isNotEmpty ? improvisations.map((e) => e.id).reduce(max) + 1 : 0;
        final nextType = ImprovisationType.values[improvisations.length % 2];

        final newImprovisation = ImprovisationModel(
          id: nextId,
          order: nextOrder,
          type: nextType,
          durations: [const Duration(minutes: 2, seconds: 30).inSeconds.toDouble()],
          category: '',
          performers: null,
          theme: '',
          notes: '',
        );

        improvisations.add(newImprovisation);

        emit(PacingState.success(pacing.copyWith(improvisations: improvisations)));
      },
    );
  }

  void moveImprovisation(int oldOrder, int newOrder) {
    state.whenOrNull(success: (pacing) {
      final improvisations = List<ImprovisationModel>.from(pacing.copyWith().improvisations);
      final improvisation = improvisations.removeAt(oldOrder);

      if (oldOrder < newOrder) {
        newOrder--;
      }

      improvisations.insert(newOrder, improvisation);
      _reOrderImprovisations(improvisations);

      emit(PacingState.success(pacing.copyWith(improvisations: improvisations)));
    });
  }

  void removeImprovisation(int order) {
    state.whenOrNull(success: (pacing) {
      final improvisations = List<ImprovisationModel>.from(pacing.copyWith().improvisations);
      improvisations.removeAt(order);
      _reOrderImprovisations(improvisations);

      emit(PacingState.success(pacing.copyWith(improvisations: improvisations)));
    });
  }

  void editImprovisation(ImprovisationModel model) {
    state.whenOrNull(success: (pacing) {
      final improvisations = List<ImprovisationModel>.from(pacing.copyWith().improvisations);
      improvisations[model.order] = model;

      emit(PacingState.success(pacing.copyWith(improvisations: improvisations)));
    });
  }

  List<ImprovisationModel> _reOrderImprovisations(List<ImprovisationModel> improvisations) {
    for (var i = 0; i < improvisations.length; i++) {
      improvisations[i] = improvisations[i].copyWith(order: i);
    }

    return improvisations;
  }
}
