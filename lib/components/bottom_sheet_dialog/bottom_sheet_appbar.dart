import 'package:flutter/material.dart';

class BottomSheetAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const BottomSheetAppbar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: NavigationToolbar(
        middle: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        centerMiddle: true,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
