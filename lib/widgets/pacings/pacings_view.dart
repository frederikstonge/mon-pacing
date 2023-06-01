import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/pacings/pacings_cubit.dart';
import '../../cubits/pacings/pacings_state.dart';
import '../common/items_list.dart';

class PacingsView extends StatelessWidget {
  const PacingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<PacingsCubit, PacingsState>(
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
            success: (pacings, hasReachedMax) => ItemsList(items: pacings, hasReachedMax: hasReachedMax),
          );
        },
      ),
    );
  }
}
