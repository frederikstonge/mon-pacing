import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../repositories/app_database.dart';

part 'point_model.mapper.dart';

@MappableClass()
class PointModel with PointModelMappable {
  final int? id;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final int value;
  final int? teamId;
  final int? improvisationId;
  final int? matchId;

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

  PointEntityCompanion toCompanion({int? teamId, int? improvisationId, int? matchId}) {
    return PointEntityCompanion(
      id: id != null ? Value(id!) : Value.absent(),
      createdDate: Value(createdDate ?? DateTime.now()),
      modifiedDate: Value(modifiedDate ?? DateTime.now()),
      value: Value(value),
      team: Value(teamId ?? this.teamId!),
      improvisation: Value(improvisationId ?? this.improvisationId!),
      match: Value(matchId ?? this.matchId!),
    );
  }
}
