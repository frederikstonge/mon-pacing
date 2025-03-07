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
        final bottomPadding =
            MediaQuery.viewInsetsOf(context).bottom > 0
                ? MediaQuery.viewInsetsOf(context).bottom
                : MediaQuery.paddingOf(context).bottom;
        return Padding(
          padding: EdgeInsets.only(bottom: bottomPadding),
          child: Column(mainAxisSize: MainAxisSize.min, children: [Flexible(child: child)]),
        );
      },
    );
  }
}
