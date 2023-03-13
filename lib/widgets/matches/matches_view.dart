import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/matches_cubit.dart';
import '../../states/matches_state.dart';
import '../common/items_list.dart';

class MatchesView extends StatelessWidget {
  const MatchesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<MatchesCubit, MatchesState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (error) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
            },
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            error: (error) => Center(child: Text(error)),
            success: (matches, hasReachedMax) => ItemsList(items: matches, hasReachedMax: hasReachedMax),
          );
        },
      ),
    );
  }
}
