import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

import '../repositories/app_database.dart';
import 'improvisation_model.dart';
import 'improvisation_type.dart';

part 'pacing_model.mapper.dart';
part 'pacing_model.g.dart';

@MappableClass()
@collection
class PacingModel with PacingModelMappable {
  final int id;
  @index
  final String name;
  @index
  final DateTime? createdDate;
  @index
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

  List<String> get categories => improvisations.where((e) => e.category.isNotEmpty).map((e) => e.category).toList();

  List<String> get themes => improvisations.where((e) => e.theme.isNotEmpty).map((e) => e.theme).toList();

  factory PacingModel.fromEntity(
    PacingEntityData pacing,
    List<ImprovisationEntityData> improvisations,
    List<TagEntityData> tags,
  ) {
    return PacingModel(
      id: pacing.id,
      name: pacing.name,
      createdDate: pacing.createdDate,
      modifiedDate: pacing.modifiedDate,
      improvisations: improvisations.map((e) => ImprovisationModel.fromEntity(e)).toList(),
      defaultNumberOfTeams: pacing.defaultNumberOfTeams,
      tags: tags.map((e) => e.name).toList(),
      integrationId: pacing.integrationId,
      integrationEntityId: pacing.integrationEntityId,
      integrationAdditionalData: pacing.integrationAdditionalData,
    );
  }

  PacingEntityData toEntity() {
    return PacingEntityData(
      id: id,
      name: name,
      createdDate: createdDate ?? DateTime.now(),
      modifiedDate: modifiedDate ?? DateTime.now(),
      defaultNumberOfTeams: defaultNumberOfTeams,
      integrationId: integrationId,
      integrationEntityId: integrationEntityId,
      integrationAdditionalData: integrationAdditionalData,
    );
  }
}
