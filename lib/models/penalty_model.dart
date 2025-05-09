import 'package:dart_mappable/dart_mappable.dart';

import '../repositories/entities/penalty_entity.dart';

part 'penalty_model.mapper.dart';

@MappableClass()
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
    required this.teamId,
    required this.improvisationId,
  });

  factory PenaltyModel.fromEntity({required PenaltyEntity entity}) => PenaltyModel(
    id: entity.id,
    major: entity.major,
    type: entity.type,
    performerId: entity.performerId,
    teamId: entity.teamId,
    improvisationId: entity.improvisationId,
  );

  PenaltyEntity toEntity() => PenaltyEntity(
    id: id < 0 ? 0 : id,
    major: major,
    type: type,
    performerId: performerId,
    teamId: teamId,
    improvisationId: improvisationId,
  );
}
