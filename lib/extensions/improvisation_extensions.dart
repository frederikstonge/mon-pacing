import '../l10n/generated/app_localizations.dart';
import '../l10n/localizer.dart';
import '../models/improvisation_fields.dart';
import '../models/improvisation_model.dart';
import '../models/improvisation_type.dart';
import 'duration_extensions.dart';

extension ImprovisationExtensions on ImprovisationModel {
  String getCategoryString(S localizer) => category.isEmpty ? localizer.free : category;

  String getPerformersString(S localizer) => performers.isEmpty ? localizer.unlimited : performers;

  String toHumanReadableString(List<ImprovisationFields> improvisationFieldsOrder) {
    final List<String> improvisationValues = [];
    for (var field in improvisationFieldsOrder) {
      switch (field) {
        case ImprovisationFields.type:
          improvisationValues.add(
            type == ImprovisationType.mixed ? Localizer.current.mixed : Localizer.current.compared,
          );
          break;
        case ImprovisationFields.performers:
          improvisationValues.add(performers.isNotEmpty ? performers : Localizer.current.unlimited);
          break;
        case ImprovisationFields.category:
          improvisationValues.add(category.isNotEmpty ? category : Localizer.current.free);
          break;

        case ImprovisationFields.durations:
          improvisationValues.add(durationsInSeconds.map((e) => Duration(seconds: e).toImprovDuration()).join(' + '));
          break;
        case ImprovisationFields.theme:
          if (theme.isNotEmpty) {
            improvisationValues.add(theme);
          }
          break;
        case ImprovisationFields.notes:
          if (notes.isNotEmpty) {
            improvisationValues.add(notes);
          }
          break;
      }
    }

    return improvisationValues.join(' - ');
  }
}
