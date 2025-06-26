import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';

import 'cubits/settings/settings_cubit.dart';
import 'cubits/settings/settings_state.dart';
import 'l10n/generated/app_localizations.dart';
import 'models/theme_type.dart';
import 'router/router.dart';
import 'themes/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return WithForegroundTask(
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, settingsState) {
          // Required to set the current language
          Intl.defaultLocale = settingsState.language;
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarIconBrightness: switch (settingsState.theme) {
                ThemeType.dark => Brightness.light,
                _ => Brightness.dark,
              },
              statusBarBrightness: switch (settingsState.theme) {
                ThemeType.dark => Brightness.dark,
                _ => Brightness.light,
              },
              systemNavigationBarIconBrightness: switch (settingsState.theme) {
                ThemeType.dark => Brightness.light,
                _ => Brightness.dark,
              },
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.transparent,
              systemNavigationBarDividerColor: Colors.transparent,
            ),
            child: ToastificationWrapper(
              config: const ToastificationConfig(
                alignment: Alignment.topCenter,
                animationDuration: Duration(milliseconds: 300),
              ),
              child: MaterialApp.router(
                onGenerateTitle: (context) => S.of(context).appTitle,
                // Theme
                theme: switch (settingsState.theme) {
                  ThemeType.light => Themes.light(),
                  ThemeType.dark => Themes.dark(),
                  ThemeType.lni => Themes.lni(),
                  ThemeType.ligma => Themes.ligma(),
                },
                // Locale
                localizationsDelegates: S.localizationsDelegates,
                supportedLocales: S.supportedLocales,
                locale: Locale(settingsState.language),
                // Router
                routerConfig: router,
                debugShowCheckedModeBanner: false,
              ),
            ),
          );
        },
      ),
    );
  }
}
