import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_card/custom_card.dart';
import '../../../components/quantity_stepper/quantity_stepper_form_field.dart';
import '../../../components/team_color_avatar/team_color_avatar.dart';
import '../../../models/improvisation_model.dart';
import '../../../models/match_model.dart';

class ImprovisationActions extends StatelessWidget {
  final MatchModel match;
  final ImprovisationModel improvisation;
  final Future<void> Function(int improvisationId, int teamId, int value) onPointChanged;

  const ImprovisationActions({
    super.key,
    required this.match,
    required this.improvisation,
    required this.onPointChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:
            match.teams.map((team) {
              final points =
                  match.points
                      .firstWhereOrNull((point) => point.teamId == team.id && point.improvisationId == improvisation.id)
                      ?.value ??
                  0;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          TeamColorAvatar(color: Color(team.color)),
                          const SizedBox(width: 6),
                          Expanded(child: Text(team.name, maxLines: 1, overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                    ),
                    QuantityStepperFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      initialValue: points,
                      onChanged: (value) {
                        if (value != null) {
                          unawaited(onPointChanged.call(improvisation.id, team.id, value));
                        }
                      },
                      minValue: 0,
                      maxValue: match.integrationRestrictMaximumPointPerImprovisation,
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}
