import 'package:objectbox/objectbox.dart';

import '../base_model.dart';
import 'improvisation_entity_model.dart';

@Entity()
class PacingEntityModel implements BaseModel {
  @Id()
  @override
  int id;

  @Index(type: IndexType.value)
  @Property(type: PropertyType.date)
  @override
  DateTime? createdDate;

  @Index(type: IndexType.value)
  @Property(type: PropertyType.date)
  @override
  DateTime? modifiedDate;

  @Index(type: IndexType.value)
  String name;

  ToMany<ImprovisationEntityModel> improvisations;

  int defaultNumberOfTeams;

  PacingEntityModel({
    this.id = 0,
    required this.name,
    required this.improvisations,
    required this.defaultNumberOfTeams,
    this.createdDate,
    this.modifiedDate,
  });
}
