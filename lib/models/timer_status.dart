import 'package:dart_mappable/dart_mappable.dart';

part 'timer_status.mapper.dart';

@MappableEnum()
enum TimerStatus {
  started,
  paused,
  stopped,
}
