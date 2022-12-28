import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/match_cubit.dart';
import '../cubits/matches_cubit.dart';
import '../models/match_model.dart';
import '../views/match_view.dart';

class MatchPage extends StatelessWidget {
  final MatchModel model;

  const MatchPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MatchCubit(model: model, matchesCubit: context.read<MatchesCubit>()),
        ),
      ],
      child: const MatchView(),
    );
  }
}
