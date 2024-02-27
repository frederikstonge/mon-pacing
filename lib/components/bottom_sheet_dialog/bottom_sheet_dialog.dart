import 'package:flutter/material.dart';

import '../../router/router.dart';

class BottomSheetDialog {
  static Future<T?> showDialog<T>({
    required BuildContext context,
    required Widget child,
  }) async {
    return await showModalBottomSheet(
      barrierColor: Theme.of(context).colorScheme.onBackground.withAlpha(100),
      context: context,
      useRootNavigator: true,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) {
        final bottomPadding = MediaQuery.of(rootNavigatorKey.currentContext ?? context).viewInsets.bottom > 0
            ? MediaQuery.of(rootNavigatorKey.currentContext ?? context).viewInsets.bottom
            : MediaQuery.of(rootNavigatorKey.currentContext ?? context).padding.bottom;
        return Padding(
          padding: EdgeInsets.only(bottom: bottomPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: child),
            ],
          ),
        );
      },
    );
  }
}
