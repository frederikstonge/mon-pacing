import 'package:flutter/material.dart';

class WillPopDialog {
  static Future<bool?> showWillPopDialog(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext alertContext) => AlertDialog(
        title: const Text("Changes"),
        content: const Text("Are you sure you want to go back? You will lose all unsaved changes."),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(alertContext).pop(false);
            },
          ),
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(alertContext).pop(true);
            },
          ),
        ],
      ),
    );
  }
}
