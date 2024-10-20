import '../models/match_model.dart';
import '../models/pacing_model.dart';
import 'integration_base.dart';

abstract class MatchIntegrationBase extends IntegrationBase {
  MatchModel getMatch(String scanData, PacingModel pacing);

  bool exportMatch(MatchModel match);
}
