import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

import '../repositories/app_database.dart';
import 'improvisation_model.dart';
import 'improvisation_type.dart';
import 'match_team_model.dart';
import 'penalties_impact_type.dart';
import 'penalty_model.dart';
import 'performer_model.dart';
import 'point_model.dart';
import 'star_model.dart';

part 'match_model.mapper.dart';
part 'match_model.g.dart';

@MappableClass()
@collection
class MatchModel with MatchModelMappable {
  final int id;
  @index
  final String name;
  @index
  final DateTime? createdDate;
  @index
  final DateTime? modifiedDate;
  final List<String> tags;
  final List<MatchTeamModel> teams;
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

  List<String> get teamNames => teams.map((e) => e.name).toList();

  factory MatchModel.fromEntity(
    MatchEntityData match,
    List<TeamEntityData> teams,
    List<ImprovisationEntityData> improvisations,
    List<PerformerEntityData> performers,
    List<PenaltyEntityData> penalties,
    List<PointEntityData> points,
    List<StarEntityData> stars,
    List<TagEntityData> tags,
  ) {
    return MatchModel(
      id: match.id,
      name: match.name,
      createdDate: match.createdDate,
      modifiedDate: match.modifiedDate,
      teams: teams.map((e) => MatchTeamModel.fromEntity(e, performers.where((p) => p.team == e.id).toList())).toList(),
      improvisations: improvisations.map((e) => ImprovisationModel.fromEntity(e)).toList(),
      penalties: penalties.map((e) => PenaltyModel.fromEntity(e)).toList(),
      points: points.map((e) => PointModel.fromEntity(e)).toList(),
      stars: stars.map((e) => StarModel.fromEntity(e)).toList(),
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
      tags: tags.map((e) => e.name).toList(),
    );
  }

  MatchEntityData toEntity() {
    return MatchEntityData(
      id: id,
      name: name,
      createdDate: createdDate ?? DateTime.now(),
      modifiedDate: modifiedDate ?? DateTime.now(),
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
}
