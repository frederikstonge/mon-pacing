import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

import '../../../models/improvisation_type.dart';
import 'improvisation_entity.dart';

part 'pacing_entity.mapper.dart';
part 'pacing_entity.g.dart';

@MappableClass()
@Collection(accessor: 'pacingModels')
@Name('PacingModel')
class PacingEntity with PacingEntityMappable {
  final int id;
  @index
  final String name;
  @index
  final DateTime? createdDate;
  @index
  final DateTime? modifiedDate;
  final List<ImprovisationEntity> improvisations;
  final int defaultNumberOfTeams;
  final List<String> tags;
  final String? integrationId;
  final String? integrationEntityId;
  final String? integrationAdditionalData;

  const PacingEntity({
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
}
