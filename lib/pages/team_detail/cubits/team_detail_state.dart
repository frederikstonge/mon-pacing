import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/team_model.dart';

part 'team_detail_state.freezed.dart';
part 'team_detail_state.g.dart';

@freezed
class TeamDetailState with _$TeamDetailState {
  const factory TeamDetailState({
    required bool editMode,
    required TeamModel team,
    @Default(0) int selectedTeamIndex,
  }) = _TeamDetailState;

  factory TeamDetailState.fromJson(Map<String, dynamic> json) => _$TeamDetailStateFromJson(json);
}
