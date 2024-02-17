import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/app_localizations.dart';

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
        onDestinationSelected: (index) async {
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
            icon: const Icon(Icons.settings),
            label: S.of(context).settings,
          ),
        ],
      ),
    );
  }
}
