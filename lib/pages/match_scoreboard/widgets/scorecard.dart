import 'package:flutter/material.dart';

import '../../../components/custom_card/custom_card.dart';
import '../../../components/team_color_avatar/team_color_avatar.dart';
import '../../../components/text_header/text_header.dart';
import '../../../extensions/match_extensions.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/match_model.dart';

class Scorecard extends StatelessWidget {
  final MatchModel match;

  const Scorecard({
    super.key,
    required this.match,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Table(
            columnWidths: [
              const FlexColumnWidth(),
              ...match.teams.map((e) => const IntrinsicColumnWidth()),
            ].asMap(),
            border: TableBorder(
              horizontalInside: BorderSide(color: Theme.of(context).dividerColor),
            ),
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
                      child: Row(
                        children: [
                          TeamColorAvatar(color: Color(team.color)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ...match.improvisations.asMap().entries.map(
                    (e) => TableRow(
                      children: [
                        Text(
                          S.of(context).improvisationNumber(e.key + 1),
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
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              TableRow(
                children: [
                  Text(
                    S.of(context).total,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ...match.teams.map(
                    (team) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${match.getTotalPointsByTeamId(team.id)}',
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
          if (match.penalties.isNotEmpty) ...[
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextHeader(title: S.of(context).penalties),
            ),
            ...match.getPenaltiesGroupedByImprovisationId().entries.map((e) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${S.of(context).improvisationNumber(e.key + 1)}: ',
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
                                    '${e.performer} - ${e.type}${e.major ? ' ${S.of(context).major}' : ''}',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              );
            }),
          ],
        ],
      ),
    );
  }
}
