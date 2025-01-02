import 'package:dart_mappable/dart_mappable.dart';

import 'timer_status.dart';

part 'task_message.mapper.dart';

@MappableClass()
class TaskMessage with TaskMessageMappable {
  final int durationInSeconds;
  final TimerStatus status;
  final bool hapticFeedback;
  final String notificationTitle;

  const TaskMessage({
    required this.durationInSeconds,
    required this.status,
    required this.hapticFeedback,
    required this.notificationTitle,
  });
}
