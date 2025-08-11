import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../repositories/entities/pacing_entity.dart';
import 'improvisation_model.dart';
import 'integration_base_model.dart';
import 'tag_base_model.dart';
import 'tag_model.dart';

part 'pacing_model.mapper.dart';

@MappableClass()
class PacingModel extends IntegrationBaseModel with PacingModelMappable implements TagBaseModel {
  final int id;
  final String name;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final List<ImprovisationModel> improvisations;
  final int defaultNumberOfTeams;

  @override
  final List<TagModel> tags;

  const PacingModel({
    required this.id,
    required this.name,
    required this.createdDate,
    required this.modifiedDate,
    required this.improvisations,
    this.defaultNumberOfTeams = 2,
    this.tags = const [],
    super.integrationId,
    super.integrationEntityId,
    super.integrationAdditionalData,
  });

  factory PacingModel.fromEntity({required PacingEntity entity}) => PacingModel(
    id: entity.id,
    name: entity.name,
    createdDate: entity.createdDate,
    modifiedDate: entity.modifiedDate,
    defaultNumberOfTeams: entity.defaultNumberOfTeams,
    improvisations: entity.improvisations
        .sortedBy((e) => e.order)
        .map((e) => ImprovisationModel.fromEntity(entity: e))
        .toList(),
    tags: entity.tags.map((e) => TagModel.fromEntity(entity: e)).toList(),
    integrationId: entity.integrationId,
    integrationEntityId: entity.integrationEntityId,
    integrationAdditionalData: entity.integrationAdditionalData,
  );

  PacingEntity toEntity() {
    final pacing = PacingEntity(
      id: id < 0 ? 0 : id,
      name: name,
      createdDate: createdDate,
      modifiedDate: modifiedDate,
      defaultNumberOfTeams: defaultNumberOfTeams,
      integrationId: integrationId,
      integrationEntityId: integrationEntityId,
      integrationAdditionalData: integrationAdditionalData,
    );

    pacing.improvisations.addAll(improvisations.asMap().entries.map((e) => e.value.toEntity(e.key)).toList());
    pacing.tags.addAll(tags.map((e) => e.toEntity()).toList());
    return pacing;
  }
}
