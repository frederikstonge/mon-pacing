import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/timer_model.dart';

part 'timer_state.freezed.dart';
part 'timer_state.g.dart';

@freezed
class TimerState with _$TimerState {
  const factory TimerState({
    TimerModel? timer,
  }) = _TimerState;

  factory TimerState.fromJson(Map<String, dynamic> json) => _$TimerStateFromJson(json);
}
