import '../l10n/localizer.dart';
import '../models/improvisation_fields.dart';
import '../models/improvisation_type.dart';
import '../models/pacing_model.dart';
import 'duration_extensions.dart';

extension PacingExtensions on PacingModel {
  Duration totalDuration({int? take}) => Duration(
    seconds: (take != null ? improvisations.take(take) : improvisations).fold(0, (total, improvisation) {
      final timeBuffer = improvisation.timeBufferInSeconds;
      final huddleTimer = improvisation.huddleTimerInSeconds;
      return total +
          timeBuffer +
          huddleTimer +
          (improvisation.durationsInSeconds.reduce((totalDuration, duration) => totalDuration + duration) *
              (improvisation.type == ImprovisationType.compared ? defaultNumberOfTeams : 1));
    }),
  );

  String? toHumanReadableString(List<ImprovisationFields> improvisationFieldsOrder) {
    final List<String> returnValues = [];
    returnValues.add(name);

    for (final improvisation in improvisations) {
      final List<String> improvisationValues = [];
      improvisationValues.add('#${improvisations.indexOf(improvisation) + 1}');

      for (var field in improvisationFieldsOrder) {
        switch (field) {
          case ImprovisationFields.type:
            improvisationValues.add(
              improvisation.type == ImprovisationType.mixed ? Localizer.current.mixed : Localizer.current.compared,
            );
            break;
          case ImprovisationFields.performers:
            improvisationValues.add(
              improvisation.performers.isNotEmpty ? improvisation.performers : Localizer.current.unlimited,
            );
            break;
          case ImprovisationFields.category:
            improvisationValues.add(
              improvisation.category.isNotEmpty ? improvisation.category : Localizer.current.free,
            );
            break;

          case ImprovisationFields.durations:
            improvisationValues.add(
              improvisation.durationsInSeconds.map((e) => Duration(seconds: e).toImprovDuration()).join(' + '),
            );
            break;
          case ImprovisationFields.theme:
            if (improvisation.theme.isNotEmpty) {
              improvisationValues.add(improvisation.theme);
            }
            break;
          case ImprovisationFields.notes:
            if (improvisation.notes.isNotEmpty) {
              improvisationValues.add(improvisation.notes);
            }
            break;
        }
      }

      returnValues.add(improvisationValues.join(' - '));
    }

    return returnValues.join('\n');
  }
}
