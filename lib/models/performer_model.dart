import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../repositories/app_database.dart';

part 'performer_model.mapper.dart';

@MappableClass()
class PerformerModel with PerformerModelMappable {
  final int? id;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String name;
  final int? teamId;

  final String? integrationEntityId;
  final String? integrationAdditionalData;

  const PerformerModel({
    required this.id,
    required this.name,
    required this.teamId,
    this.createdDate,
    this.modifiedDate,
    this.integrationEntityId,
    this.integrationAdditionalData,
  });

  factory PerformerModel.fromEntity(
    PerformerEntityData performer,
  ) {
    return PerformerModel(
      id: performer.id,
      name: performer.name,
      createdDate: performer.createdDate,
      modifiedDate: performer.modifiedDate,
      teamId: performer.team,
      integrationEntityId: performer.integrationEntityId,
      integrationAdditionalData: performer.integrationAdditionalData,
    );
  }

  PerformerEntityCompanion toCompanion({int? teamId}) {
    return PerformerEntityCompanion(
      id: id != null ? Value(id!) : Value.absent(),
      createdDate: Value(createdDate ?? DateTime.now()),
      modifiedDate: Value(modifiedDate ?? DateTime.now()),
      name: Value(name),
      team: Value(teamId ?? this.teamId!),
      integrationEntityId: Value(integrationEntityId),
      integrationAdditionalData: Value(integrationAdditionalData),
    );
  }
}
