import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_status_model.freezed.dart';

@freezed
class TimerStatusModel with _$TimerStatusModel {
  const factory TimerStatusModel({
    required Duration duration,
    required int matchId,
    required int improvisationId,
    required TimerStatus status,
  }) = _TimerStatusModel;

  factory TimerStatusModel.fromJson(Map<String, dynamic> json) => _$TimerStatusModelFromJson(json);
}

enum TimerStatus {
  started,
  paused,
}
