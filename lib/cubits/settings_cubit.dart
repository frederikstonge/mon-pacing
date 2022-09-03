import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/settings_model.dart';

class SettingsCubit extends Cubit<SettingsModel> {
  SettingsCubit()
      : super(SettingsModel(
          enableDarkTheme: false,
          color: Colors.indigo.value,
          enablePaddingDuration: false,
          paddingDuration: const Duration(minutes: 1),
        ));

  void setColor(Color color) {
    emit(state.copyWith(color: color.value));
  }
}
