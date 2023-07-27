import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/match_model.dart';

part 'match_state.freezed.dart';

@freezed
class MatchState with _$MatchState {
  const factory MatchState.initial() = MatchInitialState;
  const factory MatchState.error(String error) = MatchErrorState;
  const factory MatchState.success(MatchModel match) = MatchSuccessState;
}
