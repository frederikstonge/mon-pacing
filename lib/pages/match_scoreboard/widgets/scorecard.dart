import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_card/custom_card.dart';
import '../../../components/team_color_avatar/team_color_avatar.dart';
import '../../../components/text_header/text_header.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/match_model.dart';
import '../../../models/penalty_model.dart';

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
            columnWidths: const <int, TableColumnWidth>{
              0: FlexColumnWidth(),
              1: IntrinsicColumnWidth(),
              2: IntrinsicColumnWidth(),
            },
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      S.of(context).points,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      S.of(context).penalties,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
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
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: match.teams
                              .map(
                                (team) => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TeamColorAvatar(color: Color(team.color)),
                                    const SizedBox(width: 6),
                                    Builder(builder: (context) {
                                      final points = match.points
                                              .firstWhereOrNull((point) => point.teamId == team.id && point.improvisationId == e.value.id)
                                              ?.value ??
                                          0;
                                      return Text(
                                        '$points',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      );
                                    }),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: match.teams
                              .map(
                                (team) => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TeamColorAvatar(color: Color(team.color)),
                                    const SizedBox(width: 6),
                                    Builder(builder: (context) {
                                      final penalties = switch (match.penalties
                                          .firstWhereOrNull((penalty) => penalty.teamId == team.id && penalty.improvisationId == e.value.id)
                                          ?.major) {
                                        null => 0,
                                        false => 1,
                                        true => 2,
                                      };
                                      return Text(
                                        '$penalties',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      );
                                    }),
                                  ],
                                ),
                              )
                              .toList(),
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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: match.teams
                        .map(
                          (team) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TeamColorAvatar(color: Color(team.color)),
                              const SizedBox(width: 6),
                              Builder(builder: (context) {
                                final points = match.points
                                    .where((point) => point.teamId == team.id)
                                    .fold(0, (previousValue, element) => previousValue + element.value);
                                return Text(
                                  '$points',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                );
                              }),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: match.teams
                        .map(
                          (team) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TeamColorAvatar(color: Color(team.color)),
                              const SizedBox(width: 6),
                              Builder(builder: (context) {
                                final penalties = match.penalties
                                    .where((penalty) => penalty.teamId == team.id)
                                    .fold(0, (previousValue, element) => previousValue + (element.major ? 2 : 1));
                                return Text(
                                  '$penalties',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                );
                              }),
                            ],
                          ),
                        )
                        .toList(),
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
            ...List<PenaltyModel>.from(match.penalties).groupListsBy((a) => a.improvisationId).entries.map((e) {
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
                                TeamColorAvatar(color: Color(match.teams.firstWhere((element) => element.id == e.teamId).color)),
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
