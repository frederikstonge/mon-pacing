import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/penalties_behavior.dart';
import '../../models/theme_type.dart';

part 'settings_state.freezed.dart';
part 'settings_state.g.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required String language,
    required ThemeType theme,
    @Default(150) int defaultImprovisationDurationInSeconds,
    @Default(true) bool enableDefaultTimeBuffer,
    @Default(60) int defaultTimeBufferInSeconds,
    @Default(true) bool enableDefaultPenaltiesImpactPoints,
    @Default(PenaltiesBehavior.addPoints) PenaltiesBehavior defaultPenaltiesBehavior,
    @Default(3) int defaultPenaltiesRequiredToImpactPoints,
  }) = _SettingsState;

  factory SettingsState.fromJson(Map<String, dynamic> json) => _$SettingsStateFromJson(json);
}
