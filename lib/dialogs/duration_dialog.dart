import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

import '../generated/l10n.dart';

class DurationDialog {
  static showDurationDialog(BuildContext context, Duration duration, void Function(Duration) onDurationChanged) {
    Picker(
      adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
        NumberPickerColumn(
          begin: 0,
          end: 20,
          suffix: Text(S.of(context).DurationDialog_ImprovisationDurationMinutes),
          initValue: duration.inMinutes,
        ),
        NumberPickerColumn(
          begin: 0,
          end: 60,
          suffix: Text(S.of(context).DurationDialog_ImprovisationDurationSeconds),
          initValue: (duration.inSeconds % 60),
          jump: 15,
        ),
      ]),
      delimiter: <PickerDelimiter>[
        PickerDelimiter(
          child: Container(
            width: 10.0,
            alignment: Alignment.center,
          ),
        )
      ],
      hideHeader: true,
      confirmText: S.of(context).Dialog_Ok,
      title: Text(S.of(context).DurationDialog_ImprovisationDurationTitle),
      onConfirm: (Picker picker, List<int> value) {
        var duration = Duration(
          minutes: picker.getSelectedValues()[0],
          seconds: picker.getSelectedValues()[1],
        );
        onDurationChanged(duration);
      },
    ).showDialog(context);
  }
}
