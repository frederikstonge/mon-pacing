import '../l10n/app_localizations.dart';
import '../models/penalty_model.dart';

extension PenaltyExtensions on PenaltyModel {
  String getPenaltyString(S localizer) {
    var penaltyText = type;
    if (major) {
      penaltyText += ' ${localizer.major}';
    }

    if (performer.isNotEmpty) {
      penaltyText += ' ($performer)';
    }

    return penaltyText;
  }
}
