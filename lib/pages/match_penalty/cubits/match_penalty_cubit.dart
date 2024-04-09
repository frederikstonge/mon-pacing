import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/penalty_model.dart';
import '../../../models/team_model.dart';
import 'match_penalty_state.dart';

class MatchPenaltyCubit extends Cubit<MatchPenaltyState> {
  final int improvisationId;
  final List<TeamModel> teams;
  final FutureOr<void> Function(PenaltyModel penalty) onSave;
  final PenaltyModel? penalty;

  MatchPenaltyCubit({
    required this.improvisationId,
    required this.teams,
    required this.onSave,
    this.penalty,
  }) : super(
          MatchPenaltyState(
            editMode: penalty != null,
            teams: teams,
            penalty: penalty != null
                ? penalty.copyWith()
                : PenaltyModel(
                    id: 0,
                    major: false,
                    type: '',
                    performer: '',
                    teamId: teams.first.id,
                    improvisationId: improvisationId,
                  ),
          ),
        );

  void edit(PenaltyModel penalty) {
    emit(state.copyWith(penalty: penalty));
  }
}
