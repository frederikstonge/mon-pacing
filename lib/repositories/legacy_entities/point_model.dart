import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

import '../app_database.dart';

part 'point_model.mapper.dart';
part 'point_model.g.dart';

@MappableClass()
@Embedded(ignore: {'copyWith'})
class PointModel with PointModelMappable {
  final int id;
  final int teamId;
  final int improvisationId;
  final int value;

  const PointModel({
    required this.id,
    required this.teamId,
    required this.improvisationId,
    required this.value,
  });

  PointEntityData toEntity(int matchId) {
    return PointEntityData(
      id: id,
      createdDate: DateTime.now(),
      modifiedDate: DateTime.now(),
      team: teamId,
      improvisation: improvisationId,
      match: matchId,
      value: value,
    );
  }
}
