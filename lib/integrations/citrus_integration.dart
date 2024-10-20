import '../models/match_model.dart';
import '../models/pacing_model.dart';
import 'match_integration_base.dart';
import 'pacing_integration_base.dart';

class CitrusScan implements PacingIntegrationBase, MatchIntegrationBase {
  @override
  String get integrationId => 'Citrus';

  @override
  bool integrationIsValid(String data) {
    // TODO: implement integrationIsValid
    throw UnimplementedError();
  }

  @override
  PacingModel getPacing(String data) {
    // TODO: implement getPacing
    throw UnimplementedError();
  }

  @override
  MatchModel getMatch(String data, PacingModel pacing) {
    // TODO: implement getMatch
    throw UnimplementedError();
  }

  @override
  bool sendReport(MatchModel match) {
    // TODO: implement sendReport
    throw UnimplementedError();
  }
}
