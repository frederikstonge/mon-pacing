import 'package:kaisel/kaisel.dart';

import '../router/routes.dart';

class AppNavigationService {
  final KaiselRouter<AppRoute> rootRouter;
  final BranchedShellRouter appShell;
  final KaiselRouter<PacingsRoute> pacingsRouter;
  final KaiselRouter<MatchesRoute> matchesRouter;

  const AppNavigationService({
    required this.rootRouter,
    required this.appShell,
    required this.pacingsRouter,
    required this.matchesRouter,
  });

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
}
