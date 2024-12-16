import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/timer_model.dart';

part 'timer_state.freezed.dart';

@freezed
class TimerState with _$TimerState {
  const factory TimerState({
    TimerModel? timer,
  }) = _TimerState;
}
