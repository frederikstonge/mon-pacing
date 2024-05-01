import '../models/entities/pacing_entity_model.dart';
import '../models/improvisation_type.dart';
import '../models/pacing_model.dart';
import '../objectbox.g.dart';
import 'improvisation_extensions.dart';

extension PacingExtensions on PacingModel {
  PacingEntityModel toEntity() => PacingEntityModel(
        id: id,
        name: name,
        createdDate: createdDate,
        modifiedDate: modifiedDate,
        improvisations: ToMany(items: improvisations.asMap().entries.map((e) => e.value.toEntity(e.key)).toList()),
        defaultNumberOfTeams: defaultNumberOfTeams,
      );

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
