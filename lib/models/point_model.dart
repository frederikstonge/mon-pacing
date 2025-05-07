import 'package:dart_mappable/dart_mappable.dart';

import '../repositories/entities/point_entity.dart';

part 'point_model.mapper.dart';

@MappableClass()
class PointModel with PointModelMappable {
  final int id;
  final int teamId;
  final int improvisationId;
  final int value;

  const PointModel({required this.id, required this.teamId, required this.improvisationId, required this.value});

  factory PointModel.fromEntity({required PointEntity entity}) =>
      PointModel(id: entity.id, teamId: entity.teamId, improvisationId: entity.improvisationId, value: entity.value);

  PointEntity toEntity() => PointEntity(id: id, teamId: teamId, improvisationId: improvisationId, value: value);
}
