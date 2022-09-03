import 'package:freezed_annotation/freezed_annotation.dart';

import 'improvisation_type.dart';

part 'match_improvisation_model.freezed.dart';
part 'match_improvisation_model.g.dart';

@freezed
class MatchImprovisationModel with _$MatchImprovisationModel {
  const factory MatchImprovisationModel({
    required int order,
    required ImprovisationType type,
    required String? category,
    required String? theme,
    required Duration duration,
    required int? performers,
    required int? wonByTeam,
  }) = _MatchImprovisationModel;

  factory MatchImprovisationModel.fromJson(Map<String, dynamic> json) => _$MatchImprovisationModelFromJson(json);
}
