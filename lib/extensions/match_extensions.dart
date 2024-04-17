import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../models/match_model.dart';
import '../models/penalties_impact_type.dart';
import '../models/penalty_model.dart';

extension MatchExtensions on MatchModel {
  // Color
  Color getTeamColor(int teamId) => Color(teams.firstWhere((element) => element.id == teamId).color);

  // Penalties
  Map<int, List<PenaltyModel>> getPenaltiesGroupedByImprovisationId() => List<PenaltyModel>.from(penalties).groupListsBy((a) => a.improvisationId);

  int getTotalPenaltyValuesByTeamId(int teamId) => penalties
      .where((penalty) => penalty.teamId == teamId)
      .map(
        (e) => switch (e.major) {
          false => 1,
          true => 2,
        },
      )
      .fold(0, (previousValue, element) => previousValue + element);

  int getImprovisationPenaltyValuesByTeamId(int improvisationId, int teamId) => penalties
      .where((penalty) => penalty.improvisationId == improvisationId && penalty.teamId == teamId)
      .map(
        (e) => switch (e.major) {
          false => 1,
          true => 2,
        },
      )
      .fold(0, (previousValue, element) => previousValue + element);

  // Points
  int getSubtotalPointsByTeamId(int teamId) =>
      points.where((point) => point.teamId == teamId).map((point) => point.value).fold(0, (previousValue, element) => previousValue + element);

  int getTotalPointsByTeamId(int teamId) {
    var points = getSubtotalPointsByTeamId(teamId);
    if (enablePenaltiesImpactPoints) {
      if (penaltiesImpactType == PenaltiesImpactType.substractPoints) {
        final penaltyValues = getTotalPenaltyValuesByTeamId(teamId);
        final impact = (penaltyValues / penaltiesRequiredToImpactPoints).floor();
        points -= impact;
      } else {
        final impact = teams.where((t) => t.id != teamId).map((t) {
          final penaltyValues = getTotalPenaltyValuesByTeamId(t.id);
          return (penaltyValues / penaltiesRequiredToImpactPoints).floor();
        }).fold(0, (previousValue, element) => previousValue + element);
        points += impact;
      }
    }

    return points;
  }

  int getImprovisationPointsByTeamId(int improvisationId, int teamId) =>
      points.firstWhereOrNull((point) => point.teamId == teamId && point.improvisationId == improvisationId)?.value ?? 0;
}
