import 'package:flutter/material.dart';

class TeamColorAvatar extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final double borderWidth;

  const TeamColorAvatar({
    super.key,
    required this.color,
    this.height = 16,
    this.width = 16,
    this.borderWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).colorScheme.onPrimary,
            width: borderWidth,
          ),
        ),
        child: CircleAvatar(
          backgroundColor: color,
        ),
      ),
    );
  }
}
