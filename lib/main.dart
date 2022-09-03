import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'generated/l10n.dart';
import 'cubits/matches_cubit.dart';
import 'cubits/settings_cubit.dart';
import 'helpers/material_color_helper.dart';
import 'models/settings_model.dart';
import 'pages/matches_page.dart';
import 'pages/pacings_page.dart';
import 'pages/settings_page.dart';
import 'cubits/pacings_cubit.dart';
import 'pages/home_page.dart';
import 'repositories/matches_repository.dart';
import 'repositories/pacings_repository.dart';

String settingsModelKey = "SettingsModel";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var settingsModel = await getSettingsModel();
  runApp(MyApp(model: settingsModel));
}

Future<SettingsModel> getSettingsModel() async {
  final prefs = await SharedPreferences.getInstance();
  final String? settingsModelValue = prefs.getString(settingsModelKey);
  if (settingsModelValue == null) {
    var settings = SettingsModel(
      color: Colors.indigo.value,
      enablePaddingDuration: false,
      paddingDuration: const Duration(minutes: 1),
    );

    await prefs.setString(settingsModelKey, jsonEncode(settings.toJson()));
    return settings;
  }

  return SettingsModel.fromJson(jsonDecode(settingsModelValue));
}

class MyApp extends StatelessWidget {
  final SettingsModel model;
  const MyApp({Key? key, required this.model}) : super(key: key);

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
        ],
        child: BlocBuilder<SettingsCubit, SettingsModel>(
          builder: (context, state) => MaterialApp(
            title: 'Mon Pacing',
            theme: ThemeData(
              primarySwatch: generateMaterialColor(color: Color(state.color)),
              brightness: Brightness.light,
            ),
            debugShowCheckedModeBanner: false,
            home: const HomePage(
              pages: [
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
          ),
        ),
      ),
    );
  }
}
