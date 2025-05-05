import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../repositories/entities/team_entity.dart';
import 'performer_model.dart';
import 'tag_model.dart';

part 'team_model.mapper.dart';

@MappableClass()
class TeamModel with TeamModelMappable {
  final int id;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String name;
  final int color;
  final List<PerformerModel> performers;
  final List<TagModel> tags;
  final String? integrationEntityId;
  final String? integrationAdditionalData;

  const TeamModel({
    required this.id,
    required this.createdDate,
    required this.modifiedDate,
    required this.name,
    required this.color,
    this.performers = const [],
    this.tags = const [],
    this.integrationEntityId,
    this.integrationAdditionalData,
  });

  factory TeamModel.fromEntity({required TeamEntity entity}) => TeamModel(
    id: entity.id,
    createdDate: entity.createdDate,
    modifiedDate: entity.modifiedDate,
    name: entity.name,
    color: entity.color,
    performers: entity.performers.map((e) => PerformerModel.fromEntity(entity: e)).sortedBy((e) => e.order).toList(),
    tags: entity.tags.map((e) => TagModel.fromEntity(entity: e)).toList(),
  );

  TeamEntity toEntity() {
    final team = TeamEntity(id: id, createdDate: createdDate, modifiedDate: modifiedDate, name: name, color: color);

    team.performers.addAll(performers.map((e) => e.toEntity()).toList());
    team.tags.addAll(tags.map((e) => e.toEntity()).toList());
    return team;
  }

  TeamModel createNew() => copyWith(
    id: 0,
    performers: List<PerformerModel>.from(performers.map((e) => e.createNew())),
    tags: List<TagModel>.from(tags.map((e) => e.createNew())),
  );
}
