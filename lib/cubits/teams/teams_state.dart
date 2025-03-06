import 'package:dart_mappable/dart_mappable.dart';

import '../../models/team_model.dart';
import 'teams_status.dart';

part 'teams_state.mapper.dart';

@MappableClass()
class TeamsState with TeamsStateMappable {
  final TeamsStatus status;
  final String? error;
  final List<TeamModel> teams;
  final bool hasMore;

  const TeamsState({required this.status, this.error, this.teams = const [], this.hasMore = true});
}
