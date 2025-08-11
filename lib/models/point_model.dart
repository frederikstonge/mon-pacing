import 'package:dart_mappable/dart_mappable.dart';

import '../repositories/entities/point_entity.dart';
import 'integration_base_model.dart';

part 'point_model.mapper.dart';

@MappableClass()
class PointModel extends IntegrationBaseModel with PointModelMappable {
  final int id;
  final int teamId;
  final int improvisationId;
  final int value;

  const PointModel({
    required this.id,
    required this.teamId,
    required this.improvisationId,
    required this.value,
    super.integrationEntityId,
    super.integrationAdditionalData,
  });

  factory PointModel.fromEntity({required PointEntity entity}) => PointModel(
    id: entity.id,
    teamId: entity.teamId,
    improvisationId: entity.improvisationId,
    value: entity.value,
    integrationEntityId: entity.integrationEntityId,
    integrationAdditionalData: entity.integrationAdditionalData,
  );

  PointEntity toEntity() => PointEntity(
    id: id < 0 ? 0 : id,
    teamId: teamId,
    improvisationId: improvisationId,
    value: value,
    integrationEntityId: integrationEntityId,
    integrationAdditionalData: integrationAdditionalData,
  );
}
