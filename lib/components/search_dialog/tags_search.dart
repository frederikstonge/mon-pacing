import 'dart:async';

import 'package:flutter/material.dart';

import 'search_dialog.dart';

class TagsSearch extends StatelessWidget {
  final FutureOr<List<String>> Function({String query}) search;

  const TagsSearch({
    super.key,
    required this.search,
  });

  static Future<String?> showDialog(
    BuildContext context,
    void Function(String tag) onTap,
    FutureOr<List<String>> Function({String query}) search,
  ) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TagsSearch(
          search: search,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SearchDialog(
      onChanged: (query, _) => search(query: query),
      itemBuilder: (context, item) => InkWell(
        onTap: () {
          Navigator.of(context).pop(item);
        },
        child: ListTile(
          leading: const Icon(Icons.search),
          title: Text(item, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}
