import 'dart:async';

import 'package:flutter/material.dart';

import '../../models/team_model.dart';
import '../team_color_avatar/team_color_avatar.dart';
import 'search_dialog.dart';

class TeamsSearch extends StatelessWidget {
  final Future<List<String>> Function() getAllTeamTags;
  final void Function(TeamModel team) onTeamSubmitted;
  final Future<List<TeamModel>> Function(String query, List<String> selectedTags) getAllTeams;

  const TeamsSearch({
    super.key,
    required this.getAllTeamTags,
    required this.getAllTeams,
    required this.onTeamSubmitted,
  });

  static void showDialog(
    BuildContext context,
    Future<List<String>> Function() getAllTeamTags,
    void Function(TeamModel team) onTeamSubmitted,
    Future<List<TeamModel>> Function(String query, List<String> selectedTags) getAllTeams,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TeamsSearch(
          getAllTeamTags: getAllTeamTags,
          onTeamSubmitted: onTeamSubmitted,
          getAllTeams: getAllTeams,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAllTeamTags(),
        builder: (context, snapshot) {
          return SearchDialog(
            onChanged: (query, selectedTags) => getAllTeams(query, selectedTags),
            tags: snapshot.data,
            itemBuilder: (context, item) => InkWell(
              onTap: () {
                Navigator.of(context).pop();
                onTeamSubmitted(item);
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
