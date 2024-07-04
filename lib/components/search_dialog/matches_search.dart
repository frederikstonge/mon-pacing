import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/app_localizations.dart';
import '../../repositories/matches_repository.dart';
import '../../router/routes.dart';
import 'search_dialog.dart';

class MatchesSearch extends StatelessWidget {
  const MatchesSearch({super.key});

  static void showDialog(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MatchesSearch()));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<MatchesRepository>().getAllTags(),
        builder: (context, snapshot) {
          return SearchDialog(
            onChanged: (query, selectedTags) => context.read<MatchesRepository>().search(query, selectedTags),
            tags: snapshot.data,
            itemBuilder: (context, item) => InkWell(
              onTap: () {
                Navigator.of(context).pop();
                GoRouter.of(context).goNamed(Routes.match, pathParameters: {'id': '${item.id}'});
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
        });
  }
}
