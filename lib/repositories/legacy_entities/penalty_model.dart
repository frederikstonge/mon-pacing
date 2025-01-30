import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

import '../app_database.dart';

part 'penalty_model.mapper.dart';
part 'penalty_model.g.dart';

@MappableClass()
@Embedded(ignore: {'copyWith'})
class PenaltyModel with PenaltyModelMappable {
  final int id;
  final bool major;
  final String type;
  final int? performerId;
  final int teamId;
  final int improvisationId;

  const PenaltyModel({
    required this.id,
    required this.major,
    required this.type,
    required this.performerId,
    required this.improvisationId,
    required this.teamId,
  });

  factory PenaltyModel.fromEntity(
    PenaltyEntityData penalty,
  ) {
    return PenaltyModel(
      id: penalty.id,
      type: penalty.type,
      major: penalty.major,
      performerId: penalty.performer,
      teamId: penalty.team,
      improvisationId: penalty.improvisation,
    );
  }

  PenaltyEntityData toEntity(int matchId) {
    return PenaltyEntityData(
      id: id,
      createdDate: DateTime.now(),
      modifiedDate: DateTime.now(),
      type: type,
      major: major,
      performer: performerId,
      team: teamId,
      improvisation: improvisationId,
      match: matchId,
    );
  }
}
