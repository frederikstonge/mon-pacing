import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

import '../repositories/app_database.dart';

part 'point_model.mapper.dart';
part 'point_model.g.dart';

@MappableClass()
@Embedded(ignore: {'copyWith'})
class PointModel with PointModelMappable {
  final int id;
  final int teamId;
  final int improvisationId;
  final int value;
  final int? matchId;
  final DateTime? createdDate;
  final DateTime? modifiedDate;

  const PointModel({
    required this.id,
    required this.teamId,
    required this.improvisationId,
    required this.value,
    required this.matchId,
    this.createdDate,
    this.modifiedDate,
  });

  factory PointModel.fromEntity(
    PointEntityData point,
  ) {
    return PointModel(
      id: point.id,
      teamId: point.team,
      improvisationId: point.improvisation,
      matchId: point.match,
      value: point.value,
      createdDate: point.createdDate,
      modifiedDate: point.modifiedDate,
    );
  }

  PointEntityData toEntity() {
    return PointEntityData(
      id: id,
      createdDate: createdDate ?? DateTime.now(),
      modifiedDate: modifiedDate ?? DateTime.now(),
      team: teamId,
      improvisation: improvisationId,
      match: matchId,
      value: value,
    );
  }
}
