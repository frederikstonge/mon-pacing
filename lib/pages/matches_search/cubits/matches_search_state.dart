import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/match_model.dart';

part 'matches_search_state.freezed.dart';
part 'matches_search_state.g.dart';

@freezed
class MatchesSearchState with _$MatchesSearchState {
  const factory MatchesSearchState({
    required String searchQuery,
    required List<MatchModel> matches,
    required bool hasMore,
    required List<String> tags,
    @Default([]) List<String> selectedTags,
  }) = _MatchesSearchState;

  factory MatchesSearchState.fromJson(Map<String, dynamic> json) => _$MatchesSearchStateFromJson(json);
}
