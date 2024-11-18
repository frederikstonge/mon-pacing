import 'dart:async';

import '../models/match_model.dart';
import '../models/pacing_model.dart';
import 'integration_base.dart';

abstract class MatchIntegrationBase extends IntegrationBase {
  FutureOr<MatchModel> getMatch(String scanData, PacingModel pacing);

  FutureOr<bool> exportMatch(MatchModel match);
}
