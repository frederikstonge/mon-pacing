import 'package:flutter/material.dart';

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
    final textColor = Theme.of(context).colorScheme.onPrimary;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: match.teams
          .map(
            (team) => Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 16,
                      width: 16,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.onPrimary,
                            width: 1.0,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Color(team.color),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      team.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: textColor),
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
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(color: textColor),
                  );
                }),
              ],
            ),
          )
          .toList(),
    );
  }
}
