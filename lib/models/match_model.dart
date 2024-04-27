// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import 'base_model.dart';
import 'improvisation_model.dart';
import 'improvisation_type.dart';
import 'penalties_impact_type.dart';
import 'penalty_model.dart';
import 'point_model.dart';
import 'team_model.dart';

part 'match_model.freezed.dart';
part 'match_model.g.dart';

@freezed
@collection
class MatchModel with _$MatchModel implements BaseModel {
  @Implements<BaseModel>()
  const factory MatchModel({
    required int id,
    @index required String name,
    @index required DateTime? createdDate,
    required DateTime? modifiedDate,
    required List<TeamModel> teams,
    required List<ImprovisationModel> improvisations,
    required List<PenaltyModel> penalties,
    required List<PointModel> points,
    required bool enablePenaltiesImpactPoints,
    required PenaltiesImpactType penaltiesImpactType,
    required int penaltiesRequiredToImpactPoints,
  }) = _MatchModel;

  factory MatchModel.fromJson(Map<String, Object?> json) => _$MatchModelFromJson(json);
}
