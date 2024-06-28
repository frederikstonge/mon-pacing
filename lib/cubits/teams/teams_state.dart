import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/team_model.dart';

part 'teams_state.freezed.dart';

@freezed
class TeamsState with _$TeamsState {
  const factory TeamsState.initial() = TeamsInitialState;
  const factory TeamsState.error(String error) = TeamsErrorState;
  const factory TeamsState.success(List<TeamModel> teams, bool hasMore) = TeamsSuccessState;
}
