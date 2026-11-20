import 'dart:async';

import 'package:collection/collection.dart';
import 'package:material_ui/material_ui.dart';

import '../../../components/buttons/loading_icon_button.dart';
import '../../../components/custom_card/custom_card.dart';
import '../../../components/quantity_stepper/quantity_stepper_form_field.dart';
import '../../../components/team_color_avatar/team_color_avatar.dart';
import '../../../extensions/penalty_extensions.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../models/improvisation_model.dart';
import '../../../models/match_model.dart';
import '../../../models/penalty_model.dart';

class ImprovisationStatistics extends StatelessWidget {
  final MatchModel match;
  final ImprovisationModel improvisation;
  final Future<void> Function(int improvisationId, int teamId, int value) onPointChanged;
  final Future<void> Function(BuildContext, MatchModel, ImprovisationModel) addPenalty;
  final Future<void> Function(BuildContext, MatchModel, ImprovisationModel, PenaltyModel) editPenalty;
  final Future<void> Function(BuildContext, PenaltyModel) removePenalty;

  const ImprovisationStatistics({
    super.key,
    required this.match,
    required this.improvisation,
    required this.onPointChanged,
    required this.addPenalty,
    required this.editPenalty,
    required this.removePenalty,
  });

  @override
  Widget build(BuildContext context) {
    final localizer = S.of(context);
    final penalties = match.penalties.where((p) => p.improvisationId == improvisation.id);
    return CustomCard(
      contentPadding: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '${localizer.points} / ${localizer.penalties}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              LoadingIconButton(
                tooltip: localizer.addPenalty,
                onPressed: () => addPenalty(context, match, improvisation),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          for (final team in match.teams) ...[
            Row(
              children: [
                TeamColorAvatar(color: Color(team.color)),
                const SizedBox(width: 6),
                Expanded(child: Text(team.name, overflow: TextOverflow.ellipsis)),
                QuantityStepperFormField(
                  key: ValueKey('${improvisation.id}-${team.id}'),
                  initialValue:
                      match.points
                          .firstWhereOrNull((p) => p.teamId == team.id && p.improvisationId == improvisation.id)
                          ?.value ??
                      0,
                  inputWidth: 32,
                  inputHeight: 42,
                  onChanged: (value) {
                    if (value != null) unawaited(onPointChanged(improvisation.id, team.id, value));
                  },
                  minValue: 0,
                  maxValue: match.maximumPointsPerImprovisation ?? 999,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ],
            ),
            for (final penalty in penalties.where((p) => p.teamId == team.id))
              ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                contentPadding: EdgeInsets.zero,
                title: Text(penalty.getPenaltyString(localizer, match)),
                onTap: () => editPenalty(context, match, improvisation, penalty),
                trailing: LoadingIconButton(
                  tooltip: localizer.delete,
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () => removePenalty(context, penalty),
                ),
              ),
          ],
        ],
      ),
    );
  }
}
