import 'dart:async';

import 'package:flutter/material.dart';

import 'search_dialog.dart';

class TagsSearch extends StatelessWidget {
  final void Function(String tag) onTagSubmitted;
  final FutureOr<List<String>> Function({String query}) getAllTags;

  const TagsSearch({
    super.key,
    required this.getAllTags,
    required this.onTagSubmitted,
  });

  static void showDialog(
    BuildContext context,
    void Function(String tag) onTagSubmitted,
    FutureOr<List<String>> Function({String query}) getAllTags,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TagsSearch(
          onTagSubmitted: onTagSubmitted,
          getAllTags: getAllTags,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SearchDialog(
      onChanged: (query, _) => getAllTags(query: query),
      itemBuilder: (context, item) => InkWell(
        onTap: () {
          Navigator.of(context).pop();
          onTagSubmitted(item);
        },
        child: ListTile(
          leading: const Icon(Icons.search),
          title: Text(item, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}
