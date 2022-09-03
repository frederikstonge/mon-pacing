import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
            create: (blocContext) => SettingsCubit(),
          ),
        ],
        child: BlocBuilder<SettingsCubit, SettingsModel>(
          builder: (context, state) => MaterialApp(
            title: 'Mon Pacing',
            theme: ThemeData(
              primarySwatch: generateMaterialColor(color: Color(state.color)),
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              primaryColor: generateMaterialColor(color: Color(state.color)),
              brightness: Brightness.dark,
            ),
            themeMode: state.darkTheme ? ThemeMode.dark : ThemeMode.light,
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
