import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/pacings/pacings_cubit.dart';
import '../../../cubits/settings/settings_cubit.dart';
import '../../../l10n/localizer.dart';
import '../../../models/improvisation_model.dart';
import '../../../models/improvisation_type.dart';
import '../../../models/pacing_model.dart';
import '../../../repositories/pacings_repository.dart';
import 'pacing_state.dart';
import 'pacing_status.dart';

class PacingCubit extends Cubit<PacingState> {
  final PacingsRepository pacingsRepository;
  final PacingsCubit pacingsCubit;
  final SettingsCubit settingsCubit;

  PacingCubit({required this.pacingsRepository, required this.pacingsCubit, required this.settingsCubit})
    : super(const PacingState(status: PacingStatus.initial));

  Future<void> initialize(int id) async {
    emit(const PacingState(status: PacingStatus.loading));

    final pacingEntity = await pacingsRepository.get(id);
    if (pacingEntity == null) {
      emit(state.copyWith(status: PacingStatus.error, error: Localizer.current.toasterGenericError));
      return;
    }

    final pacing = PacingModel.fromEntity(entity: pacingEntity);
    emit(state.copyWith(status: PacingStatus.success, pacing: pacing));
  }

  Future<void> edit(PacingModel model) async {
    emit(state.copyWith(status: PacingStatus.success, pacing: model));
    await pacingsCubit.edit(model);
  }

  Future<void> addImprovisation() async {
    final improvisations = List<ImprovisationModel>.from(state.pacing!.copyWith().improvisations);
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

    final newPacing = await pacingsCubit.edit(state.pacing!.copyWith(improvisations: improvisations));

    emit(state.copyWith(status: PacingStatus.success, pacing: newPacing));
  }

  Future<void> moveImprovisation(int oldIndex, int newIndex) async {
    final improvisations = List<ImprovisationModel>.from(state.pacing!.copyWith().improvisations);
    final improvisation = improvisations.removeAt(oldIndex);

    if (oldIndex < newIndex) {
      newIndex--;
    }

    improvisations.insert(newIndex, improvisation);

    final newPacing = await pacingsCubit.edit(state.pacing!.copyWith(improvisations: improvisations));

    emit(state.copyWith(status: PacingStatus.success, pacing: newPacing));
  }

  Future<void> removeImprovisation(ImprovisationModel improvisation) async {
    final improvisations = List<ImprovisationModel>.from(state.pacing!.copyWith().improvisations);
    improvisations.removeAt(improvisations.indexWhere((i) => i.id == improvisation.id));

    final newPacing = await pacingsCubit.edit(state.pacing!.copyWith(improvisations: improvisations));

    emit(state.copyWith(status: PacingStatus.success, pacing: newPacing));
  }

  Future<void> editImprovisation(ImprovisationModel model) async {
    final improvisations = List<ImprovisationModel>.from(state.pacing!.copyWith().improvisations);
    improvisations[improvisations.indexWhere((i) => i.id == model.id)] = model;

    final newPacing = await pacingsCubit.edit(state.pacing!.copyWith(improvisations: improvisations));

    emit(state.copyWith(status: PacingStatus.success, pacing: newPacing));
  }
}
