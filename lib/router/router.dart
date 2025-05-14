import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/categories_search/categories_search_page_view.dart';
import '../pages/match/match_page_shell.dart';
import '../pages/matches/matches_page_shell.dart';
import '../pages/pacing/pacing_page_shell.dart';
import '../pages/pacings/pacings_page_shell.dart';
import '../pages/scanner/scanner_page_shell.dart';
import '../pages/settings/settings_page_shell.dart';
import '../pages/shell/shell_page_shell.dart';
import '../pages/tags_search/tags_search_page_view.dart';
import '../pages/teams/teams_page_shell.dart';
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
                return NoTransitionPage(child: PacingsPageShell(key: state.pageKey));
              },
              routes: [
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  name: Routes.pacing,
                  path: 'details/:id',
                  builder:
                      (context, state) =>
                          PacingPageShell(key: state.pageKey, id: int.parse(state.pathParameters['id']!)),
                ),
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  name: Routes.pacingsSearch,
                  path: 'search',
                  builder:
                      (context, state) =>
                          PacingPageShell(key: state.pageKey, id: int.parse(state.pathParameters['id']!)),
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
                return NoTransitionPage(child: MatchesPageShell(key: state.pageKey));
              },
              routes: [
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  name: Routes.match,
                  path: 'details/:id',
                  builder: (context, state) {
                    final improvisationIdQuery = state.uri.queryParameters['improvisationId'];
                    final improvisationId = improvisationIdQuery != null ? int.parse(improvisationIdQuery) : null;
                    final durationIndexQuery = state.uri.queryParameters['durationIndex'];
                    final durationIndex = durationIndexQuery != null ? int.parse(durationIndexQuery) : null;
                    return MatchPageShell(
                      key: state.pageKey,
                      id: int.parse(state.pathParameters['id']!),
                      improvisationId: improvisationId,
                      durationIndex: durationIndex,
                    );
                  },
                ),
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  name: Routes.matchesSearch,
                  path: 'search',
                  builder:
                      (context, state) =>
                          PacingPageShell(key: state.pageKey, id: int.parse(state.pathParameters['id']!)),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: '/teams',
          routes: [
            GoRoute(
              name: Routes.teams,
              path: '/teams',
              pageBuilder: (context, state) {
                return NoTransitionPage(child: TeamsPageShell(key: state.pageKey));
              },
              routes: [
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  name: Routes.teamsSearch,
                  path: 'search',
                  builder:
                      (context, state) =>
                          PacingPageShell(key: state.pageKey, id: int.parse(state.pathParameters['id']!)),
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
              pageBuilder: (context, state) {
                return NoTransitionPage(child: SettingsPageShell(key: state.pageKey));
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(name: Routes.scanner, path: '/scanner', builder: (context, state) => const ScannerPageShell()),
    GoRoute(
      name: Routes.categoriesSearch,
      path: '/categories/search',
      builder: (context, state) => CategoriesSearchPageView(key: state.pageKey),
    ),
    GoRoute(
      name: Routes.tagsSearch,
      path: '/tags/search',
      builder: (context, state) => TagsSearchPageView(key: state.pageKey),
    ),
  ],
);
