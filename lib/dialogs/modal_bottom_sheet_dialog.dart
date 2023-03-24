import 'package:flutter/material.dart';

class ModalBottomSheetDialog {
  static Future<void> showDialog(BuildContext context, Widget child, Function() onConfirm, Function() onCancel, String confirmText) async {
    await showModalBottomSheet(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Wrap(
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
