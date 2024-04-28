import '../models/improvisation_type.dart';
import '../models/pacing_model.dart';

extension PacingExtensions on PacingModel {
  Duration totalDuration({int? take}) => Duration(
          seconds: (take != null ? improvisations.take(take) : improvisations).fold(
        0,
        (total, improvisation) {
          final timeBuffer = improvisation.timeBufferInSeconds;
          final huddleTimer = improvisation.huddleTimerInSeconds;
          return total +
              timeBuffer +
              huddleTimer +
              (improvisation.durationsInSeconds.reduce((totalDuration, duration) => totalDuration + duration) *
                  (improvisation.type == ImprovisationType.compared ? defaultNumberOfTeams : 1));
        },
      ));
}
