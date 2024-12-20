import 'package:dart_mappable/dart_mappable.dart';

import 'timer_status.dart';

part 'timer_model.mapper.dart';

@MappableClass()
class TimerModel with TimerModelMappable {
  final int durationInSeconds;
  final int matchId;
  final int improvisationId;
  final int durationIndex;
  final TimerStatus status;
  final int remainingMilliseconds;
  final bool hapticFeedback;
  final String notificationTitle;
  final TimerStatus? requestedStatus;

  const TimerModel({
    required this.durationInSeconds,
    required this.matchId,
    required this.improvisationId,
    required this.durationIndex,
    required this.status,
    required this.remainingMilliseconds,
    required this.hapticFeedback,
    required this.notificationTitle,
    this.requestedStatus,
  });
}
