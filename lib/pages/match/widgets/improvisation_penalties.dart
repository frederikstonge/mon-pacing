import 'package:flutter/material.dart';

import '../../../components/buttons/loading_icon_button.dart';
import '../../../components/custom_card/custom_card.dart';
import '../../../components/team_color_avatar/team_color_avatar.dart';
import '../../../extensions/match_extensions.dart';
import '../../../extensions/penalty_extensions.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../models/improvisation_model.dart';
import '../../../models/match_model.dart';
import '../../../models/penalty_model.dart';

class ImprovisationPenalties extends StatelessWidget {
  final MatchModel match;
  final ImprovisationModel improvisation;
  final Future<void> Function(
    BuildContext context,
    MatchModel match,
    ImprovisationModel improvisation,
    PenaltyModel penalty,
  )
  editPenalty;
  final Future<void> Function(BuildContext context, MatchModel match, ImprovisationModel improvisation) addPenalty;
  final Future<void> Function(BuildContext context, PenaltyModel penalty) removePenalty;

  const ImprovisationPenalties({
    super.key,
    required this.match,
    required this.improvisation,
    required this.editPenalty,
    required this.addPenalty,
    required this.removePenalty,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(S.of(context).penalties, style: const TextStyle(fontWeight: FontWeight.bold)),
            trailing: LoadingIconButton(
              icon: const Icon(Icons.add),
              tooltip: S.of(context).addPenalty,
              onPressed: () async => await addPenalty(context, match, improvisation),
            ),
          ),
          ...match.penalties
              .where((p) => p.improvisationId == improvisation.id)
              .map(
                (e) => InkWell(
                  onTap: () async => await editPenalty(context, match, improvisation, e),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: TeamColorAvatar(color: match.getTeamColor(e.teamId)),
                    title: Text(e.getPenaltyString(S.of(context), match, includePerformerName: false)),
                    subtitle: e.performerId != null
                        ? Text(
                            match.teams
                                .firstWhere((t) => t.id == e.teamId)
                                .performers
                                .firstWhere((p) => p.id == e.performerId)
                                .name,
                          )
                        : null,
                    trailing: LoadingIconButton(
                      icon: const Icon(Icons.remove),
                      tooltip: S.of(context).delete,
                      onPressed: () async => await removePenalty(context, e),
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
