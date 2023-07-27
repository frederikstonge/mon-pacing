import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import '../widgets/match/match_page.dart';
import '../widgets/matches/matches_page.dart';
import '../widgets/pacing/pacing_page.dart';
import '../widgets/pacings/pacings_page.dart';
import '../widgets/settings/settings_page.dart';
import '../widgets/shell/shell_page.dart';
import 'routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/pacings',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => ShellPage(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          initialLocation: '/pacings',
          routes: [
            GoRoute(
              name: Routes.pacings,
              path: '/pacings',
              pageBuilder: (context, state) => const NoTransitionPage(child: PacingsPage()),
              routes: [
                GoRoute(
                  name: Routes.pacing,
                  path: 'pacing/:id',
                  builder: (context, state) => PacingPage(id: int.parse(state.pathParameters['id']!)),
                  parentNavigatorKey: rootNavigatorKey,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: '/matches',
          routes: [
            GoRoute(
              name: Routes.matches,
              path: '/matches',
              pageBuilder: (context, state) => const NoTransitionPage(child: MatchesPage()),
              routes: [
                GoRoute(
                  name: Routes.match,
                  path: 'match/:id',
                  builder: (context, state) => MatchPage(id: int.parse(state.pathParameters['id']!)),
                  parentNavigatorKey: rootNavigatorKey,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: '/settings',
          routes: [
            GoRoute(
              name: Routes.settings,
              path: '/settings',
              pageBuilder: (context, state) => const NoTransitionPage(child: SettingsPage()),
            ),
          ],
        ),
      ],
    ),
  ],
);
