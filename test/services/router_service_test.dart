import 'package:flutter_test/flutter_test.dart';
import 'package:mon_pacing/router/routes.dart';
import 'package:mon_pacing/services/router_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late RouterService routerService;

  setUp(() {
    routerService = RouterService(onboardingFinished: () => true, observers: () => []);
  });

  tearDown(() {
    routerService.dispose();
  });

  test('showPacingDetails resets the root and selects the pacing branch', () async {
    final rootRouter = routerService.rootRouter;
    final shell = routerService.appShell;
    final pacingsRouter = routerService.pacingsRouter;
    await rootRouter.push(const ScannerRoute());

    await routerService.showPacingDetails(42);

    expect(rootRouter.stack, const [TabsRoute()]);
    expect(shell.activeBranch, 0);
    expect(pacingsRouter.stack, const [PacingsTabRoute(), PacingDetailsRoute(42)]);
  });

  test('showMatchDetails selects the match branch and preserves timer details', () async {
    final rootRouter = routerService.rootRouter;
    final shell = routerService.appShell;
    final matchesRouter = routerService.matchesRouter;
    await rootRouter.push(const ScannerRoute());

    await routerService.showMatchDetails(id: 21, improvisationId: 4, durationIndex: 2);

    expect(rootRouter.stack, const [TabsRoute()]);
    expect(shell.activeBranch, 1);
    expect(matchesRouter.stack, const [
      MatchesTabRoute(),
      MatchDetailsRoute(id: 21, improvisationId: 4, durationIndex: 2),
    ]);
  });

  test('replaceMatchDetails replaces only the current match detail', () async {
    final matchesRouter = routerService.matchesRouter;
    await matchesRouter.set(const [MatchesTabRoute(), MatchDetailsRoute(id: 3)]);

    await routerService.replaceMatchDetails(id: 7, improvisationId: 1);

    expect(matchesRouter.stack, const [MatchesTabRoute(), MatchDetailsRoute(id: 7, improvisationId: 1)]);
  });

  test('resetBranch resets the specified branch to its root', () async {
    final pacingsRouter = routerService.pacingsRouter;
    await pacingsRouter.set(const [PacingsTabRoute(), PacingDetailsRoute(12)]);

    await routerService.resetBranch(0);

    expect(pacingsRouter.stack, const [PacingsTabRoute()]);
  });
}
