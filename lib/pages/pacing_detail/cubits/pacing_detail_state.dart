import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/pacing_model.dart';

part 'pacing_detail_state.freezed.dart';

@freezed
class PacingDetailState with _$PacingDetailState {
  const factory PacingDetailState({
    required bool editMode,
    required PacingModel pacing,
  }) = _PacingDetailState;
}
