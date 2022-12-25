import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../views/settings_view.dart';
import 'ibottom_nav_page.dart';

class SettingsPage extends StatelessWidget implements IBottomNavPage {
  const SettingsPage({super.key});

  @override
  Icon get icon => const Icon(Icons.settings);

  @override
  String get title => S.current.SettingsPage_Title;

  @override
  FloatingActionButton? getFloatingActionButton(BuildContext context) => null;

  @override
  List<Widget>? getActions(BuildContext context) => null;

  @override
  Widget build(BuildContext context) {
    return const SettingsView();
  }
}
