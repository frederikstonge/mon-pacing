import 'dart:async';

import 'package:flutter/material.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../models/tag_model.dart';
import 'search_dialog.dart';

class TagsSearch extends StatelessWidget {
  final FutureOr<List<TagModel>> Function({String search}) search;

  const TagsSearch({super.key, required this.search});

  static Future<String?> showDialog(
    BuildContext context,
    void Function(String tag) onTap,
    FutureOr<List<TagModel>> Function({String search}) search,
  ) async {
    return await Navigator.of(
      context,
    ).push<String>(MaterialPageRoute(builder: (context) => TagsSearch(search: search)));
  }

  @override
  Widget build(BuildContext context) {
    return SearchDialog(
      onChanged: (query, _) => search(search: query),
      hintText: S.of(context).search(category: S.of(context).tags),
      itemBuilder:
          (context, item) => InkWell(
            onTap: () {
              Navigator.of(context).pop(item);
            },
            child: ListTile(
              leading: const Icon(Icons.search),
              title: Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
    );
  }
}
