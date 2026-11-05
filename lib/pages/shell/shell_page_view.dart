import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:material_ui/material_ui.dart';

import '../../cubits/settings/settings_cubit.dart';
import '../../router/routes.dart';
import '../../services/app_navigation_service.dart';
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
                  final navigationService = context.read<AppNavigationService>();
                  switch (index) {
                    case 0:
                      navigationService.pacingsRouter.set(const [PacingsTabRoute()]);
                    case 1:
                      navigationService.matchesRouter.set(const [MatchesTabRoute()]);
                    case 2:
                      navigationService.teamsRouter.set(const [TeamsTabRoute()]);
                    case 3:
                      navigationService.settingsRouter.set(const [SettingsTabRoute()]);
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
