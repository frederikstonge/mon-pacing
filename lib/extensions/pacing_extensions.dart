import '../models/improvisation_type.dart';
import '../models/pacing_model.dart';

extension PacingExtensions on PacingModel {
  Duration get totalDuration => Duration(
          seconds: improvisations.fold(
        enableTimeBuffer ? (timeBufferInSeconds * improvisations.length) : 0,
        (total, improvisation) {
          if (improvisation.type == ImprovisationType.mixed) {
            return total + improvisation.durationsInSeconds.reduce((totalDuration, duration) => totalDuration + duration);
          } else {
            return total + (improvisation.durationsInSeconds.reduce((totalDuration, duration) => totalDuration + duration) * defaultNumberOfTeams);
          }
        },
      ));
}
