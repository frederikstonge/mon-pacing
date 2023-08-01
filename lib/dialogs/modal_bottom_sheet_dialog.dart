import 'package:flutter/material.dart';

import '../router/router.dart';

class ModalBottomSheetDialog {
  static Future<void> showDialog(BuildContext context, Widget child, Function() onConfirm, Function() onCancel, String confirmText) async {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom > 0
        ? MediaQuery.of(context).viewInsets.bottom
        : MediaQuery.of(rootNavigatorKey.currentContext!).padding.bottom;
    await showModalBottomSheet(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      context: context,
      useRootNavigator: true,
      enableDrag: false,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    onCancel();
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    onPressed: () {
                      onConfirm();
                      Navigator.of(context).pop();
                    },
                    child: Text(confirmText))
              ],
            ),
            child,
          ],
        ),
      ),
    );
  }
}
