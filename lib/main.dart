import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cubits/home_cubit.dart';
import 'generated/l10n.dart';
import 'cubits/matches_cubit.dart';
import 'cubits/settings_cubit.dart';
import 'helpers/material_color_helper.dart';
import 'models/settings_model.dart';
import 'pages/home_page.dart';
import 'pages/matches_page.dart';
import 'pages/pacings_page.dart';
import 'pages/settings_page.dart';
import 'cubits/pacings_cubit.dart';
import 'repositories/matches_repository.dart';
import 'repositories/pacings_repository.dart';

const String settingsModelKey = "SettingsModel";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var settingsModel = await getSettingsModel();
  runApp(MyApp(model: settingsModel));
}

Future<SettingsModel> getSettingsModel() async {
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

class MyApp extends StatelessWidget {
  final SettingsModel model;
  const MyApp({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => PacingsRepository(),
        ),
        RepositoryProvider(
          create: (_) => MatchesRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (blocContext) => PacingsCubit(repository: blocContext.read<PacingsRepository>()),
          ),
          BlocProvider(
            create: (blocContext) => MatchesCubit(repository: blocContext.read<MatchesRepository>()),
          ),
          BlocProvider(
            create: (blocContext) => SettingsCubit(model: model),
          ),
          BlocProvider(
            create: (context) => HomeCubit(),
          ),
        ],
        child: BlocBuilder<SettingsCubit, SettingsModel>(
          builder: (context, state) => MaterialApp(
            title: 'Mon Pacing',
            theme: ThemeData(
              primarySwatch: MaterialColorHelper.generateMaterialColor(color: Color(state.color)),
              brightness: Brightness.light,
            ),
            debugShowCheckedModeBanner: false,
            // ignore: prefer_const_constructors
            home: HomePage(
              pages: const [
                PacingsPage(),
                MatchesPage(),
                SettingsPage(),
              ],
            ),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: Locale(model.language),
          ),
        ),
      ),
    );
  }
}
