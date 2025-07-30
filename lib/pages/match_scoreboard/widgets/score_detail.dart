import 'package:flutter/material.dart';

import '../../../components/custom_card/custom_card.dart';
import '../../../components/team_color_avatar/team_color_avatar.dart';
import '../../../components/text_header/text_header.dart';
import '../../../extensions/match_extensions.dart';
import '../../../extensions/penalty_extensions.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../models/match_model.dart';

class ScoreDetail extends StatelessWidget {
  final MatchModel match;

  const ScoreDetail({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Table(
            columnWidths: [const FlexColumnWidth(), ...match.teams.map((e) => const IntrinsicColumnWidth())].asMap(),
            border: TableBorder(horizontalInside: BorderSide(color: Theme.of(context).dividerColor)),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: [
                  Text(
                    S.of(context).improvisations,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ...match.teams.map(
                    (team) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(children: [TeamColorAvatar(color: Color(team.color))]),
                    ),
                  ),
                ],
              ),
              ...match.improvisations.asMap().entries.map(
                (e) => TableRow(
                  children: [
                    Text(
                      S.of(context).improvisationNumber(order: e.key + 1),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    ...match.teams.map(
                      (team) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${match.getImprovisationPointsByTeamId(e.value.id, team.id)}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              TableRow(
                children: [
                  Text(
                    S.of(context).subtotal,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ...match.teams.map(
                    (team) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${match.getSubtotalPointsByTeamId(team.id)}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextHeader(title: S.of(context).penalties),
          ),
          if (match.penalties.isEmpty) ...[
            Text(S.of(context).noPenalty, maxLines: 1, overflow: TextOverflow.ellipsis),
          ] else ...[
            ...match.getPenaltiesGroupedByImprovisationId().entries.map((e) {
              final improvisationNumber = match.improvisations.indexWhere((element) => element.id == e.key) + 1;
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${S.of(context).improvisationNumber(order: improvisationNumber)}: ',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: e.value
                          .map(
                            (e) => Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TeamColorAvatar(color: match.getTeamColor(e.teamId)),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    e.getPenaltyString(S.of(context), match),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              );
            }),
          ],
          const SizedBox(height: 8),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextHeader(title: S.of(context).stars),
          ),
          if (match.stars.isEmpty) ...[
            Text(S.of(context).noStar, maxLines: 1, overflow: TextOverflow.ellipsis),
          ] else ...[
            ...match.stars.map((s) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TeamColorAvatar(color: match.getTeamColor(s.teamId)),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      match.teams
                          .firstWhere((t) => t.id == s.teamId)
                          .performers
                          .firstWhere((p) => p.id == s.performerId)
                          .name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              );
            }),
          ],
        ],
      ),
    );
  }
}
