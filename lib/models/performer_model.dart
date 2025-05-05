import 'package:dart_mappable/dart_mappable.dart';

import '../repositories/entities/performer_entity.dart';

part 'performer_model.mapper.dart';

@MappableClass()
class PerformerModel with PerformerModelMappable {
  final int id;
  final int order;
  final String name;
  final String? integrationEntityId;
  final String? integrationAdditionalData;

  const PerformerModel({
    required this.id,
    required this.order,
    required this.name,
    this.integrationEntityId,
    this.integrationAdditionalData,
  });

  factory PerformerModel.fromEntity({required PerformerEntity entity}) => PerformerModel(
    id: entity.id,
    name: entity.name,
    order: entity.order,
    integrationEntityId: entity.integrationEntityId,
    integrationAdditionalData: entity.integrationAdditionalData,
  );

  PerformerEntity toEntity() => PerformerEntity(
    id: id,
    name: name,
    order: order,
    integrationEntityId: integrationEntityId,
    integrationAdditionalData: integrationAdditionalData,
  );
}
