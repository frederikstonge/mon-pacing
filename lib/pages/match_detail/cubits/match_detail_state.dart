import 'package:dart_mappable/dart_mappable.dart';

import '../../../models/match_model.dart';

part 'match_detail_state.mapper.dart';

@MappableClass()
class MatchDetailState with MatchDetailStateMappable {
  final bool editMode;
  final MatchModel match;

  const MatchDetailState({
    required this.editMode,
    required this.match,
  });
}
