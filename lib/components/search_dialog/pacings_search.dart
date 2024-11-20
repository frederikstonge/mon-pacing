import 'dart:async';

import 'package:flutter/material.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../models/pacing_model.dart';
import 'search_dialog.dart';

class PacingsSearch extends StatelessWidget {
  final FutureOr<List<PacingModel>> Function(String query, List<String> selectedTags) search;
  final Future<List<String>> Function() getAllTags;

  const PacingsSearch({
    super.key,
    required this.getAllTags,
    required this.search,
  });

  static Future<PacingModel?> showDialog(
    BuildContext context,
    FutureOr<List<PacingModel>> Function(String query, List<String> selectedTags) search,
    Future<List<String>> Function() getAllTags,
  ) async {
    return await Navigator.of(context).push<PacingModel>(
      MaterialPageRoute(
        builder: (context) => PacingsSearch(
          getAllTags: getAllTags,
          search: search,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllTags(),
      builder: (context, snapshot) => SearchDialog(
        onChanged: (query, selectedTags) => search(query, selectedTags),
        hintText: S.of(context).search(category: S.of(context).pacings),
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
                  S.of(context).improvisationCount(count: item.improvisations.length),
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
      ),
    );
  }
}
