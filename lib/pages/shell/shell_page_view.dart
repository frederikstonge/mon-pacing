import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../cubits/settings/settings_cubit.dart';
import 'widgets/bottom_nav_bar.dart';

class ShellPageView extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ShellPageView({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavBar(
        onDestinationSelected: (index) {
          context.read<SettingsCubit>().vibrate(HapticsType.light);
          navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
        },
        selectedIndex: navigationShell.currentIndex,
      ),
    );
  }
}
