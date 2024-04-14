import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';

import '../../models/theme_type.dart';
import 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit()
      : super(
          SettingsState(
            theme: ThemeType.light,
            language: Intl.getCurrentLocale().substring(0, 2) == 'fr' ? 'fr' : 'en',
          ),
        );

  void edit(SettingsState model) {
    emit(model);
  }

  Future<void> vibrate(HapticsType type) async {
    if (state.enableHapticFeedback && await Haptics.canVibrate()) {
      await Haptics.vibrate(type);
    }
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return state.toJson();
  }
}
