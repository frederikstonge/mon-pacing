import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import 'entities/point_entity_model.dart';

part 'point_model.freezed.dart';
part 'point_model.g.dart';

@freezed
@Embedded(ignore: {'copyWith'})
class PointModel with _$PointModel {
  const factory PointModel({
    required int id,
    required int teamId,
    required int improvisationId,
    required int value,
  }) = _PointModel;

  factory PointModel.fromJson(Map<String, dynamic> json) => _$PointModelFromJson(json);

  factory PointModel.fromEntity(PointEntityModel model) => PointModel(
        id: model.id,
        teamId: model.teamId,
        improvisationId: model.improvisationId,
        value: model.value,
      );

  PointEntityModel toEntity() => PointEntityModel(
        id: this.id,
        teamId: teamId,
        improvisationId: improvisationId,
        value: value,
      );
}
