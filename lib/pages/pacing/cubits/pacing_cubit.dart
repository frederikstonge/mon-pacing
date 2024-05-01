import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/settings/settings_cubit.dart';
import '../../../models/improvisation_model.dart';
import '../../../models/improvisation_type.dart';
import '../../../models/pacing_model.dart';
import '../../../repositories/pacings_repository.dart';
import 'pacing_state.dart';

class PacingCubit extends Cubit<PacingState> {
  final PacingsRepository pacingsRepository;
  final SettingsCubit settingsCubit;

  PacingModel? initialPacing;

  PacingCubit({
    required this.pacingsRepository,
    required this.settingsCubit,
  }) : super(const PacingState.initial());

  Future<void> initialize(int id) async {
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
        final nextType = ImprovisationType.values[improvisations.length % 2];

        final newImprovisation = ImprovisationModel(
          id: 0,
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

        emit(PacingState.success(pacing.copyWith(improvisations: improvisations)));
      },
    );
  }

  void moveImprovisation(int oldIndex, int newIndex) {
    state.whenOrNull(success: (pacing) {
      final improvisations = List<ImprovisationModel>.from(pacing.copyWith().improvisations);
      final improvisation = improvisations.removeAt(oldIndex);

      if (oldIndex < newIndex) {
        newIndex--;
      }

      improvisations.insert(newIndex, improvisation);

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
