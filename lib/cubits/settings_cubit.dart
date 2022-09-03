import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/settings_model.dart';

class SettingsCubit extends Cubit<SettingsModel> {
  SettingsCubit()
      : super(SettingsModel(
          color: Colors.indigo.value,
          enablePaddingDuration: false,
          paddingDuration: const Duration(minutes: 1),
        ));

  void edit(SettingsModel model) {
    emit(model);
  }
}
