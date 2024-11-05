import '../l10n/generated/app_localizations.dart';
import '../models/match_model.dart';
import '../models/penalty_model.dart';

extension PenaltyExtensions on PenaltyModel {
  String getPenaltyString(S localizer, MatchModel match, {bool includePerformerName = true}) {
    var penaltyText = type;
    if (major) {
      penaltyText += ' ${localizer.major}';
    }

    if (includePerformerName && performerId != null) {
      penaltyText += ' (${match.teams.firstWhere((t) => t.id == teamId).performers.firstWhere((p) => p.id == performerId).name})';
    }

    return penaltyText;
  }
}
