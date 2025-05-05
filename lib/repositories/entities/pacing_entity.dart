import 'package:objectbox/objectbox.dart';

import 'improvisation_entity.dart';
import 'tag_entity.dart';

@Entity()
class PacingEntity {
  int id;
  @Index()
  String name;
  @Index()
  @Property(type: PropertyType.date)
  DateTime? createdDate;
  @Index()
  @Property(type: PropertyType.date)
  DateTime? modifiedDate;
  int defaultNumberOfTeams;
  String? integrationId;
  String? integrationEntityId;
  String? integrationAdditionalData;

  final tags = ToMany<TagEntity>();
  final improvisations = ToMany<ImprovisationEntity>();

  PacingEntity({
    this.id = 0,
    required this.name,
    required this.defaultNumberOfTeams,
    this.createdDate,
    this.modifiedDate,
    this.integrationId,
    this.integrationEntityId,
    this.integrationAdditionalData,
  });
}
