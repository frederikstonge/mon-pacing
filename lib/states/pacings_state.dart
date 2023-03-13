import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/pacing_model.dart';

part 'pacings_state.freezed.dart';

@freezed
class PacingsState with _$PacingsState {
  const factory PacingsState.initial() = PacingsInitialState;
  const factory PacingsState.error(String error) = PacingsErrorState;
  const factory PacingsState.success(List<PacingModel> pacings, bool hasReachedMax) = PacingsSuccessState;
}
