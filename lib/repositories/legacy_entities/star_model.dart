import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

import '../app_database.dart';

part 'star_model.mapper.dart';
part 'star_model.g.dart';

@MappableClass()
@Embedded(ignore: {'copyWith'})
class StarModel with StarModelMappable {
  final int id;
  final int performerId;
  final int teamId;

  const StarModel({
    required this.id,
    required this.performerId,
    required this.teamId,
  });

  StarEntityData toEntity(int matchId) {
    return StarEntityData(
      id: id,
      createdDate: DateTime.now(),
      modifiedDate: DateTime.now(),
      performer: performerId,
      team: teamId,
      match: matchId,
    );
  }
}
