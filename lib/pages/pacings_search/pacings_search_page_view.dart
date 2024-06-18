import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../components/tag_filters/tag_filters.dart';
import '../../l10n/app_localizations.dart';
import '../../router/routes.dart';
import 'cubits/pacings_search_cubit.dart';
import 'cubits/pacings_search_state.dart';

class PacingsSearchPageView extends StatefulWidget {
  const PacingsSearchPageView({super.key});

  @override
  State<PacingsSearchPageView> createState() => _PacingsSearchPageViewState();
}

class _PacingsSearchPageViewState extends State<PacingsSearchPageView> {
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
    return BlocBuilder<PacingsSearchCubit, PacingsSearchState>(
      builder: (context, state) {
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
              onChanged: (value) => _onChanged(value, state.selectedTags),
              onFieldSubmitted: (value) => _onChanged(value, state.selectedTags),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TagFilters(
                    allTags: state.tags,
                    selectedTags: state.selectedTags,
                    onTagSelected: (tag, selected) async {
                      final tags = List<String>.from(state.selectedTags);
                      if (selected) {
                        tags.add(tag);
                      } else {
                        tags.remove(tag);
                      }

                      await context.read<PacingsSearchCubit>().fetch(state.searchQuery, tags);
                    },
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    itemCount: state.hasMore ? state.pacings.length + 1 : state.pacings.length,
                    itemBuilder: (context, index) {
                      if (state.hasMore && index != 0 && index == state.pacings.length) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final pacing = state.pacings.elementAtOrNull(index);
                      if (pacing == null) {
                        return const SizedBox.shrink();
                      }

                      return InkWell(
                        onTap: () => GoRouter.of(context).goNamed(Routes.pacing, pathParameters: {'id': '${pacing.id}'}),
                        child: ListTile(
                          leading: const SizedBox(height: double.infinity, child: Icon(Icons.search)),
                          isThreeLine: true,
                          title: Text(
                            pacing.name,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.of(context).improvisationCount(count: pacing.improvisations.length),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                S.of(context).modifiedDate(date: pacing.modifiedDate!),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onChanged(String value, List<String> selectedTags) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 250), () {
      context.read<PacingsSearchCubit>().fetch(value, selectedTags);
    });
  }

  Future<void> _onScroll() async {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      final pacingsSearchCubit = context.read<PacingsSearchCubit>();
      final query = pacingsSearchCubit.state.searchQuery;
      final selectedTags = pacingsSearchCubit.state.selectedTags;
      await pacingsSearchCubit.fetch(query, selectedTags);
    }
  }
}
