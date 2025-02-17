import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../repositories/app_database.dart';
import 'improvisation_model.dart';
import 'penalties_impact_type.dart';
import 'penalty_model.dart';
import 'point_model.dart';
import 'star_model.dart';
import 'team_model.dart';

part 'match_model.mapper.dart';

@MappableClass()
class MatchModel with MatchModelMappable {
  final int? id;
  final String name;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final List<String> tags;
  final List<TeamModel> teams;
  final List<ImprovisationModel> improvisations;
  final List<PenaltyModel> penalties;
  final List<PointModel> points;
  final List<StarModel> stars;
  final bool enableStatistics;
  final bool enablePenaltiesImpactPoints;
  final PenaltiesImpactType penaltiesImpactType;
  final int penaltiesRequiredToImpactPoints;
  final bool enableMatchExpulsion;
  final int penaltiesRequiredToExpel;
  final String? integrationId;
  final String? integrationEntityId;
  final String? integrationAdditionalData;
  final int? integrationRestrictMaximumPointPerImprovisation;
  final int? integrationMinNumberOfImprovisations;
  final int? integrationMaxNumberOfImprovisations;
  final List<String>? integrationPenaltyTypes;

  const MatchModel({
    required this.id,
    required this.name,
    required this.teams,
    required this.improvisations,
    required this.penalties,
    required this.points,
    this.tags = const [],
    this.stars = const [],
    this.enableStatistics = true,
    this.enablePenaltiesImpactPoints = true,
    this.penaltiesImpactType = PenaltiesImpactType.addPoints,
    this.penaltiesRequiredToImpactPoints = 3,
    this.enableMatchExpulsion = true,
    this.penaltiesRequiredToExpel = 3,
    this.createdDate,
    this.modifiedDate,
    this.integrationId,
    this.integrationEntityId,
    this.integrationAdditionalData,
    this.integrationRestrictMaximumPointPerImprovisation,
    this.integrationMinNumberOfImprovisations,
    this.integrationMaxNumberOfImprovisations,
    this.integrationPenaltyTypes,
  });

  factory MatchModel.fromEntity(
    MatchEntityData match,
    List<TeamModel> teams,
    List<ImprovisationModel> improvisations,
    List<PenaltyModel> penalties,
    List<PointModel> points,
    List<StarModel> stars,
    List<String> tags,
  ) {
    return MatchModel(
      id: match.id,
      name: match.name,
      createdDate: match.createdDate,
      modifiedDate: match.modifiedDate,
      teams: teams,
      improvisations: improvisations,
      penalties: penalties,
      points: points,
      stars: stars,
      enableStatistics: match.enableStatistics,
      enablePenaltiesImpactPoints: match.enablePenaltiesImpactPoints,
      penaltiesImpactType: match.penaltiesImpactType,
      penaltiesRequiredToImpactPoints: match.penaltiesRequiredToImpactPoints,
      enableMatchExpulsion: match.enableMatchExpulsion,
      penaltiesRequiredToExpel: match.penaltiesRequiredToExpel,
      integrationId: match.integrationId,
      integrationEntityId: match.integrationEntityId,
      integrationAdditionalData: match.integrationAdditionalData,
      integrationRestrictMaximumPointPerImprovisation: match.integrationRestrictMaximumPointPerImprovisation,
      integrationMinNumberOfImprovisations: match.integrationMinNumberOfImprovisations,
      integrationMaxNumberOfImprovisations: match.integrationMaxNumberOfImprovisations,
      integrationPenaltyTypes: match.integrationPenaltyTypes,
      tags: tags,
    );
  }

  MatchEntityCompanion toCompanion() {
    return MatchEntityCompanion(
      id: id != null ? Value(id!) : Value.absent(),
      createdDate: Value(createdDate ?? DateTime.now()),
      modifiedDate: Value(modifiedDate ?? DateTime.now()),
      name: Value(name),
      enableStatistics: Value(enableStatistics),
      enablePenaltiesImpactPoints: Value(enablePenaltiesImpactPoints),
      penaltiesImpactType: Value(penaltiesImpactType),
      penaltiesRequiredToImpactPoints: Value(penaltiesRequiredToImpactPoints),
      enableMatchExpulsion: Value(enableMatchExpulsion),
      penaltiesRequiredToExpel: Value(penaltiesRequiredToExpel),
      integrationId: Value(integrationId),
      integrationEntityId: Value(integrationEntityId),
      integrationAdditionalData: Value(integrationAdditionalData),
      integrationRestrictMaximumPointPerImprovisation: Value(integrationRestrictMaximumPointPerImprovisation),
      integrationMinNumberOfImprovisations: Value(integrationMinNumberOfImprovisations),
      integrationMaxNumberOfImprovisations: Value(integrationMaxNumberOfImprovisations),
      integrationPenaltyTypes: Value(integrationPenaltyTypes),
    );
  }
}
