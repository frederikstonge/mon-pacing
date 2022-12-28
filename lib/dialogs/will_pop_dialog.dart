import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class WillPopDialog {
  static Future<bool?> showWillPopDialog(BuildContext context, String title, String content) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext alertContext) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            child: Text(S.of(context).Dialog_Cancel),
            onPressed: () {
              Navigator.of(alertContext).pop(false);
            },
          ),
          TextButton(
            child: Text(S.of(context).Dialog_Ok),
            onPressed: () {
              Navigator.of(alertContext).pop(true);
            },
          ),
        ],
      ),
    );
  }
}
