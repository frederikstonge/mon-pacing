import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/pacings_cubit.dart';
import '../models/pacing_model.dart';
import '../states/pacings_state.dart';
import '../widgets/list_item.dart';

class PacingsView extends StatelessWidget {
  final List<PacingModel> _pacings = [];
  final ScrollController _scrollController = ScrollController();

  PacingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<PacingsCubit, PacingsState?>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          if (state is PacingsInitialState) {
            _pacings.clear();
          } else if (state is PacingsErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
          }

          return;
        },
        builder: (context, state) {
          if (state == null) {
            context.read<PacingsCubit>().refresh();
          } else if (state is PacingsLoadingState && _pacings.isEmpty) {
            return const CircularProgressIndicator();
          } else if (state is PacingsSuccessState) {
            _pacings.addAll(state.pacings);
          } else if (state is PacingsErrorState && _pacings.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<PacingsCubit>().fetch();
                  },
                  icon: const Icon(Icons.refresh),
                ),
                const SizedBox(height: 15),
                Text(state.error, textAlign: TextAlign.center),
              ],
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              context.read<PacingsCubit>().refresh();
            },
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _scrollController
                ..addListener(() {
                  if (_scrollController.offset == _scrollController.position.maxScrollExtent && !context.read<PacingsCubit>().isFetching) {
                    context.read<PacingsCubit>().fetch();
                  }
                }),
              itemBuilder: (context, index) => ListItem(entity: _pacings[index]),
              itemCount: _pacings.length,
            ),
          );
        },
      ),
    );
  }
}
