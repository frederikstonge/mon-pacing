import 'package:flutter/material.dart';

import '../../themes/themes.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final double contentPadding;
  final Color? borderColor;

  const CustomCard({
    super.key,
    required this.child,
    this.contentPadding = 16.0,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: borderColor != null ? Themes.getCardShapeBorder(borderColor!) : null,
      child: Padding(
        padding: EdgeInsets.all(contentPadding),
        child: child,
      ),
    );
  }
}
