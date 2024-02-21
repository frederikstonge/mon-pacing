import 'package:flutter/material.dart';

import '../../router/router.dart';

class BottomSheetDialog {
  static Future<void> showDialog({
    required BuildContext context,
    required Widget child,
  }) async {
    final bottomPadding = MediaQuery.of(rootNavigatorKey.currentContext ?? context).viewInsets.bottom > 0
        ? MediaQuery.of(rootNavigatorKey.currentContext ?? context).viewInsets.bottom
        : MediaQuery.of(rootNavigatorKey.currentContext ?? context).padding.bottom;

    await showModalBottomSheet(
      context: context,
      useRootNavigator: true,
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
