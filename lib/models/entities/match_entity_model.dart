import 'package:objectbox/objectbox.dart';

import '../base_model.dart';
import 'improvisation_entity_model.dart';
import 'penalty_entity_model.dart';
import 'point_entity_model.dart';
import 'team_entity_model.dart';

@Entity()
class MatchEntityModel implements BaseModel {
  @Id()
  @override
  int id;

  @Index(type: IndexType.value)
  @override
  DateTime? createdDate;

  @Index(type: IndexType.value)
  @override
  DateTime? modifiedDate;

  @Index(type: IndexType.value)
  String name;

  ToMany<ImprovisationEntityModel> improvisations;

  ToMany<TeamEntityModel> teams;

  ToMany<PenaltyEntityModel> penalties;

  ToMany<PointEntityModel> points;

  bool enablePenaltiesImpactPoints;

  int penaltiesImpactType;

  int penaltiesRequiredToImpactPoints;

  MatchEntityModel({
    this.id = 0,
    required this.name,
    required this.improvisations,
    required this.teams,
    required this.penalties,
    required this.points,
    required this.enablePenaltiesImpactPoints,
    required this.penaltiesImpactType,
    required this.penaltiesRequiredToImpactPoints,
  });
}
