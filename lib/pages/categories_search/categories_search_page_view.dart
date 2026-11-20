import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaisel/kaisel.dart';
import 'package:material_ui/material_ui.dart';

import '../../components/search/search_dialog.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../repositories/pacings_repository.dart';
import '../../router/routes.dart';

class CategoriesSearchPageView extends StatelessWidget {
  const CategoriesSearchPageView({super.key});

  static Future<String?> showDialog(BuildContext context) async {
    return await context.router<AppRoute>().pushForResult<String>(const CategoriesSearchRoute());
  }

  @override
  Widget build(BuildContext context) {
    return SearchDialog(
      onChanged: (query, _) => context.read<PacingsRepository>().getAllCategories(search: query),
      hintText: S.of(context).search(category: S.of(context).categories),
      itemBuilder: (context, item) => InkWell(
        onTap: () {
          context.router<AppRoute>().pop(item);
        },
        child: ListTile(
          leading: const Icon(Icons.search),
          title: Text(item, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}
