import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/settings/settings_cubit.dart';
import '../../../models/pacing_model.dart';
import 'pacing_detail_state.dart';

class PacingDetailCubit extends Cubit<PacingDetailState> {
  final SettingsCubit settingsCubit;
  final PacingModel? pacing;
  final bool editMode;

  PacingDetailCubit({required this.settingsCubit, required this.editMode, this.pacing})
    : super(
        PacingDetailState(
          editMode: editMode,
          pacing: pacing != null
              ? editMode
                    ? pacing.copyWith()
                    : pacing.copyWith(
                        id: 0,
                        // Temporary id to support ReorderableListView
                        improvisations: pacing.improvisations.map((e) => e.copyWith(id: -e.id.abs())).toList(),
                        tags: pacing.tags.map((e) => e.copyWith(id: 0)).toList(),
                      )
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

  void edit(PacingModel pacing) {
    emit(state.copyWith(pacing: pacing));
  }
}
