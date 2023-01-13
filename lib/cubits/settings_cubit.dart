import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/settings_helper.dart';
import '../models/settings_model.dart';

class SettingsCubit extends Cubit<SettingsModel> {
  SettingsCubit({required SettingsModel model}) : super(model);

  Future<void> edit(SettingsModel model) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(SettingsHelper.settingsModelKey, jsonEncode(model.toJson()));
    emit(model);
  }
}
