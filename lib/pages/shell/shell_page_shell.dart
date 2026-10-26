import 'package:kaisel/kaisel.dart';
import 'package:material_ui/material_ui.dart';

import '../../router/router.dart';
import '../../router/routes.dart';
import '../match/match_page_shell.dart';
import '../matches/matches_page_shell.dart';
import '../matches_search/matches_search_page_shell.dart';
import '../pacing/pacing_page_shell.dart';
import '../pacings/pacings_page_shell.dart';
import '../pacings_search/pacings_search_page_shell.dart';
import '../settings/settings_page_shell.dart';
import '../teams/teams_page_shell.dart';
import '../teams_search/teams_search_page_shell.dart';
import 'shell_page_view.dart';

class ShellPageShell extends StatelessWidget {
  const ShellPageShell({super.key});

  @override
  Widget build(BuildContext context) {
    return KaiselBranchedShell(
      shell: appShell,
      branches: [
        KaiselBranch<PacingsRoute>(
          router: pacingsRouter,
          pageBuilder: (context, route) => switch (route) {
            PacingsTabRoute() => const PacingsPageShell(),
            PacingDetailsRoute(:final id) => PacingPageShell(id: id),
            PacingsSearchRoute() => const PacingsSearchPageShell(),
          },
        ),
        KaiselBranch<MatchesRoute>(
          router: matchesRouter,
          pageBuilder: (context, route) => switch (route) {
            MatchesTabRoute() => const MatchesPageShell(),
            MatchDetailsRoute(:final id, :final improvisationId, :final durationIndex) => MatchPageShell(
              id: id,
              improvisationId: improvisationId,
              durationIndex: durationIndex,
            ),
            MatchesSearchRoute() => const MatchesSearchPageShell(),
          },
        ),
        KaiselBranch<TeamsRoute>(
          router: teamsRouter,
          pageBuilder: (context, route) => switch (route) {
            TeamsTabRoute() => const TeamsPageShell(),
            TeamsSearchRoute() => const TeamsSearchPageShell(),
          },
        ),
        KaiselBranch<SettingsRoute>(
          router: settingsRouter,
          pageBuilder: (context, route) => switch (route) {
            SettingsTabRoute() => const SettingsPageShell(),
          },
        ),
      ],
      chromeBuilder: (context, activeBranch, branchContent, switchBranch) {
        final showNavigation = switch ((activeBranch, appShell.current.stack.last)) {
          (0, PacingsTabRoute()) => true,
          (1, MatchesTabRoute()) => true,
          (2, TeamsTabRoute()) => true,
          (3, SettingsTabRoute()) => true,
          _ => false,
        };
        return ShellPageView(
          activeBranch: activeBranch,
          branchContent: branchContent,
          switchBranch: switchBranch,
          showNavigation: showNavigation,
        );
      },
    );
  }
}
