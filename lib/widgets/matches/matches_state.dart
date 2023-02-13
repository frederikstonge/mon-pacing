import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/match_model.dart';

part 'matches_state.freezed.dart';

@freezed
class MatchesState with _$MatchesState {
  const factory MatchesState.initial() = MatchesInitialState;
  const factory MatchesState.error(String error) = MatchesErrorState;
  const factory MatchesState.success(List<MatchModel> matches, bool hasReachedMax) = MatchesSuccessState;
}
