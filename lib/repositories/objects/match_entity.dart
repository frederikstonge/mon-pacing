import 'package:objectbox/objectbox.dart';

import 'improvisation_entity.dart';
import 'match_team_entity.dart';
import 'penalty_entity.dart';
import 'point_entity.dart';
import 'star_entity.dart';

@Entity()
class MatchEntity {
  late int id;
  @Index()
  late String name;
  @Index()
  @Property(type: PropertyType.date)
  late DateTime? createdDate;
  @Index()
  @Property(type: PropertyType.date)
  late DateTime? modifiedDate;
  late List<String> tags;
  late bool enableStatistics;
  late bool enablePenaltiesImpactPoints;
  late int penaltiesImpactType;
  late int penaltiesRequiredToImpactPoints;
  late bool enableMatchExpulsion;
  late int penaltiesRequiredToExpel;
  late String? integrationId;
  late String? integrationEntityId;
  late String? integrationAdditionalData;
  late int? integrationRestrictMaximumPointPerImprovisation;
  late int? integrationMinNumberOfImprovisations;
  late int? integrationMaxNumberOfImprovisations;
  late List<String>? integrationPenaltyTypes;

  final teams = ToMany<MatchTeamEntity>();
  final improvisations = ToMany<ImprovisationEntity>();
  final penalties = ToMany<PenaltyEntity>();
  final points = ToMany<PointEntity>();
  final stars = ToMany<StarEntity>();

  MatchEntity();

  List<String> get teamNames => teams.map((e) => e.name).toList();
}
