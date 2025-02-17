import 'package:dart_mappable/dart_mappable.dart';

import '../../../models/penalty_model.dart';
import '../../../models/team_model.dart';

part 'match_penalty_state.mapper.dart';

@MappableClass()
class MatchPenaltyState with MatchPenaltyStateMappable {
  final bool editMode;
  final List<TeamModel> teams;
  final PenaltyModel penalty;
  final List<String>? integrationPenaltyTypes;

  const MatchPenaltyState({
    required this.editMode,
    required this.teams,
    required this.penalty,
    required this.integrationPenaltyTypes,
  });
}
