import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

import '../app_database.dart';
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

  const TeamModel({
    required this.id,
    required this.createdDate,
    required this.modifiedDate,
    required this.name,
    required this.color,
    this.performers = const [],
    this.tags = const [],
  });

  List<String> get performerNames => performers.map((p) => p.name).toList();

  TeamEntityData toEntity() {
    return TeamEntityData(
      id: id,
      createdDate: createdDate ?? DateTime.now(),
      modifiedDate: modifiedDate ?? DateTime.now(),
      name: name,
      color: color,
    );
  }
}
