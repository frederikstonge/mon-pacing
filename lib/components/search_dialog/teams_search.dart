import 'dart:async';

import 'package:flutter/material.dart';

import '../../models/team_model.dart';
import '../team_color_avatar/team_color_avatar.dart';
import 'search_dialog.dart';

class TeamsSearch extends StatelessWidget {
  final Future<List<TeamModel>> Function(String query, List<String> selectedTags) fetch;
  final Future<List<String>> Function() fetchTags;

  const TeamsSearch({
    super.key,
    required this.fetchTags,
    required this.fetch,
  });

  static Future<TeamModel?> showDialog(
    BuildContext context,
    Future<List<TeamModel>> Function(String query, List<String> selectedTags) fetch,
    Future<List<String>> Function() fetchTags,
  ) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TeamsSearch(
          fetchTags: fetchTags,
          fetch: fetch,
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
                leading: TeamColorAvatar(color: Color(item.color)),
                title: Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
            ),
          );
        });
  }
}
