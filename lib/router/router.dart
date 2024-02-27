import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/matches/matches_page_shell.dart';
import '../pages/pacing/pacing_page_shell.dart';
import '../pages/pacings/pacings_page_shell.dart';
import '../pages/settings/settings_page_shell.dart';
import '../pages/shell/shell_page_shell.dart';
import 'routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/pacings',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ShellPageShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          initialLocation: '/pacings',
          routes: [
            GoRoute(
              name: Routes.pacings,
              path: '/pacings',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: PacingsPageShell());
              },
              routes: [
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  name: Routes.pacing,
                  path: 'details/:id',
                  builder: (context, state) => PacingPageShell(
                    id: int.parse(state.pathParameters['id']!),
                  ),
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
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: MatchesPageShell());
              },
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: '/settings',
          routes: [
            GoRoute(
              name: Routes.settings,
              path: '/settings',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: SettingsPageShell());
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
