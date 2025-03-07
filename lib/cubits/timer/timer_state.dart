import 'package:dart_mappable/dart_mappable.dart';

import '../../models/timer_model.dart';

part 'timer_state.mapper.dart';

@MappableClass()
class TimerState with TimerStateMappable {
  final TimerModel? timer;

  const TimerState({this.timer});
}
