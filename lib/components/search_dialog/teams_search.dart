import 'dart:async';

import 'package:flutter/material.dart';

import '../../models/team_model.dart';
import '../team_color_avatar/team_color_avatar.dart';
import 'search_dialog.dart';

class TeamsSearch extends StatelessWidget {
  final Future<List<TeamModel>> Function(String query, List<String> selectedTags) search;
  final Future<List<String>> Function() getAllTags;

  const TeamsSearch({
    super.key,
    required this.getAllTags,
    required this.search,
  });

  static Future<TeamModel?> showDialog(
    BuildContext context,
    Future<List<TeamModel>> Function(String query, List<String> selectedTags) search,
    Future<List<String>> Function() getAllTags,
  ) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TeamsSearch(
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
        builder: (context, snapshot) {
          return SearchDialog(
            onChanged: (query, selectedTags) => search(query, selectedTags),
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
