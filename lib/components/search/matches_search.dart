import 'dart:async';

import 'package:flutter/material.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../models/match_model.dart';
import 'search_dialog.dart';

class MatchesSearch extends StatelessWidget {
  final FutureOr<List<MatchModel>> Function(String query, List<String> selectedTags) search;
  final Future<List<String>> Function() getAllTags;

  const MatchesSearch({super.key, required this.search, required this.getAllTags});

  static Future<MatchModel?> showDialog(
    BuildContext context,
    FutureOr<List<MatchModel>> Function(String query, List<String> selectedTags) search,
    Future<List<String>> Function() getAllTags,
  ) async {
    return await Navigator.of(
      context,
    ).push<MatchModel>(MaterialPageRoute(builder: (context) => MatchesSearch(search: search, getAllTags: getAllTags)));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllTags(),
      builder: (context, snapshot) {
        return SearchDialog(
          onChanged: (query, selectedTags) => search(query, selectedTags),
          hintText: S.of(context).search(category: S.of(context).matches),
          tags: snapshot.data,
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
      },
    );
  }
}
