import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class MessageDialog {
  static showMessageDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext alertContext) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            child: Text(S.of(context).Dialog_Ok),
            onPressed: () {
              Navigator.of(alertContext).pop();
            },
          ),
        ],
      ),
    );
  }
}
