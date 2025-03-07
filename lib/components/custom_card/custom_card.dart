import 'package:flutter/material.dart';

import '../../themes/themes.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final double contentPadding;
  final bool showIndicator;
  final Color? indicatorColor;

  const CustomCard({
    super.key,
    required this.child,
    this.contentPadding = 16.0,
    this.showIndicator = false,
    this.indicatorColor,
  }) : assert(!showIndicator || indicatorColor != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: showIndicator && indicatorColor != null ? Themes.getCardShapeBorder(indicatorColor!) : null,
      child: Container(
        padding: EdgeInsets.all(contentPadding),
        decoration:
            showIndicator && indicatorColor != null
                ? BoxDecoration(border: Border(left: BorderSide(color: indicatorColor!, width: 6)))
                : null,
        child: child,
      ),
    );
  }
}
