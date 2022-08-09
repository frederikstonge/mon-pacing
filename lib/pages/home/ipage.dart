import 'package:flutter/material.dart';

abstract class IPage extends Widget {
  const IPage(
      {Key? key,
      required this.title,
      required this.icon,
      this.floatingActionButton})
      : super(key: key);

  final String title;
  final Icon icon;
  final FloatingActionButton? floatingActionButton;
}
