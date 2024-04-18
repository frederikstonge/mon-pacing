import 'package:freezed_annotation/freezed_annotation.dart';

import 'timer_status.dart';

part 'timer_model.freezed.dart';
part 'timer_model.g.dart';

@freezed
class TimerModel with _$TimerModel {
  const factory TimerModel({
    required Duration duration,
    required int matchId,
    required int improvisationId,
    required int durationIndex,
    required TimerStatus status,
    required int remainingMilliseconds,
    required bool hapticFeedback,
    required String notificationTitle,
  }) = _TimerModel;

  factory TimerModel.fromJson(Map<String, dynamic> json) => _$TimerModelFromJson(json);
}
