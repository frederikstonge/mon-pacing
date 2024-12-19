import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/buttons/loading_icon_button.dart';
import '../../../cubits/timer/timer_cubit.dart';
import '../../../cubits/timer/timer_state.dart';
import '../../../extensions/duration_extensions.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../models/improvisation_model.dart';
import '../../../models/match_model.dart';
import '../../../models/timer_status.dart';

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
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, timerState) {
        final isActive = timerState.timer != null &&
            timerState.timer!.matchId == match.id &&
            timerState.timer!.improvisationId == improvisation.id &&
            timerState.timer!.durationIndex == durationIndex;

        final includeHuddleTimer = improvisation.huddleTimerInSeconds > 0;

        final durations = [
          if (includeHuddleTimer) ...[
            Duration(seconds: improvisation.huddleTimerInSeconds),
          ],
          ...improvisation.durationsInSeconds.map((e) => Duration(seconds: e)),
        ];

        final currentDuration = durations.elementAt(durationIndex);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (durations.length > 1) ...[
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SegmentedButton(
                  style: const ButtonStyle(visualDensity: VisualDensity(vertical: -4)),
                  segments: durations
                      .asMap()
                      .entries
                      .map(
                        (e) => ButtonSegment(
                          value: e.key,
                          label: Text(
                            includeHuddleTimer && e.key == 0 ? S.of(context).huddle : e.value.toImprovDuration(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                      .toList(),
                  selected: {durationIndex},
                  onSelectionChanged: (values) async {
                    await onDurationIndexChanged(values.first);
                  },
                ),
              ),
            ],
            const SizedBox(height: 6),
            Text(
              isActive ? Duration(milliseconds: timerState.timer!.remainingMilliseconds).toImprovDuration() : currentDuration.toImprovDuration(),
              style: Theme.of(context).textTheme.displayLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LoadingIconButton.tonal(
                  onPressed: isActive
                      ? () async => await context.read<TimerCubit>().start(
                            match.id!,
                            match.name,
                            improvisation.id!,
                            durationIndex,
                            currentDuration,
                          )
                      : null,
                  icon: const Icon(Icons.replay),
                  tooltip: S.of(context).pause,
                ),
                LoadingIconButton.filled(
                  onPressed: isActive
                      ? timerState.timer!.status == TimerStatus.paused
                          ? () => context.read<TimerCubit>().resume()
                          : () => context.read<TimerCubit>().pause()
                      : () async => await context.read<TimerCubit>().start(
                            match.id!,
                            match.name,
                            improvisation.id!,
                            durationIndex,
                            currentDuration,
                          ),
                  icon: isActive
                      ? timerState.timer!.status == TimerStatus.paused
                          ? const Icon(Icons.play_arrow)
                          : const Icon(Icons.pause)
                      : const Icon(Icons.play_arrow),
                  size: IconButtonSize.large,
                  tooltip: isActive && timerState.timer!.status == TimerStatus.paused ? S.of(context).pause : S.of(context).start,
                ),
                LoadingIconButton.tonal(
                  onPressed: isActive ? () async => await context.read<TimerCubit>().stop() : null,
                  icon: const Icon(Icons.stop),
                  tooltip: S.of(context).stop,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
