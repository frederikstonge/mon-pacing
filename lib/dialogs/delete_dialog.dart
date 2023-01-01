import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class DeleteDialog {
  static showDeleteDialog(BuildContext context, String itemName, Function onDelete) {
    showDialog(
      context: context,
      builder: (BuildContext alertContext) => AlertDialog(
        title: Text(S.of(context).DeleteDialog_Title, overflow: TextOverflow.ellipsis),
        content: Text(S.of(context).DeleteDialog_Content(itemName)),
        actions: [
          TextButton(
            child: Text(S.of(context).Dialog_Cancel),
            onPressed: () {
              Navigator.pop(alertContext);
            },
          ),
          TextButton(
            child: Text(S.of(context).DeleteDialog_Title, style: const TextStyle(color: Colors.red)),
            onPressed: () {
              onDelete();
              Navigator.pop(alertContext);
            },
          ),
        ],
      ),
    );
  }
}
