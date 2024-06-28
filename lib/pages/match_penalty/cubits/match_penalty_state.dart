import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/match_team_model.dart';
import '../../../models/penalty_model.dart';

part 'match_penalty_state.freezed.dart';
part 'match_penalty_state.g.dart';

@freezed
class MatchPenaltyState with _$MatchPenaltyState {
  const factory MatchPenaltyState({
    required bool editMode,
    required List<MatchTeamModel> teams,
    required PenaltyModel penalty,
  }) = _MatchPenaltyState;

  factory MatchPenaltyState.fromJson(Map<String, dynamic> json) => _$MatchPenaltyStateFromJson(json);
}
