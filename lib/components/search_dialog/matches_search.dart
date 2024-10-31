import 'dart:async';

import 'package:flutter/material.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../models/match_model.dart';
import 'search_dialog.dart';

class MatchesSearch extends StatelessWidget {
  final FutureOr<List<MatchModel>> Function(String query, List<String> selectedTags) fetch;
  final Future<List<String>> Function() fetchTags;

  const MatchesSearch({
    super.key,
    required this.fetch,
    required this.fetchTags,
  });

  static Future<MatchModel?> showDialog(
    BuildContext context,
    FutureOr<List<MatchModel>> Function(String query, List<String> selectedTags) fetch,
    Future<List<String>> Function() fetchTags,
  ) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MatchesSearch(
          fetch: fetch,
          fetchTags: fetchTags,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchTags(),
        builder: (context, snapshot) {
          return SearchDialog(
            onChanged: (query, selectedTags) => fetch(query, selectedTags),
            tags: snapshot.data,
            itemBuilder: (context, item) => InkWell(
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
        });
  }
}
