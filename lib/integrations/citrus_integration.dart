import '../models/match_model.dart';
import '../models/pacing_model.dart';
import 'match_integration_base.dart';

class CitrusIntegration implements MatchIntegrationBase {
  @override
  String get integrationId => 'Citrus';

  @override
  bool integrationIsValid(String data) {
    // TODO: implement integrationIsValid
    throw UnimplementedError();
  }

  @override
  MatchModel getMatch(String data, PacingModel pacing) {
    // TODO: implement getMatch
    throw UnimplementedError();
  }

  @override
  bool exportMatch(MatchModel match) {
    // TODO: implement sendReport
    throw UnimplementedError();
  }
}
