import 'package:flutter/material.dart';

import '../../../components/team_color_avatar/team_color_avatar.dart';
import '../../../models/match_model.dart';

class Scoreboard extends StatelessWidget implements PreferredSizeWidget {
  final MatchModel match;
  final double height;

  const Scoreboard({
    super.key,
    required this.match,
    this.height = 100,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: match.teams
          .map(
            (team) => Column(
              children: [
                Row(
                  children: [
                    TeamColorAvatar(color: Color(team.color)),
                    const SizedBox(width: 6),
                    Text(
                      team.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Builder(builder: (context) {
                  final points = match.points
                      .where((point) => point.teamId == team.id)
                      .map((point) => point.value)
                      .fold(0, (previousValue, element) => previousValue + element);
                  return Text(
                    '$points',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.displayLarge!,
                  );
                }),
              ],
            ),
          )
          .toList(),
    );
  }
}
