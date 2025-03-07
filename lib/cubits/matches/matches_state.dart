import 'package:dart_mappable/dart_mappable.dart';

import '../../models/match_model.dart';
import 'matches_status.dart';

part 'matches_state.mapper.dart';

@MappableClass()
class MatchesState with MatchesStateMappable {
  final MatchesStatus status;
  final String? error;
  final List<MatchModel> matches;
  final bool hasMore;

  const MatchesState({required this.status, this.error, this.matches = const [], this.hasMore = true});
}
