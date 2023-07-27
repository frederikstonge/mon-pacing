import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/generated/l10n.dart';

class HomeView extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const HomeView({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            navigationShell.goBranch(value);
          },
          currentIndex: navigationShell.currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.list),
              label: S.of(context).PacingsPage_Title,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.list_alt),
              label: S.of(context).MatchesPage_Title,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: S.of(context).SettingsPage_Title,
            )
          ],
        ));
  }
}
