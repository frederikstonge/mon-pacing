import '../l10n/app_localizations.dart';
import '../models/entities/penalty_entity_model.dart';
import '../models/penalty_model.dart';

extension PenaltyExtensions on PenaltyModel {
  PenaltyEntityModel toEntity() => PenaltyEntityModel(
        id: id,
        major: major,
        type: type,
        performer: performer,
        teamId: teamId,
        improvisationId: improvisationId,
      );

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
