import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

import '../../models/improvisation_type.dart';
import '../../models/penalties_impact_type.dart';
import 'improvisation_model.dart';
import 'match_team_model.dart';
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
}
