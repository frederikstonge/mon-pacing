import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../../components/actions/loading_icon_button.dart';
import '../../../cubits/settings/settings_cubit.dart';
import '../../../cubits/timer/timer_cubit.dart';
import '../../../cubits/timer/timer_state.dart';
import '../../../extensions/duration_extensions.dart';
import '../../../l10n/app_localizations.dart';
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
                onSelectionChanged: (values) async {
                  unawaited(context.read<SettingsCubit>().vibrate(HapticsType.light));
                  await onDurationIndexChanged(values.first);
                },
              ),
            ),
          ],
          const SizedBox(height: 6),
          Text(
            isActive
                ? Duration(milliseconds: state.timerStatus!.remainingMilliseconds).toImprovDuration()
                : Duration(seconds: improvisation.durationsInSeconds.elementAt(durationIndex)).toImprovDuration(),
            style: Theme.of(context).textTheme.displaySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LoadingIconButton.filled(
                onPressed: isActive && state.timerStatus!.status == TimerStatus.paused
                    ? () async => await context.read<TimerCubit>().resume()
                    : () async => await context.read<TimerCubit>().start(
                          match.id,
                          match.name,
                          improvisation.id,
                          durationIndex,
                          Duration(seconds: improvisation.durationsInSeconds.elementAt(durationIndex)),
                        ),
                icon: isActive && state.timerStatus!.status == TimerStatus.started ? const Icon(Icons.replay) : const Icon(Icons.play_arrow),
                tooltip: S.of(context).start,
              ),
              LoadingIconButton.filled(
                onPressed: isActive && state.timerStatus!.status == TimerStatus.started ? () async => await context.read<TimerCubit>().pause() : null,
                icon: const Icon(Icons.pause),
                tooltip: S.of(context).pause,
              ),
              LoadingIconButton.filled(
                onPressed: isActive ? () async => await context.read<TimerCubit>().stop() : null,
                icon: const Icon(Icons.stop),
                tooltip: S.of(context).stop,
              ),
            ],
          ),
        ],
      );
    });
  }
}
