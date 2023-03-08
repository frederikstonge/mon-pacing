import 'package:freezed_annotation/freezed_annotation.dart';

import 'base_model.dart';
import 'improvisation_model.dart';
import 'penalty_model.dart';
import 'point_model.dart';
import 'team_model.dart';

part 'match_model.freezed.dart';
part 'match_model.g.dart';

@freezed
class MatchModel with _$MatchModel implements BaseModel {
  @Implements<BaseModel>()
  const factory MatchModel({
    required int? id,
    required String name,
    required DateTime? createdDate,
    required DateTime? modifiedDate,
    required List<TeamModel> teams,
    required List<ImprovisationModel> improvisations,
    required List<PenaltyModel> penalties,
    required List<PointModel> points,
  }) = _MatchModel;

  factory MatchModel.fromJson(Map<String, Object?> json) => _$MatchModelFromJson(json);
}
