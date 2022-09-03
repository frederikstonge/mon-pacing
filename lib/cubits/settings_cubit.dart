import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monpacing/models/settings_model.dart';

class SettingsCubit extends Cubit<SettingsModel> {
  SettingsCubit() : super(SettingsModel(darkTheme: false, color: Colors.indigo.value));

  void setColor(Color color) {
    state.color = color.value;
    emit(state);
  }
}
