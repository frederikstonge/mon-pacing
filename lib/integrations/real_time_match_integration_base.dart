import 'dart:async';

import '../models/integration_base_model.dart';
import '../models/match_model.dart';
import '../models/timer_model.dart';
import 'integration_base.dart';

abstract class RealTimeMatchIntegrationBase extends IntegrationBase {
  FutureOr<MatchModel> enrichMatch(String scanData, MatchModel match);
  FutureOr<MatchModel> onMatchUpdate(MatchModel match);
  FutureOr<bool> onTimerUpdate(IntegrationBaseModel integration, TimerModel? timer);
}
