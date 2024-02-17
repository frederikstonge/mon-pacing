import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';

import 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit()
      : super(
          SettingsState(
            themeMode: ThemeMode.light,
            enableDefaultPaddingDuration: false,
            defaultPaddingDuration: const Duration(minutes: 1),
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
