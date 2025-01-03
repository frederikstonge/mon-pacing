import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../cubits/settings/settings_cubit.dart';
import '../../l10n/generated/app_localizations.dart';

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
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          context.read<SettingsCubit>().vibrate(HapticsType.light);
          navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
        },
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.list),
            label: S.of(context).pacings,
          ),
          NavigationDestination(
            icon: const Icon(Icons.list_alt),
            label: S.of(context).matches,
          ),
          NavigationDestination(
            icon: const Icon(Icons.group),
            label: S.of(context).teams,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings),
            label: S.of(context).settings,
          ),
        ],
      ),
    );
  }
}
