import 'package:flutter/material.dart';

class LeadingDirtyIconButton extends StatelessWidget {
  final bool dirty;
  const LeadingDirtyIconButton({super.key, required this.dirty});

  @override
  Widget build(BuildContext context) {
    return BackButton(
      onPressed: () {
        dirty
            ? showDialog(
                context: context,
                builder: (BuildContext alertContext) => AlertDialog(
                  title: const Text("Changes"),
                  content: const Text("Are you sure you want to go back? You will lose all unsaved changes."),
                  actions: [
                    TextButton(
                      child: const Text("Cancel"),
                      onPressed: () {
                        Navigator.of(alertContext).pop();
                      },
                    ),
                    TextButton(
                      child: const Text("OK"),
                      onPressed: () {
                        Navigator.of(alertContext).pop();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              )
            : Navigator.of(context).pop();
      },
    );
  }
}
