import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final double contentPadding;

  const CustomCard({
    super.key,
    required this.child,
    this.contentPadding = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(contentPadding),
        child: child,
      ),
    );
  }
}
