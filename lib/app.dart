import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';
import 'helpers/material_color_helper.dart';
import 'models/settings_model.dart';
import 'widgets/home/home_page.dart';
import 'widgets/matches/matches_page.dart';
import 'widgets/pacings/pacings_page.dart';
import 'widgets/settings/settings_cubit.dart';
import 'widgets/settings/settings_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsModel>(
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
        locale: Locale(state.language),
      ),
    );
  }
}
