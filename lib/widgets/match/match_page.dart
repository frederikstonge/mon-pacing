import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/match/match_cubit.dart';
import '../../cubits/matches/matches_cubit.dart';
import '../../repositories/matches_repository.dart';
import 'match_view.dart';

class MatchPage extends StatelessWidget {
  final int id;

  const MatchPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MatchCubit(
            id: id,
            matchesRepository: context.read<MatchesRepository>(),
            matchesCubit: context.read<MatchesCubit>(),
          )..initialize(),
        ),
      ],
      child: const MatchView(),
    );
  }
}
