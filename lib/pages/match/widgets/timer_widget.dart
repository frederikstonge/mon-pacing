import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/timer/timer_cubit.dart';
import '../../../cubits/timer/timer_state.dart';
import '../../../extensions/duration_extensions.dart';
import '../../../models/improvisation_model.dart';
import '../../../models/match_model.dart';
import '../../../services/foreground_service/timer_status_model.dart';

class TimerWidget extends StatelessWidget {
  final MatchModel match;
  final ImprovisationModel improvisation;
  final int durationIndex;
  final FutureOr<void> Function(int durationIndex) onDurationIndexChanged;

  const TimerWidget({
    super.key,
    required this.match,
    required this.improvisation,
    required this.durationIndex,
    required this.onDurationIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(builder: (context, state) {
      final isActive = state.timerStatus != null &&
          state.timerStatus!.matchId == match.id &&
          state.timerStatus!.improvisationId == improvisation.id &&
          state.timerStatus!.durationIndex == durationIndex;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (improvisation.durationsInSeconds.length > 1) ...[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SegmentedButton(
                style: const ButtonStyle(visualDensity: VisualDensity(vertical: -4)),
                segments: improvisation.durationsInSeconds
                    .asMap()
                    .entries
                    .map(
                      (e) => ButtonSegment(
                        value: e.key,
                        label: Text(
                          Duration(seconds: e.value).toImprovDuration(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
                selected: {durationIndex},
                onSelectionChanged: (values) => onDurationIndexChanged(values.first),
              ),
            ),
          ],
          const SizedBox(height: 6),
          Text(
            isActive
                ? Duration(milliseconds: state.timerStatus!.remainingMilliseconds).toImprovDuration()
                : Duration(seconds: improvisation.durationsInSeconds.elementAt(durationIndex)).toImprovDuration(),
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: isActive && state.timerStatus!.status == TimerStatus.paused
                    ? () => context.read<TimerCubit>().resume()
                    : () => context.read<TimerCubit>().start(
                        match.id, improvisation.id, durationIndex, Duration(seconds: improvisation.durationsInSeconds.elementAt(durationIndex))),
                icon: const Icon(Icons.play_arrow),
              ),
              IconButton(
                onPressed: isActive && state.timerStatus!.status == TimerStatus.started ? () => context.read<TimerCubit>().pause() : null,
                icon: const Icon(Icons.pause),
              ),
              IconButton(
                onPressed: isActive ? () => context.read<TimerCubit>().stop() : null,
                icon: const Icon(Icons.stop),
              ),
            ],
          ),
        ],
      );
    });
  }
}
