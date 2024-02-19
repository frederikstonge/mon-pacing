import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'cubits/settings/settings_cubit.dart';
import 'cubits/settings/settings_state.dart';
import 'l10n/app_localizations.dart';
import 'router/router.dart';
import 'themes/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarIconBrightness: switch (state.themeMode) {
              ThemeMode.dark => Brightness.light,
              ThemeMode.light => Brightness.dark,
              ThemeMode.system => MediaQuery.of(context).platformBrightness != Brightness.dark ? Brightness.dark : Brightness.light,
            },
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
          ),
          child: MaterialApp.router(
            onGenerateTitle: (context) => S.of(context).appTitle,
            // Theme
            themeMode: state.themeMode,
            theme: Themes.light(),
            // Locale
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'), // English
              Locale('fr'), // Spanish
            ],
            locale: Locale(state.language),
            // Router
            routerConfig: router,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
