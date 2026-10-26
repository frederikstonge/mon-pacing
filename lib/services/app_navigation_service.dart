import 'package:flutter/material.dart';
import 'package:kaisel/kaisel.dart';

import '../pages/categories_search/categories_search_page_shell.dart';
import '../pages/onboarding/onboarding_page_view.dart';
import '../pages/penalties_search/penalties_search_page_shell.dart';
import '../pages/scanner/scanner_page_shell.dart';
import '../pages/shell/shell_page_shell.dart';
import '../pages/tags_search/tags_search_page_shell.dart';
import '../router/router.dart';
import '../router/routes.dart';

class AppNavigationService {
  AppNavigationService({
    required bool Function() onboardingFinished,
    required List<NavigatorObserver> Function() observers,
  }) {
    pacingsRouter = KaiselRouter<PacingsRoute>(initial: const PacingsTabRoute());
    matchesRouter = KaiselRouter<MatchesRoute>(initial: const MatchesTabRoute());
    teamsRouter = KaiselRouter<TeamsRoute>(initial: const TeamsTabRoute());
    settingsRouter = KaiselRouter<SettingsRoute>(initial: const SettingsTabRoute());
    appShell = BranchedShellRouter(branches: [pacingsRouter, matchesRouter, teamsRouter, settingsRouter]);
    routerConfig = KaiselRouterConfig<AppRoute>(
      initial: onboardingFinished() ? const TabsRoute() : const OnboardingRoute(),
      guards: [
        (current, proposed) {
          if (!onboardingFinished() && proposed.any((route) => route is! OnboardingRoute)) {
            return const [OnboardingRoute()];
          }
          return proposed;
        },
      ],
      builder: _buildRoute,
      observers: observers,
      codec: const AppRouteCodec(),
      fallback: const [TabsRoute()],
    );
  }

  late final KaiselRouter<PacingsRoute> pacingsRouter;
  late final KaiselRouter<MatchesRoute> matchesRouter;
  late final KaiselRouter<TeamsRoute> teamsRouter;
  late final KaiselRouter<SettingsRoute> settingsRouter;
  late final BranchedShellRouter appShell;
  late final KaiselRouterConfig<AppRoute> routerConfig;

  KaiselRouter<AppRoute> get rootRouter => routerConfig.router;

  void dispose() {
    routerConfig.dispose();
    appShell.dispose();
    pacingsRouter.dispose();
    matchesRouter.dispose();
    teamsRouter.dispose();
    settingsRouter.dispose();
  }

  Future<void> showPacingDetails(int id) async {
    await rootRouter.set(const [TabsRoute()]);
    appShell.switchTo(0);
    await pacingsRouter.set([const PacingsTabRoute(), PacingDetailsRoute(id)]);
  }

  Future<void> showMatchDetails({required int id, int? improvisationId, int? durationIndex}) async {
    await rootRouter.set(const [TabsRoute()]);
    appShell.switchTo(1);
    await matchesRouter.set([
      const MatchesTabRoute(),
      MatchDetailsRoute(id: id, improvisationId: improvisationId, durationIndex: durationIndex),
    ]);
  }

  Future<void> replaceMatchDetails({required int id, int? improvisationId, int? durationIndex}) {
    return matchesRouter.replaceTop(
      MatchDetailsRoute(id: id, improvisationId: improvisationId, durationIndex: durationIndex),
    );
  }

  Widget _buildRoute(BuildContext context, AppRoute route) => switch (route) {
    OnboardingRoute() => const OnboardingPageView(),
    TabsRoute() => const ShellPageShell(),
    ScannerRoute() => const ScannerPageShell(),
    CategoriesSearchRoute() => const CategoriesSearchPageShell(),
    PenaltiesSearchRoute() => const PenaltiesSearchPageShell(),
    TagsSearchRoute() => const TagsSearchPageShell(),
  };
}
