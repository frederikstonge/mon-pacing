import 'package:dart_mappable/dart_mappable.dart';

import '../repositories/entities/star_entity.dart';
import 'integration_base_model.dart';

part 'star_model.mapper.dart';

@MappableClass()
class StarModel extends IntegrationBaseModel with StarModelMappable {
  final int id;
  final int performerId;
  final int teamId;

  const StarModel({
    required this.id,
    required this.performerId,
    required this.teamId,
    super.integrationEntityId,
    super.integrationAdditionalData,
  });

  factory StarModel.fromEntity({required StarEntity entity}) => StarModel(
    id: entity.id,
    performerId: entity.performerId,
    teamId: entity.teamId,
    integrationEntityId: entity.integrationEntityId,
    integrationAdditionalData: entity.integrationAdditionalData,
  );

  StarEntity toEntity(int order) => StarEntity(
    id: id < 0 ? 0 : id,
    order: order,
    performerId: performerId,
    teamId: teamId,
    integrationEntityId: integrationEntityId,
    integrationAdditionalData: integrationAdditionalData,
  );
}
