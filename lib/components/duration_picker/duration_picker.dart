import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/bottom_sheet_dialog/bottom_sheet_appbar.dart';
import '../../l10n/app_localizations.dart';
import '../actions/loading_button.dart';
import '../bottom_sheet_dialog/bottom_sheet_scaffold.dart';

class DurationPicker extends StatefulWidget {
  final Duration initialDuration;
  final String title;

  const DurationPicker({
    super.key,
    required this.title,
    required this.initialDuration,
  });

  @override
  State<DurationPicker> createState() => _DurationPickerState();
}

class _DurationPickerState extends State<DurationPicker> {
  late Duration selectedDuration;
  late int secondInterval;

  @override
  void initState() {
    selectedDuration = widget.initialDuration;
    if (widget.initialDuration.inSeconds % 30 == 0) {
      secondInterval = 30;
    } else if (widget.initialDuration.inSeconds % 10 == 0) {
      secondInterval = 10;
    } else {
      secondInterval = 1;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      appBar: BottomSheetAppbar(
        title: widget.title,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SegmentedButton(
              style: const ButtonStyle(visualDensity: VisualDensity(vertical: -4)),
              segments: const [
                ButtonSegment(
                  value: 1,
                  label: Text(
                    '1 sec',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ButtonSegment(
                    value: 10,
                    label: Text(
                      '10 sec',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )),
                ButtonSegment(
                    value: 30,
                    label: Text(
                      '30 sec',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )),
              ],
              selected: {secondInterval},
              onSelectionChanged: (values) {
                final value = values.first;
                final difference = selectedDuration.inSeconds % value;
                if (difference != 0) {
                  if (difference < (value / 2)) {
                    selectedDuration = Duration(seconds: selectedDuration.inSeconds - difference);
                  } else {
                    selectedDuration = Duration(seconds: selectedDuration.inSeconds + (value - difference));
                  }
                }
                setState(() {
                  secondInterval = value;
                });
              },
            ),
          ),
          CupertinoTimerPicker(
            key: ValueKey(secondInterval),
            mode: CupertinoTimerPickerMode.ms,
            secondInterval: secondInterval,
            initialTimerDuration: selectedDuration,
            onTimerDurationChanged: (duration) {
              setState(() {
                selectedDuration = duration;
              });
            },
          ),
        ],
      ),
      bottom: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: LoadingButton.filled(
                onPressed: () {
                  Navigator.of(context).pop(selectedDuration);
                },
                child: Text(
                  S.of(context).save,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
