import 'package:flutter/material.dart';

import 'tag_filters.dart';

class PinnedTagFilters extends SliverPersistentHeaderDelegate {
  final List<String> allTags;
  final List<String> selectedTags;
  final Future<void> Function(String tag) onTagSelected;
  final Future<void> Function(String tag) onTagDeselected;

  PinnedTagFilters({
    required this.allTags,
    required this.selectedTags,
    required this.onTagSelected,
    required this.onTagDeselected,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: TagFilters(
          allTags: allTags,
          selectedTags: selectedTags,
          onTagSelected: (tag, selected) async {
            if (selected) {
              await onTagSelected(tag);
            } else {
              await onTagDeselected(tag);
            }
          },
        ),
      ),
    );
  }

  @override
  double get maxExtent => 36.0;

  @override
  double get minExtent => 36.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
