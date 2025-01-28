import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

import '../repositories/app_database.dart';
import 'performer_model.dart';

part 'match_team_model.mapper.dart';
part 'match_team_model.g.dart';

@MappableClass()
@Embedded(ignore: {'copyWith'})
@Deprecated('TeamModel will be used once we swap isar for drift')
class MatchTeamModel with MatchTeamModelMappable {
  final int id;
  final String name;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final int color;
  final List<PerformerModel> performers;
  final List<String> tags;
  final String? integrationId;
  final String? integrationEntityId;
  final String? integrationAdditionalData;

  const MatchTeamModel({
    required this.id,
    required this.name,
    required this.color,
    this.performers = const [],
    this.createdDate,
    this.modifiedDate,
    this.tags = const [],
    this.integrationId,
    this.integrationEntityId,
    this.integrationAdditionalData,
  });

  factory MatchTeamModel.fromEntity(
    TeamEntityData team,
    List<PerformerEntityData> performers,
  ) {
    return MatchTeamModel(
      id: team.id,
      createdDate: team.createdDate,
      modifiedDate: team.modifiedDate,
      name: team.name,
      color: team.color,
      performers: performers.map((p) => PerformerModel.fromEntity(p)).toList(),
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
