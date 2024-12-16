import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/match_model.dart';

part 'match_detail_state.freezed.dart';

@freezed
class MatchDetailState with _$MatchDetailState {
  const factory MatchDetailState({
    required bool editMode,
    required MatchModel match,
  }) = _MatchDetailState;
}
