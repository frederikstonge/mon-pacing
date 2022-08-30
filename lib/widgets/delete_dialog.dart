import 'package:flutter/material.dart';

class DeleteDialog {
  static showDeleteDialog(BuildContext context, String itemName, Function onDelete) {
    showDialog(
      context: context,
      builder: (BuildContext alertContext) => AlertDialog(
        title: const Text("Delete"),
        content: Text("Are you sure you want to delete $itemName?"),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(alertContext).pop();
            },
          ),
          TextButton(
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
            onPressed: () {
              onDelete();

              Navigator.of(alertContext).pop();
            },
          ),
        ],
      ),
    );
  }
}
