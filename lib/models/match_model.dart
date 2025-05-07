import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../repositories/entities/match_entity.dart';
import 'improvisation_model.dart';
import 'penalties_impact_type.dart';
import 'penalty_model.dart';
import 'point_model.dart';
import 'star_model.dart';
import 'tag_model.dart';
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
  final List<TagModel> tags;
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

  factory MatchModel.fromEntity({required MatchEntity entity}) {
    return MatchModel(
      id: entity.id,
      name: entity.name,
      createdDate: entity.createdDate,
      modifiedDate: entity.modifiedDate,
      teams: entity.teams.map((e) => TeamModel.fromEntity(entity: e)).toList(),
      improvisations:
          entity.improvisations.sortedBy((e) => e.order).map((e) => ImprovisationModel.fromEntity(entity: e)).toList(),
      penalties: entity.penalties.map((e) => PenaltyModel.fromEntity(entity: e)).toList(),
      points: entity.points.map((e) => PointModel.fromEntity(entity: e)).toList(),
      stars: entity.stars.sortedBy((e) => e.order).map((e) => StarModel.fromEntity(entity: e)).toList(),
      tags: entity.tags.map((e) => TagModel.fromEntity(entity: e)).toList(),
      enableStatistics: entity.enableStatistics,
      enablePenaltiesImpactPoints: entity.enablePenaltiesImpactPoints,
      penaltiesImpactType: PenaltiesImpactType.values.elementAt(entity.penaltiesImpactType),
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
  }

  MatchEntity toEntity() {
    final match = MatchEntity(
      id: id,
      name: name,
      createdDate: createdDate,
      modifiedDate: modifiedDate,
      enableStatistics: enableStatistics,
      enablePenaltiesImpactPoints: enablePenaltiesImpactPoints,
      penaltiesImpactType: penaltiesImpactType.index,
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

    match.improvisations.addAll(improvisations.asMap().entries.map((e) => e.value.toEntity(e.key)).toList());
    match.teams.addAll(teams.map((e) => e.toEntity()).toList());
    match.penalties.addAll(penalties.map((e) => e.toEntity()).toList());
    match.points.addAll(points.map((e) => e.toEntity()).toList());
    match.stars.addAll(stars.asMap().entries.map((e) => e.value.toEntity(e.key)).toList());
    match.tags.addAll(tags.map((e) => e.toEntity()).toList());

    return match;
  }

  MatchModel createNew() => copyWith(
    id: 0,
    improvisations: List<ImprovisationModel>.from(improvisations.map((e) => e.createNew())),
    teams: List<TeamModel>.from(teams.map((e) => e.createNew())),
    penalties: List<PenaltyModel>.from(penalties.map((e) => e.createNew())),
    points: List<PointModel>.from(points.map((e) => e.createNew())),
    stars: List<StarModel>.from(stars.map((e) => e.createNew())),
    tags: List<TagModel>.from(tags.map((e) => e.createNew())),
  );
}
