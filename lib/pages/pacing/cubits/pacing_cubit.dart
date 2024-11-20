import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/pacings/pacings_cubit.dart';
import '../../../cubits/settings/settings_cubit.dart';
import '../../../l10n/localizer.dart';
import '../../../models/improvisation_model.dart';
import '../../../models/improvisation_type.dart';
import '../../../models/pacing_model.dart';
import '../../../repositories/pacings_repository.dart';
import 'pacing_state.dart';

class PacingCubit extends Cubit<PacingState> {
  final PacingsRepository pacingsRepository;
  final PacingsCubit pacingsCubit;
  final SettingsCubit settingsCubit;

  PacingCubit({
    required this.pacingsRepository,
    required this.pacingsCubit,
    required this.settingsCubit,
  }) : super(const PacingState.initial());

  Future<void> initialize(int id) async {
    final pacing = await pacingsRepository.get(id);
    if (pacing == null) {
      emit(PacingState.error(Localizer.current.toasterGenericError));
      return;
    }

    emit(PacingState.success(pacing));
  }

  Future<void> edit(PacingModel model) async {
    emit(PacingState.success(model));
    await pacingsCubit.edit(model);
  }

  Future<void> addImprovisation() async {
    await state.whenOrNull(
      success: (pacing) async {
        final improvisations = List<ImprovisationModel>.from(pacing.copyWith().improvisations);
        final nextId = improvisations.isNotEmpty ? improvisations.map((e) => e.id).reduce(max) + 1 : 0;
        final nextType = ImprovisationType.values[improvisations.length % 2];

        final newImprovisation = ImprovisationModel(
          id: nextId,
          type: nextType,
          durationsInSeconds: [settingsCubit.state.defaultImprovisationDurationInSeconds],
          category: '',
          performers: '',
          theme: '',
          notes: '',
          timeBufferInSeconds: settingsCubit.state.defaultTimeBufferInSeconds,
          huddleTimerInSeconds: settingsCubit.state.defaultHuddleTimerInSeconds,
        );

        improvisations.add(newImprovisation);

        final newPacing = pacing.copyWith(improvisations: improvisations);

        emit(PacingState.success(newPacing));
        await pacingsCubit.edit(newPacing);
      },
    );
  }

  Future<void> moveImprovisation(int oldIndex, int newIndex) async {
    await state.whenOrNull(success: (pacing) async {
      final improvisations = List<ImprovisationModel>.from(pacing.copyWith().improvisations);
      final improvisation = improvisations.removeAt(oldIndex);

      if (oldIndex < newIndex) {
        newIndex--;
      }

      improvisations.insert(newIndex, improvisation);

      final newPacing = pacing.copyWith(improvisations: improvisations);

      emit(PacingState.success(newPacing));
      await pacingsCubit.edit(newPacing);
    });
  }

  Future<void> removeImprovisation(int index) async {
    await state.whenOrNull(success: (pacing) async {
      final improvisations = List<ImprovisationModel>.from(pacing.copyWith().improvisations);
      improvisations.removeAt(index);

      final newPacing = pacing.copyWith(improvisations: improvisations);

      emit(PacingState.success(newPacing));
      await pacingsCubit.edit(newPacing);
    });
  }

  Future<void> editImprovisation(int index, ImprovisationModel model) async {
    await state.whenOrNull(success: (pacing) async {
      final improvisations = List<ImprovisationModel>.from(pacing.copyWith().improvisations);
      improvisations[index] = model;

      final newPacing = pacing.copyWith(improvisations: improvisations);

      emit(PacingState.success(newPacing));
      await pacingsCubit.edit(newPacing);
    });
  }
}
