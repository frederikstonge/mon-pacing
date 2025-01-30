import 'package:dart_mappable/dart_mappable.dart';

import '../repositories/app_database.dart';
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
  final List<String>? tags;
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

  factory TeamModel.fromEntity(
    TeamEntityData team,
    List<PerformerModel> performers,
    List<String>? tags,
  ) {
    return TeamModel(
      id: team.id,
      createdDate: team.createdDate,
      modifiedDate: team.modifiedDate,
      name: team.name,
      color: team.color,
      performers: performers,
      tags: tags,
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
