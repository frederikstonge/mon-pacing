import 'package:dart_mappable/dart_mappable.dart';

import '../repositories/entities/performer_entity.dart';
import 'integration_base_model.dart';

part 'performer_model.mapper.dart';

@MappableClass()
class PerformerModel extends IntegrationBaseModel with PerformerModelMappable {
  final int id;
  final String name;

  const PerformerModel({
    required this.id,
    required this.name,
    super.integrationEntityId,
    super.integrationAdditionalData,
  });

  factory PerformerModel.fromEntity({required PerformerEntity entity}) => PerformerModel(
    id: entity.id,
    name: entity.name,
    integrationEntityId: entity.integrationEntityId,
    integrationAdditionalData: entity.integrationAdditionalData,
  );

  PerformerEntity toEntity(int order) => PerformerEntity(
    id: id < 0 ? 0 : id,
    name: name,
    order: order,
    integrationEntityId: integrationEntityId,
    integrationAdditionalData: integrationAdditionalData,
  );
}
