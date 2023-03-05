import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DurationDialog {
  static showDurationDialog(BuildContext context, Duration duration, void Function(Duration) onDurationChanged) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      context: context,
      isScrollControlled: true,
      builder: (context) => Wrap(
        children: [
          CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.ms,
            initialTimerDuration: duration,
            onTimerDurationChanged: (time) {
              onDurationChanged(time);
            },
          ),
        ],
      ),
    );
  }
}
