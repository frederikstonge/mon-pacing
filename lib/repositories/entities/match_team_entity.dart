import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

import 'performer_entity.dart';

part 'match_team_entity.mapper.dart';
part 'match_team_entity.g.dart';

@MappableClass()
@Embedded(ignore: {'copyWith'})
@Name('MatchTeamModel')
class MatchTeamEntity with MatchTeamEntityMappable {
  final int id;
  final String name;
  final int color;
  final List<PerformerEntity> performers;
  final String? integrationEntityId;
  final String? integrationAdditionalData;

  const MatchTeamEntity({
    required this.id,
    required this.name,
    required this.color,
    this.performers = const [],
    this.integrationEntityId,
    this.integrationAdditionalData,
  });
}
