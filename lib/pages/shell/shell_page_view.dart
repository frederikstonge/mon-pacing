import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:material_ui/material_ui.dart';

import '../../cubits/settings/settings_cubit.dart';
import '../../router/router.dart';
import '../../router/routes.dart';
import 'widgets/bottom_nav_bar.dart';

class ShellPageView extends StatelessWidget {
  final int activeBranch;
  final Widget branchContent;
  final void Function(int branch) switchBranch;
  final bool showNavigation;

  const ShellPageView({
    super.key,
    required this.activeBranch,
    required this.branchContent,
    required this.switchBranch,
    required this.showNavigation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: branchContent,
      bottomNavigationBar: showNavigation
          ? BottomNavBar(
              onDestinationSelected: (index) {
                context.read<SettingsCubit>().vibrate(HapticsType.light);
                if (index == activeBranch) {
                  switch (index) {
                    case 0:
                      pacingsRouter.set(const [PacingsTabRoute()]);
                    case 1:
                      matchesRouter.set(const [MatchesTabRoute()]);
                    case 2:
                      teamsRouter.set(const [TeamsTabRoute()]);
                    case 3:
                      settingsRouter.set(const [SettingsTabRoute()]);
                  }
                }
                switchBranch(index);
              },
              selectedIndex: activeBranch,
            )
          : null,
    );
  }
}
