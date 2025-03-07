import 'package:flutter/material.dart';
import 'package:mon_pacing/pages/shell/widgets/bottom_nav_bar.dart';

class ShellWrapper extends StatelessWidget {
  final Widget body;
  final int selectedIndex;

  const ShellWrapper({super.key, required this.body, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: BottomNavBar(onDestinationSelected: (index) {}, selectedIndex: selectedIndex),
    );
  }
}
