import '../l10n/app_localizations.dart';
import '../models/match_model.dart';
import '../models/penalty_model.dart';

extension PenaltyExtensions on PenaltyModel {
  String getPenaltyString(S localizer, MatchModel match) {
    var penaltyText = type;
    if (major) {
      penaltyText += ' ${localizer.major}';
    }

    if (performerId != null) {
      penaltyText += ' (${match.teams.firstWhere((t) => t.id == teamId).performers.firstWhere((p) => p.id == performerId)})';
    }

    return penaltyText;
  }
}
