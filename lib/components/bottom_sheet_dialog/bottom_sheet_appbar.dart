import 'package:flutter/material.dart';

class BottomSheetAppbar extends StatelessWidget {
  final Widget title;

  const BottomSheetAppbar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: NavigationToolbar(
        middle: title,
        centerMiddle: true,
      ),
    );
  }
}
