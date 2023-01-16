import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/matches_cubit.dart';
import '../cubits/pacings_cubit.dart';
import '../models/base_model.dart';
import '../models/match_model.dart';
import '../models/pacing_model.dart';
import 'item.dart';

class ItemsList<T extends BaseModel> extends StatefulWidget {
  final List<T> items;
  final bool hasReachedMax;
  const ItemsList({
    super.key,
    required this.items,
    required this.hasReachedMax,
  });

  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return index >= widget.items.length
            ? Container(
                alignment: Alignment.center,
                child: const Center(
                  child: SizedBox(
                    width: 33,
                    height: 33,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                    ),
                  ),
                ),
              )
            : Item(entity: widget.items[index]);
      },
      itemCount: widget.hasReachedMax ? widget.items.length : widget.items.length + 1,
      controller: _scrollController,
    );
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      if (widget.items is List<PacingModel>) {
        context.read<PacingsCubit>().fetch();
      } else if (widget.items is List<MatchModel>) {
        context.read<MatchesCubit>().fetch();
      }
    }
  }
}
