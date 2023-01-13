import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/settings_model.dart';

class SettingsHelper {
  static const String settingsModelKey = "SettingsModel";

  static Future<SettingsModel> getSettingsModel() async {
    SettingsModel settings;
    final prefs = await SharedPreferences.getInstance();
    final String? settingsModelValue = prefs.getString(settingsModelKey);
    if (settingsModelValue != null) {
      try {
        settings = SettingsModel.fromJson(jsonDecode(settingsModelValue));
        return settings;
      } catch (ex) {
        // Global catch
      }
    }

    var currentLanguage = Intl.getCurrentLocale().substring(0, 2);
    if (currentLanguage != 'en' && currentLanguage != 'fr') {
      currentLanguage = 'en';
    }

    settings = SettingsModel(
      color: Colors.indigo.value,
      enablePaddingDuration: false,
      paddingDuration: const Duration(minutes: 1),
      language: currentLanguage,
    );

    await prefs.setString(settingsModelKey, jsonEncode(settings.toJson()));
    return settings;
  }
}
