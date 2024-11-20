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
        builder: (context, state) {
          // Required to set the current language
          Intl.defaultLocale = state.language;
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarIconBrightness: switch (state.theme) {
                ThemeType.dark => Brightness.light,
                _ => Brightness.dark,
              },
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.transparent,
            ),
            child: ToastificationWrapper(
              config: const ToastificationConfig(
                alignment: Alignment.topCenter,
                animationDuration: Duration(milliseconds: 300),
              ),
              child: MaterialApp.router(
                onGenerateTitle: (context) => S.of(context).appTitle,
                // Theme
                theme: switch (state.theme) {
                  ThemeType.light => Themes.light(),
                  ThemeType.dark => Themes.dark(),
                  ThemeType.lni => Themes.lni(),
                },
                // Locale
                localizationsDelegates: S.localizationsDelegates,
                supportedLocales: S.supportedLocales,
                locale: Locale(state.language),
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
