import 'package:flutter/material.dart';

class TagsDisplay extends StatefulWidget {
  final List<String> tags;

  const TagsDisplay({
    super.key,
    required this.tags,
  });

  @override
  State<TagsDisplay> createState() => _TagsDisplayState();
}

class _TagsDisplayState extends State<TagsDisplay> {
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
    if (widget.tags.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 36,
      width: double.infinity,
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.tags.length,
          itemBuilder: (context, index) {
            final tag = widget.tags.elementAt(index);
            return Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Chip(
                labelPadding: EdgeInsets.zero,
                visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                label: Text(tag),
              ),
            );
          },
        ),
      ),
    );
  }
}
