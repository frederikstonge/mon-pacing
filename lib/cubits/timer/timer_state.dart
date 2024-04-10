import 'package:freezed_annotation/freezed_annotation.dart';

import '../../services/foreground_service/timer_status_model.dart';

part 'timer_state.freezed.dart';
part 'timer_state.g.dart';

@freezed
class TimerState with _$TimerState {
  const factory TimerState({
    TimerStatusModel? timerStatus,
  }) = _TimerState;

  factory TimerState.fromJson(Map<String, dynamic> json) => _$TimerStateFromJson(json);
}
