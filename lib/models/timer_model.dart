import 'package:dart_mappable/dart_mappable.dart';

import 'timer_status.dart';

part 'timer_model.mapper.dart';

@MappableClass()
class TimerModel with TimerModelMappable {
  final Duration duration;
  final int matchId;
  final int improvisationId;
  final int durationIndex;
  final TimerStatus status;
  final int remainingMilliseconds;
  final bool hapticFeedback;
  final String notificationTitle;

  const TimerModel({
    required this.duration,
    required this.matchId,
    required this.improvisationId,
    required this.durationIndex,
    required this.status,
    required this.remainingMilliseconds,
    required this.hapticFeedback,
    required this.notificationTitle,
  });
}
