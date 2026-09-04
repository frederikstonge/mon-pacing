import 'dart:io';

import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/theme_type.dart';
import 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(defaultState());

  void edit(SettingsState model) {
    emit(model);
  }

  Future<void> vibrate(HapticsType type) async {
    if (state.enableHapticFeedback && await Haptics.canVibrate()) {
      await Haptics.vibrate(type);
    }
  }

  void reset() {
    emit(defaultState());
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsStateMapper.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return state.toMap();
  }

  static SettingsState defaultState() =>
      SettingsState(theme: ThemeType.light, language: Platform.localeName.substring(0, 2) == 'fr' ? 'fr' : 'en');
}
