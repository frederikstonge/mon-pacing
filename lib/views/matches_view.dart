import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/matches_cubit.dart';
import '../helpers/listview_helper.dart';
import '../models/match_model.dart';
import '../states/matches_state.dart';
import '../widgets/list_item.dart';

class MatchesView extends StatelessWidget {
  final List<MatchModel> _matches = [];
  final ScrollController _scrollController = ScrollController();

  MatchesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<MatchesCubit, MatchesState?>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          if (state is MatchesInitialState) {
            _matches.clear();
          } else if (state is MatchesErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state == null) {
            context.read<MatchesCubit>().refresh();
          } else if (state is MatchesLoadingState && _matches.isEmpty) {
            return const CircularProgressIndicator();
          } else if (state is MatchesSuccessState) {
            _matches.addAll(state.matches);
          } else if (state is MatchesErrorState && _matches.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<MatchesCubit>().fetch();
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
              context.read<MatchesCubit>().refresh();
            },
            child: ListView.builder(
              padding: ListViewHelper.getFloatingActionButtonPadding(context),
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _scrollController
                ..addListener(() {
                  if (_scrollController.offset == _scrollController.position.maxScrollExtent && !context.read<MatchesCubit>().isFetching) {
                    context.read<MatchesCubit>().fetch();
                  }
                }),
              itemBuilder: (context, index) => ListItem(entity: _matches[index]),
              itemCount: _matches.length,
            ),
          );
        },
      ),
    );
  }
}
