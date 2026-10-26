import 'package:flutter_test/flutter_test.dart';
import 'package:kaisel/kaisel.dart';
import 'package:mon_pacing/router/routes.dart';
import 'package:mon_pacing/services/app_navigation_service.dart';

void main() {
  late KaiselRouter<AppRoute> rootRouter;
  late KaiselRouter<PacingsRoute> pacingsRouter;
  late KaiselRouter<MatchesRoute> matchesRouter;
  late KaiselRouter<TeamsRoute> teamsRouter;
  late KaiselRouter<SettingsRoute> settingsRouter;
  late BranchedShellRouter shell;
  late AppNavigationService navigationService;

  setUp(() {
    rootRouter = KaiselRouter<AppRoute>(initial: const ScannerRoute());
    pacingsRouter = KaiselRouter<PacingsRoute>(initial: const PacingsTabRoute());
    matchesRouter = KaiselRouter<MatchesRoute>(initial: const MatchesTabRoute());
    teamsRouter = KaiselRouter<TeamsRoute>(initial: const TeamsTabRoute());
    settingsRouter = KaiselRouter<SettingsRoute>(initial: const SettingsTabRoute());
    shell = BranchedShellRouter(branches: [pacingsRouter, matchesRouter, teamsRouter, settingsRouter]);
    navigationService = AppNavigationService(
      rootRouter: rootRouter,
      appShell: shell,
      pacingsRouter: pacingsRouter,
      matchesRouter: matchesRouter,
    );
  });

  tearDown(() {
    shell.dispose();
    rootRouter.dispose();
    pacingsRouter.dispose();
    matchesRouter.dispose();
    teamsRouter.dispose();
    settingsRouter.dispose();
  });

  test('showPacingDetails resets the root and selects the pacing branch', () async {
    await navigationService.showPacingDetails(42);

    expect(rootRouter.stack, const [TabsRoute()]);
    expect(shell.activeBranch, 0);
    expect(pacingsRouter.stack, const [PacingsTabRoute(), PacingDetailsRoute(42)]);
  });

  test('showMatchDetails selects the match branch and preserves timer details', () async {
    await navigationService.showMatchDetails(id: 21, improvisationId: 4, durationIndex: 2);

    expect(rootRouter.stack, const [TabsRoute()]);
    expect(shell.activeBranch, 1);
    expect(matchesRouter.stack, const [
      MatchesTabRoute(),
      MatchDetailsRoute(id: 21, improvisationId: 4, durationIndex: 2),
    ]);
  });

  test('replaceMatchDetails replaces only the current match detail', () async {
    await matchesRouter.set(const [MatchesTabRoute(), MatchDetailsRoute(id: 3)]);

    await navigationService.replaceMatchDetails(id: 7, improvisationId: 1);

    expect(matchesRouter.stack, const [MatchesTabRoute(), MatchDetailsRoute(id: 7, improvisationId: 1)]);
  });
}
