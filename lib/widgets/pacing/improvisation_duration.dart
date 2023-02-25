import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pacing_cubit.dart';
import '../../dialogs/duration_dialog.dart';
import '../../generated/l10n.dart';
import '../../helpers/duration_helper.dart';
import '../../models/improvisation_model.dart';

class ImprovisationDuration extends StatefulWidget {
  final ImprovisationModel improvisation;

  const ImprovisationDuration({
    super.key,
    required this.improvisation,
  });

  @override
  State<ImprovisationDuration> createState() => _ImprovisationDurationState();
}

class _ImprovisationDurationState extends State<ImprovisationDuration> {
  final _textController = TextEditingController();

  @override
  void initState() {
    _textController.text = DurationHelper.getDurationString(widget.improvisation.duration);
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
        DurationDialog.showDurationDialog(
          context,
          widget.improvisation.duration,
          (value) => context.read<PacingCubit>().editImprovisation(widget.improvisation.copyWith(duration: value)),
        );
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
