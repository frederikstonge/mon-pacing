import 'dart:async';

import 'package:flutter/material.dart';

import 'search_dialog.dart';

class CategoriesSearch extends StatelessWidget {
  final FutureOr<List<String>> Function({String query}) fetch;

  const CategoriesSearch({
    super.key,
    required this.fetch,
  });

  static Future<String?> showDialog(
    BuildContext context,
    FutureOr<List<String>> Function({String query}) fetch,
  ) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CategoriesSearch(
          fetch: fetch,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SearchDialog(
      onChanged: (query, _) => fetch(query: query),
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
