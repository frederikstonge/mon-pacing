import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class DurationDialog {
  static showDurationDialog(BuildContext context, Duration duration, void Function(Duration) onDurationChanged) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      context: context,
      isScrollControlled: true,
      builder: (context) => Wrap(
        children: [
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
              ElevatedButton(
                  onPressed: () {
                    onDurationChanged(duration);
                    Navigator.of(context).pop();
                  },
                  child: Text(S.of(context).Dialog_Save))
            ],
          ),
          CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.ms,
            initialTimerDuration: duration,
            onTimerDurationChanged: (time) {
              duration = time;
            },
          ),
        ],
      ),
    );
  }
}
