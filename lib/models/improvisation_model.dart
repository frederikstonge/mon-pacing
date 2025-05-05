import 'package:dart_mappable/dart_mappable.dart';

import '../repositories/entities/improvisation_entity.dart';
import 'improvisation_type.dart';

part 'improvisation_model.mapper.dart';

@MappableClass()
class ImprovisationModel with ImprovisationModelMappable {
  final int id;
  final int order;
  final ImprovisationType type;
  final String category;
  final String theme;
  final List<int> durationsInSeconds;
  final String performers;
  final String notes;
  final int timeBufferInSeconds;
  final int huddleTimerInSeconds;
  final String? integrationEntityId;
  final String? integrationAdditionalData;

  const ImprovisationModel({
    required this.id,
    required this.order,
    required this.type,
    required this.category,
    required this.theme,
    required this.durationsInSeconds,
    required this.performers,
    required this.notes,
    this.timeBufferInSeconds = 30,
    this.huddleTimerInSeconds = 30,
    this.integrationEntityId,
    this.integrationAdditionalData,
  });

  factory ImprovisationModel.fromEntity({required ImprovisationEntity entity}) => ImprovisationModel(
    id: entity.id,
    order: entity.order,
    type: ImprovisationType.values.elementAt(entity.type),
    category: entity.category,
    theme: entity.theme,
    durationsInSeconds: entity.durationsInSeconds,
    performers: entity.performers,
    notes: entity.notes,
    timeBufferInSeconds: entity.timeBufferInSeconds,
    huddleTimerInSeconds: entity.huddleTimerInSeconds,
    integrationEntityId: entity.integrationEntityId,
    integrationAdditionalData: entity.integrationAdditionalData,
  );

  ImprovisationEntity toEntity() => ImprovisationEntity(
    id: id,
    order: order,
    type: type.index,
    category: category,
    theme: theme,
    durationsInSeconds: durationsInSeconds,
    performers: performers,
    notes: notes,
    timeBufferInSeconds: timeBufferInSeconds,
    huddleTimerInSeconds: huddleTimerInSeconds,
    integrationEntityId: integrationEntityId,
    integrationAdditionalData: integrationAdditionalData,
  );

  ImprovisationModel createNew() => copyWith(id: 0);
}
