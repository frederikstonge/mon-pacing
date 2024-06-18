import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/pacing_model.dart';

part 'pacings_search_state.freezed.dart';
part 'pacings_search_state.g.dart';

@freezed
class PacingsSearchState with _$PacingsSearchState {
  const factory PacingsSearchState({
    required String searchQuery,
    required List<PacingModel> pacings,
    required bool hasMore,
    required List<String> tags,
    @Default([]) List<String> selectedTags,
  }) = _PacingsSearchState;

  factory PacingsSearchState.fromJson(Map<String, dynamic> json) => _$PacingsSearchStateFromJson(json);
}
