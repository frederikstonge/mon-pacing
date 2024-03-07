import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/pacing_model.dart';

part 'pacing_state.freezed.dart';

@freezed
class PacingState with _$PacingState {
  const factory PacingState.initial() = PacingInitialState;
  const factory PacingState.error(String error) = PacingErrorState;
  const factory PacingState.success(PacingModel pacing) = PacingSuccessState;
}
