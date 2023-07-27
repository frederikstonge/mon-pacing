import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'shell_view.dart';

class ShellPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ShellPage({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return HomeView(navigationShell: navigationShell);
  }
}
