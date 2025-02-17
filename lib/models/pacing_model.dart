import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../repositories/app_database.dart';
import 'improvisation_model.dart';

part 'pacing_model.mapper.dart';

@MappableClass()
class PacingModel with PacingModelMappable {
  final int? id;
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
    required this.improvisations,
    this.defaultNumberOfTeams = 2,
    this.tags = const [],
    this.createdDate,
    this.modifiedDate,
    this.integrationId,
    this.integrationEntityId,
    this.integrationAdditionalData,
  });

  factory PacingModel.fromEntity(
    PacingEntityData pacing,
    List<ImprovisationModel> improvisations,
    List<String> tags,
  ) {
    return PacingModel(
      id: pacing.id,
      name: pacing.name,
      createdDate: pacing.createdDate,
      modifiedDate: pacing.modifiedDate,
      improvisations: improvisations,
      defaultNumberOfTeams: pacing.defaultNumberOfTeams,
      tags: tags,
      integrationId: pacing.integrationId,
      integrationEntityId: pacing.integrationEntityId,
      integrationAdditionalData: pacing.integrationAdditionalData,
    );
  }

  PacingEntityCompanion toCompanion() {
    return PacingEntityCompanion(
      id: id != null ? Value(id!) : Value.absent(),
      createdDate: Value(createdDate ?? DateTime.now()),
      modifiedDate: Value(modifiedDate ?? DateTime.now()),
      name: Value(name),
      defaultNumberOfTeams: Value(defaultNumberOfTeams),
      integrationId: Value(integrationId),
      integrationEntityId: Value(integrationEntityId),
      integrationAdditionalData: Value(integrationAdditionalData),
    );
  }
}
