import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mon_pacing/bootstrapper.dart';
import 'package:mon_pacing/cubits/settings/settings_cubit.dart';
import 'package:mon_pacing/cubits/settings/settings_state.dart';
import 'package:mon_pacing/l10n/app_localizations.dart';
import 'package:mon_pacing/models/theme_type.dart';
import 'package:mon_pacing/router/router.dart';
import 'package:mon_pacing/themes/themes.dart';
import 'package:toastification/toastification.dart';

Widget getAppWrapper(Widget child, {List<Object> overrides = const []}) {
  return Bootstrapper(
    overrides: overrides,
    child: BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
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
            child: MaterialApp(
              navigatorKey: rootNavigatorKey,
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
              debugShowCheckedModeBanner: false,
              // Child
              home: child,
            ),
          ),
        );
      },
    ),
  );
}
