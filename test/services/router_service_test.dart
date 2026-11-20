import 'package:flutter_test/flutter_test.dart';
import 'package:mon_pacing/models/theme_type.dart';
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
    expect(pacingsRouter.stack, const [PacingsTabRoute(), PacingRoute(42)]);
  });

  test('showMatchDetails selects the match branch and preserves timer details', () async {
    final rootRouter = routerService.rootRouter;
    final shell = routerService.appShell;
    final matchesRouter = routerService.matchesRouter;
    await rootRouter.push(const ScannerRoute());

    await routerService.showMatchDetails(id: 21, improvisationId: 4, durationIndex: 2);

    expect(rootRouter.stack, const [TabsRoute()]);
    expect(shell.activeBranch, 1);
    expect(matchesRouter.stack, const [MatchesTabRoute(), MatchRoute(id: 21, improvisationId: 4, durationIndex: 2)]);
  });

  test('replaceMatchDetails replaces only the current match detail', () async {
    final matchesRouter = routerService.matchesRouter;
    await matchesRouter.set(const [MatchesTabRoute(), MatchRoute(id: 3)]);

    await routerService.replaceMatchDetails(id: 7, improvisationId: 1);

    expect(matchesRouter.stack, const [MatchesTabRoute(), MatchRoute(id: 7, improvisationId: 1)]);
  });

  test('resetBranch resets the specified branch to its root', () async {
    final pacingsRouter = routerService.pacingsRouter;
    await pacingsRouter.set(const [PacingsTabRoute(), PacingRoute(12)]);

    await routerService.resetBranch(0);

    expect(pacingsRouter.stack, const [PacingsTabRoute()]);
  });

  test('duration picker modal returns its selected value', () async {
    final result = routerService.showDurationPickerModal(
      title: 'Duration',
      initialDuration: const Duration(minutes: 1),
    );

    await Future<void>.delayed(Duration.zero);
    routerService.rootRouter.completeFlow(const Duration(seconds: 45));

    expect(await result, const Duration(seconds: 45));
  });

  test('modal flows resolve independently in nested order', () async {
    final outer = routerService.showThemeModal(ThemeType.light);
    await Future<void>.delayed(Duration.zero);
    final inner = routerService.showDurationPickerModal(title: 'Duration', initialDuration: const Duration(minutes: 1));
    await Future<void>.delayed(Duration.zero);

    routerService.rootRouter.completeFlow(const Duration(seconds: 30));
    expect(await inner, const Duration(seconds: 30));

    routerService.rootRouter.completeFlow(ThemeType.dark);
    expect(await outer, ThemeType.dark);
  });

  test('menu modal returns the selected action', () async {
    final result = routerService.showShareMenuModal(showShareFile: true);

    await Future<void>.delayed(Duration.zero);
    routerService.rootRouter.completeFlow(ShareMenuAction.shareFile);

    expect(await result, ShareMenuAction.shareFile);
  });
}
