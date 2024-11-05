import '../l10n/generated/app_localizations.dart';
import '../models/improvisation_model.dart';

extension ImprovisationExtensions on ImprovisationModel {
  String getCategoryString(S localizer) => category.isEmpty ? localizer.free : category;

  String getPerformersString(S localizer) => performers.isEmpty ? localizer.unlimited : performers;
}
