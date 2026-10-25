import 'package:dart_mappable/dart_mappable.dart';

import 'timer_status.dart';

part 'main_message.mapper.dart';

@MappableClass()
class MainMessage with MainMessageMappable {
  final String runId;
  final int remainingMilliseconds;
  final TimerStatus? requestedStatus;

  const MainMessage({required this.runId, required this.remainingMilliseconds, this.requestedStatus});
}
