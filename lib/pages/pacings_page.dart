import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../views/pacings_view.dart';
import 'ibottom_nav_page.dart';
import 'pacing_page.dart';

class PacingsPage extends StatelessWidget implements IBottomNavPage {
  const PacingsPage({Key? key}) : super(key: key);

  @override
  Icon get icon => const Icon(Icons.list);

  @override
  String get title => S.current.PacingsPage_Title;

  @override
  FloatingActionButton? getFloatingActionButton(BuildContext context) => FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: ((context) => const PacingPage())));
        },
        tooltip: "Add pacing",
        child: const Icon(Icons.add),
      );

  @override
  Widget build(BuildContext context) {
    return PacingsView();
  }
}
