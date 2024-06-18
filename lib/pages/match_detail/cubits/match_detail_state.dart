import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/match_model.dart';

part 'match_detail_state.freezed.dart';
part 'match_detail_state.g.dart';

@freezed
class MatchDetailState with _$MatchDetailState {
  const factory MatchDetailState({
    required bool initialized,
    required bool editMode,
    required MatchModel match,
    required List<String> allTags,
    @Default(0) int selectedTeamIndex,
  }) = _MatchDetailState;

  factory MatchDetailState.fromJson(Map<String, dynamic> json) => _$MatchDetailStateFromJson(json);
}
