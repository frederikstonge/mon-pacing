import 'package:objectbox/objectbox.dart';

import 'improvisation_entity.dart';
import 'penalty_entity.dart';
import 'point_entity.dart';
import 'star_entity.dart';
import 'tag_entity.dart';
import 'team_entity.dart';

@Entity()
class MatchEntity {
  int id;
  @Index()
  String name;
  @Index()
  @Property(type: PropertyType.date)
  DateTime? createdDate;
  @Index()
  @Property(type: PropertyType.date)
  DateTime? modifiedDate;
  bool enableStatistics;
  bool enablePenaltiesImpactPoints;
  int penaltiesImpactType;
  int penaltiesRequiredToImpactPoints;
  bool enableMatchExpulsion;
  int penaltiesRequiredToExpel;
  String? integrationId;
  String? integrationEntityId;
  String? integrationAdditionalData;
  int? integrationRestrictMaximumPointPerImprovisation;
  int? integrationMinNumberOfImprovisations;
  int? integrationMaxNumberOfImprovisations;
  List<String>? integrationPenaltyTypes;

  final teams = ToMany<TeamEntity>();
  final improvisations = ToMany<ImprovisationEntity>();
  final penalties = ToMany<PenaltyEntity>();
  final points = ToMany<PointEntity>();
  final stars = ToMany<StarEntity>();
  final tags = ToMany<TagEntity>();

  MatchEntity({
    this.id = 0,
    required this.name,
    required this.enableMatchExpulsion,
    required this.enablePenaltiesImpactPoints,
    required this.enableStatistics,
    required this.penaltiesImpactType,
    required this.penaltiesRequiredToExpel,
    required this.penaltiesRequiredToImpactPoints,
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
}
