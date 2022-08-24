import 'package:flutter/material.dart';

abstract class IBottomNavPage extends Widget {
  const IBottomNavPage({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final Icon icon;

  FloatingActionButton? getFloatingActionButton(BuildContext context);
}
