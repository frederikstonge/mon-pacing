import 'package:flutter/material.dart';

abstract class IBottomNavPage extends Widget {
  const IBottomNavPage({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final Icon icon;

  FloatingActionButton? getFloatingActionButton(BuildContext context);

  List<Widget>? getActions(BuildContext context);
}
