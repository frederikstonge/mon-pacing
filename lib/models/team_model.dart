import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

import '../repositories/app_database.dart';
import 'performer_model.dart';

part 'team_model.mapper.dart';
part 'team_model.g.dart';

@MappableClass()
@collection
class TeamModel with TeamModelMappable {
  final int id;
  @index
  final DateTime? createdDate;
  @index
  final DateTime? modifiedDate;
  @index
  final String name;
  final int color;
  final List<PerformerModel> performers;
  final List<String> tags;
  final String? integrationId;
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
    this.integrationId,
    this.integrationEntityId,
    this.integrationAdditionalData,
  });

  List<String> get performerNames => performers.map((p) => p.name).toList();

  factory TeamModel.fromEntity(
    TeamEntityData team,
    List<PerformerEntityData> performers,
    List<TagEntityData> tags,
  ) {
    return TeamModel(
      id: team.id,
      createdDate: team.createdDate,
      modifiedDate: team.modifiedDate,
      name: team.name,
      color: team.color,
      performers: performers.map((p) => PerformerModel.fromEntity(p)).toList(),
      tags: tags.map((e) => e.name).toList(),
      integrationId: team.integrationId,
      integrationEntityId: team.integrationEntityId,
      integrationAdditionalData: team.integrationAdditionalData,
    );
  }

  TeamEntityData toEntity() {
    return TeamEntityData(
      id: id,
      createdDate: createdDate ?? DateTime.now(),
      modifiedDate: modifiedDate ?? DateTime.now(),
      name: name,
      color: color,
      integrationId: integrationId,
      integrationEntityId: integrationEntityId,
      integrationAdditionalData: integrationAdditionalData,
    );
  }
}
