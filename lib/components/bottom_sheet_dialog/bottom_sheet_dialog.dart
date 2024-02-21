import 'package:flutter/material.dart';

class BottomSheetDialog {
  static Future<void> showDialog({
    required BuildContext context,
    required Widget child,
    bool showDragHandle = false,
  }) async {
    final bottomPadding =
        MediaQuery.of(context).viewInsets.bottom > 0 ? MediaQuery.of(context).viewInsets.bottom : MediaQuery.of(context).padding.bottom;

    await showModalBottomSheet(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      context: context,
      useRootNavigator: true,
      enableDrag: showDragHandle,
      showDragHandle: showDragHandle,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: child),
          ],
        ),
      ),
    );
  }
}
