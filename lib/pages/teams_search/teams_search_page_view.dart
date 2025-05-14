import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../components/search/search_dialog.dart';
import '../../components/team_color_avatar/team_color_avatar.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../models/team_model.dart';
import '../../repositories/teams_repository.dart';
import '../../router/routes.dart';

class TeamsSearchPageView extends StatelessWidget {
  const TeamsSearchPageView({super.key});

  static Future<TeamModel?> showDialog(BuildContext context) async {
    return await GoRouter.of(context).pushNamed<TeamModel>(Routes.teamsSearch);
  }

  @override
  Widget build(BuildContext context) {
    return SearchDialog(
      onChanged: (query, selectedTags) => context.read<TeamsRepository>().search(query, selectedTags),
      hintText: S.of(context).search(category: S.of(context).teams),
      itemBuilder:
          (context, item) => InkWell(
            onTap: () {
              Navigator.of(context).pop(item);
            },
            child: ListTile(
              leading: TeamColorAvatar(color: Color(item.color)),
              title: Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
    );
  }
}
