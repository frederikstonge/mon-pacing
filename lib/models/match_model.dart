import 'package:dart_mappable/dart_mappable.dart';

import '../repositories/entities/match_entity.dart';
import 'improvisation_model.dart';
import 'penalties_impact_type.dart';
import 'penalty_model.dart';
import 'point_model.dart';
import 'star_model.dart';
import 'team_model.dart';

part 'match_model.mapper.dart';

@MappableClass()
class MatchModel with MatchModelMappable {
  final int id;
  final String name;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final List<TeamModel> teams;
  final List<ImprovisationModel> improvisations;
  final List<PenaltyModel> penalties;
  final List<PointModel> points;
  final List<String> tags;
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
    required this.createdDate,
    required this.modifiedDate,
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
    this.integrationId,
    this.integrationEntityId,
    this.integrationAdditionalData,
    this.integrationRestrictMaximumPointPerImprovisation,
    this.integrationMinNumberOfImprovisations,
    this.integrationMaxNumberOfImprovisations,
    this.integrationPenaltyTypes,
  });

  factory MatchModel.fromEntity({required MatchEntity entity}) => MatchModel(
    id: entity.id,
    name: entity.name,
    createdDate: entity.createdDate,
    modifiedDate: entity.modifiedDate,
    teams: entity.teams.map((e) => TeamModel.fromEmbededEntity(entity: e)).toList(),
    improvisations: entity.improvisations.map((e) => ImprovisationModel.fromEntity(entity: e)).toList(),
    penalties: entity.penalties.map((e) => PenaltyModel.fromEntity(entity: e)).toList(),
    points: entity.points.map((e) => PointModel.fromEntity(entity: e)).toList(),
    tags: entity.tags,
    stars: entity.stars.map((e) => StarModel.fromEntity(entity: e)).toList(),
    enableStatistics: entity.enableStatistics,
    enablePenaltiesImpactPoints: entity.enablePenaltiesImpactPoints,
    penaltiesImpactType: entity.penaltiesImpactType,
    penaltiesRequiredToImpactPoints: entity.penaltiesRequiredToImpactPoints,
    enableMatchExpulsion: entity.enableMatchExpulsion,
    penaltiesRequiredToExpel: entity.penaltiesRequiredToExpel,
    integrationId: entity.integrationId,
    integrationEntityId: entity.integrationEntityId,
    integrationAdditionalData: entity.integrationAdditionalData,
    integrationRestrictMaximumPointPerImprovisation: entity.integrationRestrictMaximumPointPerImprovisation,
    integrationMinNumberOfImprovisations: entity.integrationMinNumberOfImprovisations,
    integrationMaxNumberOfImprovisations: entity.integrationMaxNumberOfImprovisations,
    integrationPenaltyTypes: entity.integrationPenaltyTypes,
  );

  MatchEntity toEntity() => MatchEntity(
    id: id,
    name: name,
    createdDate: createdDate,
    modifiedDate: modifiedDate,
    teams: teams.map((e) => e.toEmbededEntity()).toList(),
    improvisations: improvisations.map((e) => e.toEntity()).toList(),
    penalties: penalties.map((e) => e.toEntity()).toList(),
    points: points.map((e) => e.toEntity()).toList(),
    tags: tags,
    stars: stars.map((e) => e.toEntity()).toList(),
    enableStatistics: enableStatistics,
    enablePenaltiesImpactPoints: enablePenaltiesImpactPoints,
    penaltiesImpactType: penaltiesImpactType,
    penaltiesRequiredToImpactPoints: penaltiesRequiredToImpactPoints,
    enableMatchExpulsion: enableMatchExpulsion,
    penaltiesRequiredToExpel: penaltiesRequiredToExpel,
    integrationId: integrationId,
    integrationEntityId: integrationEntityId,
    integrationAdditionalData: integrationAdditionalData,
    integrationRestrictMaximumPointPerImprovisation: integrationRestrictMaximumPointPerImprovisation,
    integrationMinNumberOfImprovisations: integrationMinNumberOfImprovisations,
    integrationMaxNumberOfImprovisations: integrationMaxNumberOfImprovisations,
    integrationPenaltyTypes: integrationPenaltyTypes,
  );
}
