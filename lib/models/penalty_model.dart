import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import 'entities/penalty_entity_model.dart';

part 'penalty_model.freezed.dart';
part 'penalty_model.g.dart';

@freezed
@Embedded(ignore: {'copyWith'})
class PenaltyModel with _$PenaltyModel {
  const factory PenaltyModel({
    required int id,
    required bool major,
    required String type,
    required String performer,
    required int teamId,
    required int improvisationId,
  }) = _PenaltyModel;

  factory PenaltyModel.fromJson(Map<String, dynamic> json) => _$PenaltyModelFromJson(json);

  factory PenaltyModel.fromEntity(PenaltyEntityModel model) => PenaltyModel(
        id: model.id,
        major: model.major,
        type: model.type,
        performer: model.performer,
        teamId: model.teamId,
        improvisationId: model.improvisationId,
      );
}
