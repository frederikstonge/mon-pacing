import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/pacing_bloc.dart';
import '../events/pacing_event.dart';
import '../models/pacing_model.dart';
import '../states/pacing_state.dart';
import '../widgets/list_item.dart';

class PacingsView extends StatelessWidget {
  final List<PacingModel> _pacings = [];
  final ScrollController _scrollController = ScrollController();

  PacingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<PacingBloc, PacingState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          if (state is PacingLoadingState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is PacingSuccessState && state.pacings.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('No more pacing')));
          } else if (state is PacingErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
            context.read<PacingBloc>().isFetching = false;
          }
          return;
        },
        builder: (context, state) {
          if (state is PacingInitialState ||
              state is PacingLoadingState && _pacings.isEmpty) {
            return const CircularProgressIndicator();
          } else if (state is PacingSuccessState) {
            _pacings.addAll(state.pacings);
            context.read<PacingBloc>().isFetching = false;
          } else if (state is PacingErrorState && _pacings.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<PacingBloc>()
                      ..isFetching = true
                      ..add(const PacingFetchEvent());
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
              _pacings.clear();
              context.read<PacingBloc>()
                ..isFetching = true
                ..add(const PacingRefreshEvent());
            },
            child: ListView.separated(
              controller: _scrollController
                ..addListener(() {
                  if (_scrollController.offset ==
                          _scrollController.position.maxScrollExtent &&
                      !context.read<PacingBloc>().isFetching) {
                    context.read<PacingBloc>()
                      ..isFetching = true
                      ..add(const PacingFetchEvent());
                  }
                }),
              itemBuilder: (context, index) =>
                  ListItem(entity: _pacings[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: _pacings.length,
            ),
          );
        },
      ),
    );
  }
}
