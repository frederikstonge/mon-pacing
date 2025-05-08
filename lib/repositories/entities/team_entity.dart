import 'package:objectbox/objectbox.dart';

import 'performer_entity.dart';
import 'tag_entity.dart';

@Entity()
class TeamEntity {
  int id;
  @Index()
  @Property(type: PropertyType.date)
  DateTime? createdDate;
  @Index()
  @Property(type: PropertyType.date)
  DateTime? modifiedDate;
  @Index()
  String name;
  int color;
  bool hasMatch;
  String? integrationEntityId;
  String? integrationAdditionalData;

  final performers = ToMany<PerformerEntity>();
  final tags = ToMany<TagEntity>();

  TeamEntity({
    this.id = 0,
    required this.name,
    required this.color,
    required this.hasMatch,
    this.createdDate,
    this.modifiedDate,
    this.integrationEntityId,
    this.integrationAdditionalData,
  });
}
