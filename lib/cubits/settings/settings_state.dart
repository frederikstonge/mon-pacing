import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/theme_type.dart';

part 'settings_state.freezed.dart';
part 'settings_state.g.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required ThemeType theme,
    required int defaultImprovisationDurationInSeconds,
    required bool enableDefaultTimeBuffer,
    required int defaultTimeBufferInSeconds,
    required String language,
  }) = _SettingsState;

  factory SettingsState.fromJson(Map<String, dynamic> json) => _$SettingsStateFromJson(json);
}
