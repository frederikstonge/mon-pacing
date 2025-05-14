import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../components/search/search_dialog.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../repositories/tags_repository.dart';
import '../../router/routes.dart';

class TagsSearchPageView extends StatelessWidget {
  const TagsSearchPageView({super.key});

  static Future<String?> showDialog(BuildContext context) async {
    return await GoRouter.of(context).pushNamed<String>(Routes.tagsSearch);
  }

  @override
  Widget build(BuildContext context) {
    return SearchDialog(
      onChanged: (query, _) => context.read<TagsRepository>().getAllTags(search: query),
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
