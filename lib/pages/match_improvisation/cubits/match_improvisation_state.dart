import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/improvisation_model.dart';

part 'match_improvisation_state.freezed.dart';

@freezed
class MatchImprovisationState with _$MatchImprovisationState {
  const factory MatchImprovisationState({
    required ImprovisationModel improvisation,
    required bool editMode,
    required int index,
  }) = _MatchImprovisationState;
}
