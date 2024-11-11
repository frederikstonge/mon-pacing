import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import 'performer_model.dart';

part 'match_team_model.freezed.dart';
part 'match_team_model.g.dart';

@freezed
@Embedded(ignore: {'copyWith'})
class MatchTeamModel with _$MatchTeamModel {
  const factory MatchTeamModel({
    required int id,
    required String name,
    required int color,
    @Default([]) List<PerformerModel> performers,
    String? integrationEntityId,
  }) = _MatchTeamModel;

  factory MatchTeamModel.fromJson(Map<String, dynamic> json) => _$MatchTeamModelFromJson(json);
}
