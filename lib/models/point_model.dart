import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

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
}
