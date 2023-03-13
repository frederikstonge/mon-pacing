import 'package:flutter/material.dart';

import '../l10n/generated/l10n.dart';

class WillPopDialog {
  static Future<bool?> showWillPopDialog(BuildContext context, String title, String content) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext alertContext) => AlertDialog(
        title: Text(title, overflow: TextOverflow.ellipsis),
        content: Text(content),
        actions: [
          TextButton(
            child: Text(S.of(context).Dialog_Cancel),
            onPressed: () {
              Navigator.pop(alertContext, false);
            },
          ),
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
