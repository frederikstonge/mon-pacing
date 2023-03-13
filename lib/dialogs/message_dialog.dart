import 'package:flutter/material.dart';

import '../l10n/generated/l10n.dart';

class MessageDialog {
  static Future<void> showMessageDialog(BuildContext context, String title, String message) async {
    await showDialog(
      context: context,
      builder: (BuildContext alertContext) => AlertDialog(
        title: Text(title, overflow: TextOverflow.ellipsis),
        content: Text(message),
        actions: [
          TextButton(
            child: Text(S.of(context).Dialog_Ok),
            onPressed: () {
              Navigator.pop(alertContext, true);
            },
          ),
        ],
      ),
    );
  }
}
