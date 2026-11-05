import 'package:flutter_test/flutter_test.dart';
import 'package:mon_pacing/router/routes.dart';
import 'package:mon_pacing/services/app_navigation_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppNavigationService navigationService;

  setUp(() {
    navigationService = AppNavigationService(onboardingFinished: () => true, observers: () => []);
  });

  tearDown(() {
    navigationService.dispose();
  });

  test('showPacingDetails resets the root and selects the pacing branch', () async {
    final rootRouter = navigationService.rootRouter;
    final shell = navigationService.appShell;
    final pacingsRouter = navigationService.pacingsRouter;
    await rootRouter.push(const ScannerRoute());

    await navigationService.showPacingDetails(42);

    expect(rootRouter.stack, const [TabsRoute()]);
    expect(shell.activeBranch, 0);
    expect(pacingsRouter.stack, const [PacingsTabRoute(), PacingDetailsRoute(42)]);
  });

  test('showMatchDetails selects the match branch and preserves timer details', () async {
    final rootRouter = navigationService.rootRouter;
    final shell = navigationService.appShell;
    final matchesRouter = navigationService.matchesRouter;
    await rootRouter.push(const ScannerRoute());

    await navigationService.showMatchDetails(id: 21, improvisationId: 4, durationIndex: 2);

    expect(rootRouter.stack, const [TabsRoute()]);
    expect(shell.activeBranch, 1);
    expect(matchesRouter.stack, const [
      MatchesTabRoute(),
      MatchDetailsRoute(id: 21, improvisationId: 4, durationIndex: 2),
    ]);
  });

  test('replaceMatchDetails replaces only the current match detail', () async {
    final matchesRouter = navigationService.matchesRouter;
    await matchesRouter.set(const [MatchesTabRoute(), MatchDetailsRoute(id: 3)]);

    await navigationService.replaceMatchDetails(id: 7, improvisationId: 1);

    expect(matchesRouter.stack, const [MatchesTabRoute(), MatchDetailsRoute(id: 7, improvisationId: 1)]);
  });
}
