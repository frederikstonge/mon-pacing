import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/pacing/pacing_cubit.dart';
import '../../dialogs/duration_dialog.dart';
import '../../helpers/duration_helper.dart';
import '../../l10n/generated/l10n.dart';
import '../../models/improvisation_model.dart';

class ImprovisationDurations extends StatelessWidget {
  final ImprovisationModel improvisation;

  const ImprovisationDurations({
    super.key,
    required this.improvisation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: improvisation.durations
          .asMap()
          .entries
          .map(
            (d) => ListTile(
              title: ImprovisationDurationItem(
                key: ValueKey('${d.key}${d.value}'),
                duration: d.value,
                valueChanged: (value) {
                  final newDurations = List<Duration>.from(improvisation.copyWith().durations);
                  newDurations[d.key] = value;
                  context.read<PacingCubit>().editImprovisation(improvisation.copyWith(durations: newDurations));
                },
              ),
              trailing: d.key == 0
                  ? IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        final newDurations = List<Duration>.from(improvisation.copyWith().durations);
                        newDurations.add(const Duration(minutes: 2, seconds: 30));
                        context.read<PacingCubit>().editImprovisation(improvisation.copyWith(durations: newDurations));
                      },
                    )
                  : IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        final newDurations = List<Duration>.from(improvisation.copyWith().durations);
                        newDurations.removeAt(d.key);
                        context.read<PacingCubit>().editImprovisation(improvisation.copyWith(durations: newDurations));
                      },
                    ),
            ),
          )
          .toList(),
    );
  }
}

class ImprovisationDurationItem extends StatefulWidget {
  final Duration duration;
  final ValueChanged<Duration> valueChanged;

  const ImprovisationDurationItem({
    super.key,
    required this.duration,
    required this.valueChanged,
  });

  @override
  State<ImprovisationDurationItem> createState() => _ImprovisationDurationItemState();
}

class _ImprovisationDurationItemState extends State<ImprovisationDurationItem> {
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
