import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

import 'performer_model.dart';

part 'match_team_model.mapper.dart';
part 'match_team_model.g.dart';

@MappableClass()
@Embedded(ignore: {'copyWith'})
class MatchTeamModel with MatchTeamModelMappable {
  final int id;
  final String name;
  final int color;
  final List<PerformerModel> performers;
  final String? integrationEntityId;
  final String? integrationAdditionalData;

  const MatchTeamModel({
    required this.id,
    required this.name,
    required this.color,
    this.performers = const [],
    this.integrationEntityId,
    this.integrationAdditionalData,
  });
}
