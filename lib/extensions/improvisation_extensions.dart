import '../l10n/app_localizations.dart';
import '../models/entities/improvisation_entity_model.dart';
import '../models/improvisation_model.dart';

extension ImprovisationExtensions on ImprovisationModel {
  ImprovisationEntityModel toEntity(int order) => ImprovisationEntityModel(
        id: id,
        order: order,
        type: type.index,
        category: category,
        theme: theme,
        durationsInSeconds: durationsInSeconds.join(','),
        performers: performers,
        notes: notes,
        timeBufferInSeconds: timeBufferInSeconds,
        huddleTimerInSeconds: huddleTimerInSeconds,
      );

  String getCategoryString(S localizer) => category.isEmpty ? localizer.free : category;

  String getPerformersString(S localizer) => performers.isEmpty ? localizer.unlimited : performers;
}
