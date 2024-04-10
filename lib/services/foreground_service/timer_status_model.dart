import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_status_model.freezed.dart';
part 'timer_status_model.g.dart';

@freezed
class TimerStatusModel with _$TimerStatusModel {
  const factory TimerStatusModel({
    required Duration duration,
    required int matchId,
    required int improvisationId,
    required int durationIndex,
    required TimerStatus status,
    required int remainingMilliseconds,
    required bool hapticFeedback,
    required String notificationTitle,
  }) = _TimerStatusModel;

  factory TimerStatusModel.fromJson(Map<String, dynamic> json) => _$TimerStatusModelFromJson(json);
}

enum TimerStatus {
  started,
  paused,
}
