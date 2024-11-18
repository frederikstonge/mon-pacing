import 'dart:math';

import 'package:flutter/material.dart';

import '../models/constants.dart';
import '../models/match_model.dart';
import '../models/match_team_model.dart';
import '../models/pacing_model.dart';
import '../models/penalties_impact_type.dart';
import '../models/performer_model.dart';
import 'match_integration_base.dart';

class CitrusIntegration implements MatchIntegrationBase {
  @override
  String get integrationId => 'Citrus';

  @override
  bool integrationIsValid(String data) {
    return true;
  }

  @override
  Future<MatchModel> getMatch(String data, PacingModel pacing) async {
    var performerId = 0;
    return MatchModel(
      id: 0,
      name: 'Citrus Match',
      createdDate: null,
      modifiedDate: null,
      tags: [
        integrationId,
      ],
      teams: [
        MatchTeamModel(
          id: 0,
          name: 'Team 1',
          color: await _getTeamColor(null),
          performers: List.generate(
            5,
            (id) => PerformerModel(
              name: 'John $performerId',
              id: performerId++,
            ),
          ),
        ),
        MatchTeamModel(
          id: 1,
          name: 'Team 2',
          color: await _getTeamColor(null),
          performers: List.generate(
            5,
            (id) => PerformerModel(
              name: 'John $performerId',
              id: performerId++,
            ),
          ),
        ),
      ],
      improvisations: List.from(pacing.improvisations),
      penalties: [],
      points: [],
      enableStatistics: true,
      enablePenaltiesImpactPoints: true,
      penaltiesImpactType: PenaltiesImpactType.addPoints,
      penaltiesRequiredToImpactPoints: 2,
      enableMatchExpulsion: true,
      penaltiesRequiredToExpel: 3,
      integrationId: integrationId,
    );
  }

  @override
  bool exportMatch(MatchModel match) {
    throw UnimplementedError();
  }

  Future<int> _getTeamColor(String? imageUrl) async {
    try {
      if (imageUrl != null) {
        final colorScheme = await ColorScheme.fromImageProvider(provider: Image.network(imageUrl).image);
        return colorScheme.primary.value;
      }
    } catch (_) {}

    final random = Random();
    return Constants.colors.elementAt(random.nextInt(Constants.colors.length)).value;
  }
}
