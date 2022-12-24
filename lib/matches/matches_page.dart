import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import 'matches_view.dart';
import '../home/ibottom_nav_page.dart';

class MatchesPage extends StatelessWidget implements IBottomNavPage {
  const MatchesPage({super.key});

  @override
  Icon get icon => const Icon(Icons.list_alt);

  @override
  String get title => S.current.MatchesPage_Title;

  @override
  FloatingActionButton? getFloatingActionButton(BuildContext context) => null;

  @override
  List<Widget>? getActions(BuildContext context) => null;

  @override
  Widget build(BuildContext context) {
    return MatchesView();
  }
}
