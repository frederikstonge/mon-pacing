import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pacings_cubit.dart';
import '../../models/pacing_model.dart';
import 'pacings_state.dart';
import '../common/items_list.dart';

class PacingsView extends StatelessWidget {
  const PacingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<PacingsCubit, PacingsState>(
        listener: (context, state) {
          if (state is PacingsErrorState) {
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
            success: (pacings, hasReachedMax) => ItemsList<PacingModel>(
              items: pacings,
              hasReachedMax: hasReachedMax,
            ),
          );
        },
      ),
    );
  }
}
