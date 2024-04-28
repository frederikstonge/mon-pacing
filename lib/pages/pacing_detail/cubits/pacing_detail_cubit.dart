import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/pacing_model.dart';
import 'pacing_detail_state.dart';

class PacingDetailCubit extends Cubit<PacingDetailState> {
  final PacingModel? pacing;
  final bool editMode;
  final FutureOr<void> Function(PacingModel value) onConfirm;

  PacingDetailCubit({
    required this.onConfirm,
    required this.editMode,
    this.pacing,
  }) : super(
          PacingDetailState(
            editMode: editMode,
            pacing: pacing != null
                ? pacing.copyWith()
                : const PacingModel(
                    id: 0,
                    name: '',
                    createdDate: null,
                    modifiedDate: null,
                    improvisations: [],
                  ),
          ),
        );

  void edit(PacingModel pacing) {
    emit(state.copyWith(pacing: pacing));
  }
}
