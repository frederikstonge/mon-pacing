import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/penalty_model.dart';
import '../../../models/team_model.dart';

part 'match_penalty_state.freezed.dart';
part 'match_penalty_state.g.dart';

@freezed
class MatchPenaltyState with _$MatchPenaltyState {
  const factory MatchPenaltyState({
    required bool editMode,
    required List<TeamModel> teams,
    required PenaltyModel penalty,
  }) = _MatchPenaltyState;

  factory MatchPenaltyState.fromJson(Map<String, dynamic> json) => _$MatchPenaltyStateFromJson(json);
}
