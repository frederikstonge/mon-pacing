import 'package:flutter/material.dart';

import '../../../l10n/generated/app_localizations.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: onDestinationSelected,
      selectedIndex: selectedIndex,
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
    );
  }
}
