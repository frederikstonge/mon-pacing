import 'package:dart_mappable/dart_mappable.dart';

import '../repositories/legacy_entities/pacing_entity.dart';
import 'improvisation_model.dart';

part 'pacing_model.mapper.dart';

@MappableClass()
class PacingModel with PacingModelMappable {
  final int id;
  final String name;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final List<ImprovisationModel> improvisations;
  final int defaultNumberOfTeams;
  final List<String> tags;
  final String? integrationId;
  final String? integrationEntityId;
  final String? integrationAdditionalData;

  const PacingModel({
    required this.id,
    required this.name,
    required this.createdDate,
    required this.modifiedDate,
    required this.improvisations,
    this.defaultNumberOfTeams = 2,
    this.tags = const [],
    this.integrationId,
    this.integrationEntityId,
    this.integrationAdditionalData,
  });

  factory PacingModel.fromEntity({required PacingEntity entity}) => PacingModel(
    id: entity.id,
    name: entity.name,
    createdDate: entity.createdDate,
    modifiedDate: entity.modifiedDate,
    improvisations:
        entity.improvisations
            .asMap()
            .entries
            .map((e) => ImprovisationModel.fromEntity(entity: e.value, order: e.key))
            .toList(),
    defaultNumberOfTeams: entity.defaultNumberOfTeams,
    tags: entity.tags,
    integrationId: entity.integrationId,
    integrationEntityId: entity.integrationEntityId,
    integrationAdditionalData: entity.integrationAdditionalData,
  );

  PacingEntity toEntity() => PacingEntity(
    id: id,
    name: name,
    createdDate: createdDate,
    modifiedDate: modifiedDate,
    improvisations: improvisations.map((e) => e.toEntity()).toList(),
    defaultNumberOfTeams: defaultNumberOfTeams,
    tags: tags,
    integrationId: integrationId,
    integrationEntityId: integrationEntityId,
    integrationAdditionalData: integrationAdditionalData,
  );
}
