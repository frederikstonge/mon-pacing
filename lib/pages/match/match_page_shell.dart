import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/matches/matches_cubit.dart';
import '../../repositories/matches_repository.dart';
import 'cubits/match_cubit.dart';
import 'match_page_view.dart';

class MatchPageShell extends StatelessWidget {
  final int id;

  const MatchPageShell({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MatchCubit(
        matchesRepository: context.read<MatchesRepository>(),
        matchesCubit: context.read<MatchesCubit>(),
      )..initialize(id),
      child: const MatchPageView(),
    );
  }
}
