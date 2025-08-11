import 'package:dart_mappable/dart_mappable.dart';

import '../repositories/entities/penalty_entity.dart';
import 'integration_base_model.dart';

part 'penalty_model.mapper.dart';

@MappableClass()
class PenaltyModel extends IntegrationBaseModel with PenaltyModelMappable {
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
    super.integrationEntityId,
    super.integrationAdditionalData,
  });

  factory PenaltyModel.fromEntity({required PenaltyEntity entity}) => PenaltyModel(
    id: entity.id,
    major: entity.major,
    type: entity.type,
    performerId: entity.performerId,
    teamId: entity.teamId,
    improvisationId: entity.improvisationId,
    integrationEntityId: entity.integrationEntityId,
    integrationAdditionalData: entity.integrationAdditionalData,
  );

  PenaltyEntity toEntity() => PenaltyEntity(
    id: id < 0 ? 0 : id,
    major: major,
    type: type,
    performerId: performerId,
    teamId: teamId,
    improvisationId: improvisationId,
    integrationEntityId: integrationEntityId,
    integrationAdditionalData: integrationAdditionalData,
  );
}
