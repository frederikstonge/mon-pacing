import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

import '../repositories/app_database.dart';

part 'performer_model.mapper.dart';
part 'performer_model.g.dart';

@MappableClass()
@Embedded(ignore: {'copyWith'})
class PerformerModel with PerformerModelMappable {
  final int id;
  final String name;
  final int? teamId;
  final DateTime? createdDate;
  final DateTime? modifiedDate;

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

  PerformerEntityData toEntity() {
    return PerformerEntityData(
      id: id,
      createdDate: createdDate ?? DateTime.now(),
      modifiedDate: modifiedDate ?? DateTime.now(),
      name: name,
      team: teamId,
      integrationEntityId: integrationEntityId,
      integrationAdditionalData: integrationAdditionalData,
    );
  }
}
