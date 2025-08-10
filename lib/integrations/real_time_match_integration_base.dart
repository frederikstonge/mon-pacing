import 'dart:async';

import '../models/integration_base_model.dart';
import '../models/match_model.dart';
import '../models/timer_model.dart';
import 'match_integration_base.dart';

abstract class RealTimeMatchIntegrationBase extends MatchIntegrationBase {
  FutureOr<MatchModel> onMatchUpdate(MatchModel match);
  FutureOr<bool> onTimerUpdate(IntegrationBaseModel integration, TimerModel? timer);
}
