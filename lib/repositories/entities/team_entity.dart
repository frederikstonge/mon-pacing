import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

import 'performer_entity.dart';

part 'team_entity.mapper.dart';
part 'team_entity.g.dart';

@MappableClass()
@Collection(accessor: 'teamModels')
@Name('TeamModel')
class TeamEntity with TeamEntityMappable {
  final int id;
  @index
  final DateTime? createdDate;
  @index
  final DateTime? modifiedDate;
  @index
  final String name;
  final int color;
  final List<PerformerEntity> performers;
  final List<String> tags;

  const TeamEntity({
    required this.id,
    required this.createdDate,
    required this.modifiedDate,
    required this.name,
    required this.color,
    this.performers = const [],
    this.tags = const [],
  });

  List<String> get performerNames => performers.map((p) => p.name).toList();
}
