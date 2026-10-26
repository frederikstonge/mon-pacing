import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:intl/intl.dart';
import 'package:kaisel/kaisel.dart';
import 'package:material_ui/material_ui.dart';
import 'package:toastification/toastification.dart';

import 'cubits/onboarding/onboarding_cubit.dart';
import 'cubits/settings/settings_cubit.dart';
import 'cubits/settings/settings_state.dart';
import 'l10n/generated/app_localizations.dart';
import 'models/theme_type.dart';
import 'pages/categories_search/categories_search_page_shell.dart';
import 'pages/onboarding/onboarding_page_view.dart';
import 'pages/penalties_search/penalties_search_page_shell.dart';
import 'pages/scanner/scanner_page_shell.dart';
import 'pages/shell/shell_page_shell.dart';
import 'pages/tags_search/tags_search_page_shell.dart';
import 'router/router.dart';
import 'router/routes.dart';
import 'themes/themes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final KaiselRouterConfig<AppRoute> _router;

  @override
  void initState() {
    super.initState();
    final onboardingCubit = context.read<OnboardingCubit>();
    _router = KaiselRouterConfig<AppRoute>(
      initial: onboardingCubit.state.onboardingFinished ? const TabsRoute() : const OnboardingRoute(),
      guards: [
        (current, proposed) {
          if (!onboardingCubit.state.onboardingFinished && proposed.any((route) => route is! OnboardingRoute)) {
            return const [OnboardingRoute()];
          }
          return proposed;
        },
      ],
      builder: (context, route) => switch (route) {
        OnboardingRoute() => const OnboardingPageView(),
        TabsRoute() => const ShellPageShell(),
        ScannerRoute() => const ScannerPageShell(),
        CategoriesSearchRoute() => const CategoriesSearchPageShell(),
        PenaltiesSearchRoute() => const PenaltiesSearchPageShell(),
        TagsSearchRoute() => const TagsSearchPageShell(),
      },
      observers: () => [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)],
      codec: const AppRouteCodec(),
      fallback: const [TabsRoute()],
    );
  }

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
                  ThemeType.ligmaLight => Themes.ligmaLight(),
                  ThemeType.ligmaDark => Themes.ligmaDark(),
                  ThemeType.boldor => Themes.boldor(),
                  ThemeType.evenementCulturel => Themes.evenementCulturel(),
                  ThemeType.paradoxe => Themes.paradoxe(),
                },
                // Locale
                localizationsDelegates: [S.delegate, ...GlobalMaterialLocalizations.delegates],
                supportedLocales: S.supportedLocales,
                locale: Locale(settingsState.language),
                // Router
                routerConfig: _router,
                debugShowCheckedModeBanner: false,
              ),
            ),
          );
        },
      ),
    );
  }
}
