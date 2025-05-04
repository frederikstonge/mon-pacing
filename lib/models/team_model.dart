import 'package:dart_mappable/dart_mappable.dart';

import '../repositories/legacy_entities/match_team_entity.dart';
import '../repositories/legacy_entities/team_entity.dart';
import 'performer_model.dart';

part 'team_model.mapper.dart';

@MappableClass()
class TeamModel with TeamModelMappable {
  final int id;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String name;
  final int color;
  final List<PerformerModel> performers;
  final List<String> tags;
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

  factory TeamModel.fromLegacyEntity({required TeamEntity entity}) => TeamModel(
    id: entity.id,
    createdDate: entity.createdDate,
    modifiedDate: entity.modifiedDate,
    name: entity.name,
    color: entity.color,
    performers:
        entity.performers
            .asMap()
            .entries
            .map((e) => PerformerModel.fromLegacyEntity(entity: e.value, order: e.key))
            .toList(),
    tags: entity.tags,
  );

  factory TeamModel.fromLegacyEmbededEntity({required MatchTeamEntity entity}) => TeamModel(
    id: entity.id,
    createdDate: null,
    modifiedDate: null,
    name: entity.name,
    color: entity.color,
    performers:
        entity.performers
            .asMap()
            .entries
            .map((e) => PerformerModel.fromLegacyEntity(entity: e.value, order: e.key))
            .toList(),
    integrationEntityId: entity.integrationEntityId,
    integrationAdditionalData: entity.integrationAdditionalData,
  );

  TeamEntity toLegacyEntity() => TeamEntity(
    id: id,
    createdDate: createdDate,
    modifiedDate: modifiedDate,
    name: name,
    color: color,
    performers: performers.map((e) => e.toLegacyEntity()).toList(),
    tags: tags,
  );

  MatchTeamEntity toLegacyEmbededEntity() => MatchTeamEntity(
    id: id,
    name: name,
    color: color,
    performers: performers.map((e) => e.toLegacyEntity()).toList(),
    integrationEntityId: integrationEntityId,
    integrationAdditionalData: integrationAdditionalData,
  );
}
