import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../repositories/entities/team_entity.dart';
import 'performer_model.dart';
import 'tag_base_model.dart';
import 'tag_model.dart';

part 'team_model.mapper.dart';

@MappableClass()
class TeamModel extends TagBaseModel with TeamModelMappable {
  final int id;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String name;
  final int color;
  final List<PerformerModel> performers;
  final String? integrationEntityId;
  final String? integrationAdditionalData;

  const TeamModel({
    required this.id,
    required this.createdDate,
    required this.modifiedDate,
    required this.name,
    required this.color,
    this.performers = const [],
    this.integrationEntityId,
    this.integrationAdditionalData,
    super.tags = const [],
  });

  factory TeamModel.fromEntity({required TeamEntity entity}) => TeamModel(
    id: entity.id,
    createdDate: entity.createdDate,
    modifiedDate: entity.modifiedDate,
    name: entity.name,
    color: entity.color,
    performers: entity.performers.sortedBy((e) => e.order).map((e) => PerformerModel.fromEntity(entity: e)).toList(),
    tags: entity.tags.map((e) => TagModel.fromEntity(entity: e)).toList(),
    integrationEntityId: entity.integrationEntityId,
    integrationAdditionalData: entity.integrationAdditionalData,
  );

  TeamEntity toEntity({bool hasMatch = false}) {
    final team = TeamEntity(
      id: id < 0 ? 0 : id,
      createdDate: createdDate,
      modifiedDate: modifiedDate,
      name: name,
      color: color,
      hasMatch: hasMatch,
      integrationEntityId: integrationEntityId,
      integrationAdditionalData: integrationAdditionalData,
    );

    team.performers.addAll(performers.asMap().entries.map((e) => e.value.toEntity(e.key)).toList());
    team.tags.addAll(tags.map((e) => e.toEntity()).toList());
    return team;
  }
}
