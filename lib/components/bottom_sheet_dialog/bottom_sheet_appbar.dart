import 'package:flutter/material.dart';

class BottomSheetAppbar extends StatelessWidget {
  final Widget title;
  final Widget? leading;
  final Widget? trailing;

  const BottomSheetAppbar({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: NavigationToolbar(
        middle: title,
        centerMiddle: true,
        leading: leading,
        trailing: trailing,
      ),
    );
  }
}
