import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../components/search/search_dialog.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../repositories/pacings_repository.dart';
import '../../router/routes.dart';

class CategoriesSearchPageView extends StatelessWidget {
  const CategoriesSearchPageView({super.key});

  static Future<String?> showDialog(BuildContext context) async {
    return await GoRouter.of(context).pushNamed<String>(Routes.categoriesSearch);
  }

  @override
  Widget build(BuildContext context) {
    return SearchDialog(
      onChanged: (query, _) => context.read<PacingsRepository>().getAllCategories(search: query),
      hintText: S.of(context).search(category: S.of(context).categories),
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
