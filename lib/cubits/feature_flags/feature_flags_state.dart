import 'package:freezed_annotation/freezed_annotation.dart';

import 'feature_flags_status.dart';

part 'feature_flags_state.freezed.dart';
part 'feature_flags_state.g.dart';

@freezed
class FeatureFlagsState with _$FeatureFlagsState {
  const factory FeatureFlagsState({
    required FeatureFlagsStatus status,
    @Default(false) bool? enableIntegrations,
  }) = _FeatureFlagsState;

  factory FeatureFlagsState.fromJson(Map<String, dynamic> json) => _$FeatureFlagsStateFromJson(json);
}
