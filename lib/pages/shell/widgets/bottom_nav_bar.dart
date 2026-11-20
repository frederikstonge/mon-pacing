import 'package:material_ui/material_ui.dart';

import '../../../l10n/generated/app_localizations.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;

  const BottomNavBar({super.key, required this.selectedIndex, required this.onDestinationSelected});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: onDestinationSelected,
      selectedIndex: selectedIndex,
      destinations: [
        NavigationDestination(icon: const Icon(Icons.list), label: S.of(context).pacings),
        NavigationDestination(icon: const Icon(Icons.list_alt), label: S.of(context).matches),
        NavigationDestination(icon: const Icon(Icons.group), label: S.of(context).teams),
        NavigationDestination(icon: const Icon(Icons.settings), label: S.of(context).settings),
      ],
    );
  }
}

class AppNavigationRail extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const AppNavigationRail({super.key, required this.selectedIndex, required this.onDestinationSelected});

  @override
  Widget build(BuildContext context) {
    final localizer = S.of(context);
    return NavigationRail(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      labelType: NavigationRailLabelType.all,
      destinations: [
        NavigationRailDestination(icon: const Icon(Icons.list), label: Text(localizer.pacings)),
        NavigationRailDestination(icon: const Icon(Icons.list_alt), label: Text(localizer.matches)),
        NavigationRailDestination(icon: const Icon(Icons.group), label: Text(localizer.teams)),
        NavigationRailDestination(icon: const Icon(Icons.settings), label: Text(localizer.settings)),
      ],
    );
  }
}
