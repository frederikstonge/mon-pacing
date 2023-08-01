import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/improvisation_model.dart';
import '../../models/match_model.dart';

part 'timer_state.freezed.dart';
part 'timer_state.g.dart';

@freezed
class TimerState with _$TimerState {
  const factory TimerState.stopped() = TimerStoppedState;

  const factory TimerState.running({
    required MatchModel match,
    required ImprovisationModel improvisation,
    required Duration initialDuration,
    Duration? elapsedTime,
  }) = TimerRunningState;

  const factory TimerState.paused({
    required MatchModel match,
    required ImprovisationModel improvisation,
    required Duration initialDuration,
    Duration? elapsedTime,
  }) = TimerPausedState;

  factory TimerState.fromJson(Map<String, Object?> json) => _$TimerStateFromJson(json);
}
