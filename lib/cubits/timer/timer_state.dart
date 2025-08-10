import 'package:dart_mappable/dart_mappable.dart';

import '../../models/integration_base_model.dart';
import '../../models/timer_model.dart';

part 'timer_state.mapper.dart';

@MappableClass()
class TimerState with TimerStateMappable {
  final TimerModel? timer;
  final IntegrationBaseModel? integration;

  const TimerState({this.timer, this.integration});
}
