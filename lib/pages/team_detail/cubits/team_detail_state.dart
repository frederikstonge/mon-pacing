import 'package:dart_mappable/dart_mappable.dart';

import '../../../models/team_model.dart';

part 'team_detail_state.mapper.dart';

@MappableClass()
class TeamDetailState with TeamDetailStateMappable {
  final bool editMode;
  final TeamModel team;
  final int selectedTeamIndex;

  const TeamDetailState({required this.editMode, required this.team, this.selectedTeamIndex = 0});
}
