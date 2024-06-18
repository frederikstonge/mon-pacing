import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/settings/settings_cubit.dart';
import '../../../models/pacing_model.dart';
import '../../../repositories/pacings_repository.dart';
import 'pacing_detail_state.dart';

class PacingDetailCubit extends Cubit<PacingDetailState> {
  final PacingsRepository pacingsRepository;
  final SettingsCubit settingsCubit;
  final PacingModel? pacing;
  final bool editMode;
  final FutureOr<bool> Function(PacingModel value) onConfirm;

  PacingDetailCubit({
    required this.pacingsRepository,
    required this.settingsCubit,
    required this.onConfirm,
    required this.editMode,
    this.pacing,
  }) : super(
          PacingDetailState(
            editMode: editMode,
            initialized: false,
            allTags: [],
            pacing: pacing != null
                ? pacing.copyWith()
                : PacingModel(
                    id: 0,
                    name: '',
                    createdDate: null,
                    modifiedDate: null,
                    improvisations: [],
                    defaultNumberOfTeams: settingsCubit.state.defaultNumberOfTeams,
                  ),
          ),
        );

  Future<void> initialize() async {
    final allTags = await pacingsRepository.getAllTags();
    emit(state.copyWith(allTags: allTags.keys.toList(), initialized: true));
  }

  void edit(PacingModel pacing) {
    emit(state.copyWith(pacing: pacing));
  }
}
