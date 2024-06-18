import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/app_localizations.dart';
import '../../router/routes.dart';
import 'cubits/matches_search_cubit.dart';
import 'cubits/matches_search_state.dart';

class MatchesSearchPageView extends StatefulWidget {
  const MatchesSearchPageView({super.key});

  @override
  State<MatchesSearchPageView> createState() => _MatchesSearchPageViewState();
}

class _MatchesSearchPageViewState extends State<MatchesSearchPageView> {
  late final ScrollController _scrollController;
  Timer? _debounce;
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          textCapitalization: TextCapitalization.sentences,
          textInputAction: TextInputAction.search,
          autofocus: true,
          decoration: InputDecoration(
            hintText: S.of(context).search,
            hintStyle: const TextStyle(
              fontSize: 18,
            ),
            border: InputBorder.none,
          ),
          onChanged: _onChanged,
          onFieldSubmitted: _onChanged,
        ),
      ),
      body: BlocBuilder<MatchesSearchCubit, MatchesSearchState>(
        builder: (context, state) {
          return ListView.builder(
            controller: _scrollController,
            itemCount: state.hasMore ? state.matches.length + 1 : state.matches.length,
            itemBuilder: (context, index) {
              if (state.hasMore && index != 0 && index == state.matches.length) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final match = state.matches.elementAtOrNull(index);
              if (match == null) {
                return const SizedBox.shrink();
              }

              return InkWell(
                onTap: () => GoRouter.of(context).goNamed(Routes.match, pathParameters: {'id': '${match.id}'}),
                child: ListTile(
                  leading: const SizedBox(height: double.infinity, child: Icon(Icons.search)),
                  isThreeLine: true,
                  title: Text(
                    match.name,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        match.teams.map((e) => e.name).join(' ${S.of(context).versus} '),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        S.of(context).modifiedDate(date: match.modifiedDate!),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _onChanged(String value) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 250), () {
      context.read<MatchesSearchCubit>().fetch(value);
    });
  }

  Future<void> _onScroll() async {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      final pacingsSearchCubit = context.read<MatchesSearchCubit>();
      final query = pacingsSearchCubit.state.searchQuery;
      await pacingsSearchCubit.fetch(query);
    }
  }
}
