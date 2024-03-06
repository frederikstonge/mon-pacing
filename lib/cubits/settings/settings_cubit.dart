import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';

import '../../models/theme_type.dart';
import 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit()
      : super(
          SettingsState(
            theme: ThemeType.light,
            defaultImprovisationDurationInSeconds: const Duration(minutes: 2, seconds: 30).inSeconds,
            enableDefaultTimeBuffer: false,
            defaultTimeBufferInSeconds: const Duration(minutes: 1).inSeconds,
            language: Intl.getCurrentLocale().substring(0, 2) == 'fr' ? 'fr' : 'en',
          ),
        );

  void edit(SettingsState model) {
    emit(model);
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
