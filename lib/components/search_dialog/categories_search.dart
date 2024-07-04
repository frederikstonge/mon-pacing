import 'dart:async';

import 'package:flutter/material.dart';

import 'search_dialog.dart';

class CategoriesSearch extends StatelessWidget {
  final void Function(String category) onCategorySubmitted;
  final FutureOr<List<String>> Function({String query}) getAllCategories;

  const CategoriesSearch({
    super.key,
    required this.getAllCategories,
    required this.onCategorySubmitted,
  });

  static void showDialog(
    BuildContext context,
    void Function(String tag) onCategorySubmitted,
    FutureOr<List<String>> Function({String query}) getAllCategories,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CategoriesSearch(
          onCategorySubmitted: onCategorySubmitted,
          getAllCategories: getAllCategories,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SearchDialog(
      onChanged: (query, _) => getAllCategories(query: query),
      itemBuilder: (context, item) => InkWell(
        onTap: () {
          Navigator.of(context).pop();
          onCategorySubmitted(item);
        },
        child: ListTile(
          leading: const Icon(Icons.search),
          title: Text(item, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}
