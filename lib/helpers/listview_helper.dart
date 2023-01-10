import 'package:flutter/material.dart';

class ListViewHelper {
  static EdgeInsets? getFloatingActionButtonPadding(BuildContext context) {
    if (Scaffold.of(context).hasFloatingActionButton) {
      return const EdgeInsets.only(bottom: kFloatingActionButtonMargin + 48);
    }

    return null;
  }
}
