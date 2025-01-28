import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

import '../repositories/app_database.dart';

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
  final int? matchId;
  final DateTime? createdDate;
  final DateTime? modifiedDate;

  const PenaltyModel({
    required this.id,
    required this.major,
    required this.type,
    required this.performerId,
    required this.improvisationId,
    required this.teamId,
    required this.matchId,
    this.createdDate,
    this.modifiedDate,
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
      matchId: penalty.match,
      modifiedDate: penalty.modifiedDate,
      createdDate: penalty.createdDate,
    );
  }

  PenaltyEntityData toEntity() {
    return PenaltyEntityData(
      id: id,
      createdDate: createdDate ?? DateTime.now(),
      modifiedDate: modifiedDate ?? DateTime.now(),
      type: type,
      major: major,
      performer: performerId,
      team: teamId,
      improvisation: improvisationId,
      match: matchId,
    );
  }
}
