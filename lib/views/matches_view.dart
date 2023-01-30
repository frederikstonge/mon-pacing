import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/matches_cubit.dart';
import '../models/match_model.dart';
import '../states/matches_state.dart';
import '../widgets/items_list.dart';

class MatchesView extends StatelessWidget {
  const MatchesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<MatchesCubit, MatchesState>(
        listener: (context, state) {
          if (state is MatchesErrorState) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            error: (error) => Center(
              child: Text(error),
            ),
            success: (matches, hasReachedMax) => ItemsList<MatchModel>(
              items: matches,
              hasReachedMax: hasReachedMax,
            ),
          );
        },
      ),
    );
  }
}
