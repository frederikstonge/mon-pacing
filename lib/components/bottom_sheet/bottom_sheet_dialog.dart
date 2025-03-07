import 'package:flutter/material.dart';

class BottomSheetDialog {
  static Future<T?> showDialog<T>({required BuildContext context, required Widget child}) async {
    return await showModalBottomSheet(
      barrierColor: Theme.of(context).colorScheme.onSurface.withAlpha(100),
      context: context,
      useRootNavigator: true,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) {
        final mediaQuery = MediaQuery.of(context);
        final bottomPadding =
            mediaQuery.viewInsets.bottom > 0 ? mediaQuery.viewInsets.bottom : mediaQuery.padding.bottom;
        return Padding(
          padding: EdgeInsets.only(bottom: bottomPadding),
          child: Column(mainAxisSize: MainAxisSize.min, children: [Flexible(child: child)]),
        );
      },
    );
  }
}
