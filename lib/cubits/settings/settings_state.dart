import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/penalties_impact_type.dart';
import '../../models/theme_type.dart';

part 'settings_state.freezed.dart';
part 'settings_state.g.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required String language,
    required ThemeType theme,
    @Default(true) bool enableHapticFeedback,
    @Default(true) bool enableTimerHapticFeedback,
    @Default(2) int defaultNumberOfTeams,
    @Default(150) int defaultImprovisationDurationInSeconds,
    @Default(30) int defaultTimeBufferInSeconds,
    @Default(30) int defaultHuddleTimerInSeconds,
    @Default(true) bool defaultEnableStatistics,
    @Default(true) bool enableDefaultPenaltiesImpactPoints,
    @Default(PenaltiesImpactType.addPoints) PenaltiesImpactType defaultPenaltiesImpactType,
    @Default(3) int defaultPenaltiesRequiredToImpactPoints,
    @Default(true) bool enableDefaultMatchExpulsion,
    @Default(3) int defaultPenaltiesRequiredToExpel,
  }) = _SettingsState;

  factory SettingsState.fromJson(Map<String, dynamic> json) => _$SettingsStateFromJson(json);
}
