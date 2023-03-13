import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';

import '../models/settings_model.dart';

class SettingsCubit extends HydratedCubit<SettingsModel> {
  SettingsCubit()
      : super(
          SettingsModel(
            color: Colors.indigo.value,
            enableDefaultPaddingDuration: false,
            defaultPaddingDuration: const Duration(minutes: 1),
            language: Intl.getCurrentLocale().substring(0, 2) == 'fr' ? 'fr' : 'en',
          ),
        );

  void edit(SettingsModel model) {
    emit(model);
  }

  @override
  SettingsModel? fromJson(Map<String, dynamic> json) {
    return SettingsModel.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SettingsModel state) {
    return state.toJson();
  }
}
