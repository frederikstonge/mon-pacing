import '../l10n/localizer.dart';
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

  String? toHumanReadableString() {
    final List<String> returnValues = [];
    returnValues.add(name);

    for (final improvisation in improvisations) {
      final List<String> improvisationValues = [];
      improvisationValues.add('#${improvisations.indexOf(improvisation) + 1}');
      improvisationValues.add(
        improvisation.type == ImprovisationType.mixed ? Localizer.current.mixed : Localizer.current.compared,
      );
      improvisationValues.add(
        improvisation.performers.isNotEmpty ? improvisation.performers : Localizer.current.unlimited,
      );
      improvisationValues.add(improvisation.category.isNotEmpty ? improvisation.category : Localizer.current.free);
      improvisationValues.add(
        improvisation.durationsInSeconds.map((e) => Duration(seconds: e).toImprovDuration()).join(' + '),
      );

      if (improvisation.theme.isNotEmpty) {
        improvisationValues.add(improvisation.theme);
      }

      if (improvisation.notes.isNotEmpty) {
        improvisationValues.add(improvisation.notes);
      }

      returnValues.add(improvisationValues.join(' - '));
    }

    return returnValues.join('\n');
  }
}
