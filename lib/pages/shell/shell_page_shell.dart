import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import 'shell_page_view.dart';

class ShellPageShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ShellPageShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return ShellPageView(navigationShell: navigationShell);
  }
}
