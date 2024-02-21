import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/bottom_sheet_dialog/bottom_sheet_appbar.dart';
import '../../l10n/app_localizations.dart';

class DurationPicker extends StatefulWidget {
  final Duration initialDuration;
  final String title;
  final ValueSetter<Duration> onSave;

  const DurationPicker({
    super.key,
    required this.title,
    required this.initialDuration,
    required this.onSave,
  });

  @override
  State<DurationPicker> createState() => _DurationPickerState();
}

class _DurationPickerState extends State<DurationPicker> {
  late Duration selectedDuration;

  @override
  void initState() {
    selectedDuration = widget.initialDuration;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BottomSheetAppbar(
          title: Text(widget.title),
        ),
        Wrap(
          children: [
            CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.ms,
              initialTimerDuration: selectedDuration,
              onTimerDurationChanged: (duration) {
                setState(() {
                  selectedDuration = duration;
                });
              },
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: FilledButton(
                  onPressed: () {
                    widget.onSave(selectedDuration);
                    Navigator.of(context).pop();
                  },
                  child: Text(S.of(context).save),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
