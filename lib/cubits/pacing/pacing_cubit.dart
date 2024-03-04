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

  PacingModel? initialPacing;

  PacingCubit({required this.pacingsRepository, required this.id}) : super(const PacingState.initial());

  Future<void> initialize() async {
    final pacing = await pacingsRepository.get(id);
    initialPacing = pacing;
    emit(PacingState.success(pacing!));
  }

  void edit(PacingModel model) {
    emit(PacingState.success(model));
  }

  void addImprovisation() {
    state.whenOrNull(
      success: (pacing) {
        final improvisations = List<ImprovisationModel>.from(pacing.copyWith().improvisations);
        final nextId = improvisations.isNotEmpty ? improvisations.map((e) => e.id).reduce(max) + 1 : 0;
        final nextType = ImprovisationType.values[improvisations.length % 2];

        final newImprovisation = ImprovisationModel(
          id: nextId,
          type: nextType,
          durationsInSeconds: [const Duration(minutes: 2, seconds: 30).inSeconds],
          category: '',
          performers: '',
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

      emit(PacingState.success(pacing.copyWith(improvisations: improvisations)));
    });
  }

  void removeImprovisation(int index) {
    state.whenOrNull(success: (pacing) {
      final improvisations = List<ImprovisationModel>.from(pacing.copyWith().improvisations);
      improvisations.removeAt(index);

      emit(PacingState.success(pacing.copyWith(improvisations: improvisations)));
    });
  }

  void editImprovisation(int index, ImprovisationModel model) {
    state.whenOrNull(success: (pacing) {
      final improvisations = List<ImprovisationModel>.from(pacing.copyWith().improvisations);
      improvisations[index] = model;

      emit(PacingState.success(pacing.copyWith(improvisations: improvisations)));
    });
  }
}
