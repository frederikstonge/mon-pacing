import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../repositories/app_database.dart';
import 'performer_model.dart';

part 'team_model.mapper.dart';

@MappableClass()
class TeamModel with TeamModelMappable {
  final int? id;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String name;
  final int color;
  final List<PerformerModel> performers;
  final List<String>? tags;
  final String? integrationId;
  final String? integrationEntityId;
  final String? integrationAdditionalData;
  final int? matchId;

  const TeamModel({
    required this.id,
    required this.name,
    required this.color,
    required this.matchId,
    required this.performers,
    this.tags = const [],
    this.modifiedDate,
    this.createdDate,
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
      matchId: team.match,
    );
  }

  TeamEntityCompanion toCompanion({int? matchId}) {
    return TeamEntityCompanion(
      id: id != null ? Value(id!) : Value.absent(),
      createdDate: Value(createdDate ?? DateTime.now()),
      modifiedDate: Value(modifiedDate ?? DateTime.now()),
      name: Value(name),
      color: Value(color),
      integrationId: Value(integrationId),
      integrationEntityId: Value(integrationEntityId),
      integrationAdditionalData: Value(integrationAdditionalData),
      match: Value(matchId ?? this.matchId),
    );
  }
}
