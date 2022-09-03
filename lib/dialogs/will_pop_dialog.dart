import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class WillPopDialog {
  static Future<bool?> showWillPopDialog(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext alertContext) => AlertDialog(
        title: Text(S.of(context).WillPopDialog_Title),
        content: Text(S.of(context).WillPopDialog_Content),
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
