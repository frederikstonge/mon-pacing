import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../components/search/search_dialog.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../models/match_model.dart';
import '../../repositories/matches_repository.dart';
import '../../router/routes.dart';

class MatchesSearchPageView extends StatelessWidget {
  const MatchesSearchPageView({super.key});

  static Future<MatchModel?> showDialog(BuildContext context) async {
    return await GoRouter.of(context).pushNamed<MatchModel>(Routes.matchesSearch);
  }

  @override
  Widget build(BuildContext context) {
    return SearchDialog(
      onChanged: (query, selectedTags) async {
        final matches = await context.read<MatchesRepository>().search(query, selectedTags);
        return matches.map((e) => MatchModel.fromEntity(entity: e)).toList();
      },
      hintText: S.of(context).search(category: S.of(context).matches),
      itemBuilder:
          (context, item) => InkWell(
            onTap: () {
              Navigator.of(context).pop(item);
            },
            child: ListTile(
              leading: const SizedBox(height: double.infinity, child: Icon(Icons.search)),
              isThreeLine: true,
              title: Text(
                item.name,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.teams.map((e) => e.name).join(' ${S.of(context).versus} '),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    S.of(context).modifiedDate(date: item.modifiedDate!),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
