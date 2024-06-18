import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class TagFilters extends StatefulWidget {
  final List<String> allTags;
  final List<String> selectedTags;
  final Future<void> Function(String tag, bool selected) onTagSelected;

  const TagFilters({
    super.key,
    required this.allTags,
    required this.selectedTags,
    required this.onTagSelected,
  });

  @override
  State<TagFilters> createState() => _TagFiltersState();
}

class _TagFiltersState extends State<TagFilters> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.allTags.isEmpty) {
      return const SizedBox.shrink();
    }

    final allTags = widget.allTags.sorted((a, b) {
      final aIsSelected = widget.selectedTags.contains(a);
      final bIsSelected = widget.selectedTags.contains(b);
      final compare = aIsSelected == bIsSelected ? 0 : (aIsSelected ? -1 : 1);
      return compare;
    });

    return SizedBox(
      height: 50,
      width: double.infinity,
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: allTags.length,
          itemBuilder: (context, index) {
            final tag = allTags.elementAt(index);
            final isSelected = widget.selectedTags.contains(tag);
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: FilterChip(
                label: Text(tag),
                selected: isSelected,
                onSelected: (value) async {
                  await widget.onTagSelected(tag, value);
                  _scrollController.jumpTo(0);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
