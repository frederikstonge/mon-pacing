import 'package:flutter/material.dart';

import '../l10n/generated/l10n.dart';

class DeleteDialog {
  static Future<void> showDeleteDialog(BuildContext context, String itemName, Future<void> Function() onDelete) async {
    await showDialog(
      context: context,
      builder: (BuildContext alertContext) => AlertDialog(
        title: Text(S.of(context).DeleteDialog_Title, overflow: TextOverflow.ellipsis),
        content: Text(S.of(context).DeleteDialog_Content(itemName)),
        actions: [
          TextButton(
            child: Text(S.of(context).Dialog_Cancel),
            onPressed: () {
              Navigator.pop(alertContext, false);
            },
          ),
          TextButton(
            child: Text(S.of(context).DeleteDialog_Title, style: const TextStyle(color: Colors.red)),
            onPressed: () async {
              final navigator = Navigator.of(alertContext);
              await onDelete();
              navigator.pop(true);
            },
          ),
        ],
      ),
    );
  }
}
