import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/penalty_model.dart';
import '../../models/team_model.dart';
import 'cubits/match_penalty_cubit.dart';
import 'match_penalty_view.dart';

class MatchPenaltyShell extends StatelessWidget {
  final int improvisationId;
  final List<TeamModel> teams;
  final FutureOr<void> Function(PenaltyModel penalty) onSave;
  final PenaltyModel? penalty;

  const MatchPenaltyShell({
    super.key,
    required this.improvisationId,
    required this.teams,
    required this.onSave,
    this.penalty,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MatchPenaltyCubit(
        improvisationId: improvisationId,
        teams: teams,
        onSave: onSave,
        penalty: penalty,
      ),
      child: const MatchPenaltyView(),
    );
  }
}
