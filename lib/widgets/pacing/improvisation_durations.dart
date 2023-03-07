import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/improvisation_model.dart';
import 'improvisation_duration.dart';
import 'pacing_cubit.dart';

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
              title: ImprovisationDuration(
                key: ValueKey("${d.key}${d.value}"),
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
