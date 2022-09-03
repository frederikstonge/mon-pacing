import 'package:freezed_annotation/freezed_annotation.dart';

import 'penalty_model.dart';
import 'base_model.dart';
import 'match_improvisation_model.dart';
import 'team_model.dart';

part 'match_model.freezed.dart';
part 'match_model.g.dart';

@freezed
class MatchModel with _$MatchModel implements BaseModel {
  @Implements<BaseModel>()
  const factory MatchModel({
    required int? id,
    required String? name,
    required DateTime? createdDate,
    required DateTime? modifiedDate,
    required List<TeamModel> teams,
    required List<MatchImprovisationModel> improvisations,
    required List<PenaltyModel> penalties,
  }) = _MatchModel;

  factory MatchModel.fromJson(Map<String, Object?> json) => _$MatchModelFromJson(json);
}
