import 'package:dart_mappable/dart_mappable.dart';

import '../../../../models/match_model.dart';

part 'match_state.mapper.dart';

@MappableClass()
class MatchState with MatchStateMappable {
  final MatchStatus status;
  final String? error;
  final MatchModel? match;
  final int selectedImprovisationIndex;
  final int selectedDurationIndex;

  const MatchState({
    required this.status,
    this.error,
    this.match,
    this.selectedImprovisationIndex = 0,
    this.selectedDurationIndex = 0,
  });
}

enum MatchStatus {
  initial,
  loading,
  error,
  success,
}
