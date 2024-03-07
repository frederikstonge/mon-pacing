import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/pacing_model.dart';

part 'pacing_detail_state.freezed.dart';
part 'pacing_detail_state.g.dart';

@freezed
class PacingDetailState with _$PacingDetailState {
  const factory PacingDetailState({
    required bool editMode,
    required PacingModel pacing,
  }) = _PacingDetailState;

  factory PacingDetailState.fromJson(Map<String, dynamic> json) => _$PacingDetailStateFromJson(json);
}
