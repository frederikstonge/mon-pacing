import 'package:flutter/material.dart';

import '../../dialogs/duration_dialog.dart';
import '../../generated/l10n.dart';
import '../../helpers/duration_helper.dart';

class ImprovisationDuration extends StatefulWidget {
  final Duration duration;
  final ValueChanged<Duration> valueChanged;

  const ImprovisationDuration({
    super.key,
    required this.duration,
    required this.valueChanged,
  });

  @override
  State<ImprovisationDuration> createState() => _ImprovisationDurationState();
}

class _ImprovisationDurationState extends State<ImprovisationDuration> {
  final _textController = TextEditingController();

  @override
  void initState() {
    _textController.text = DurationHelper.getDurationString(widget.duration);
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: _textController,
      onTap: () async {
        await DurationDialog.showDurationDialog(context, widget.duration, (value) {
          _textController.text = DurationHelper.getDurationString(value);
          widget.valueChanged(value);
        });
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        hintText: S.of(context).PacingView_ImprovisationDurationHint,
      ),
    );
  }
}
