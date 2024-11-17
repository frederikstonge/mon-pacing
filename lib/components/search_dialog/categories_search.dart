import 'dart:async';

import 'package:flutter/material.dart';

import 'search_dialog.dart';

class CategoriesSearch extends StatelessWidget {
  final FutureOr<List<String>> Function({String query}) search;

  const CategoriesSearch({
    super.key,
    required this.search,
  });

  static Future<String?> showDialog(
    BuildContext context,
    FutureOr<List<String>> Function({String query}) search,
  ) async {
    return await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (context) => CategoriesSearch(
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
