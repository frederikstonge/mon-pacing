import 'package:objectbox/objectbox.dart';

import 'improvisation_entity.dart';

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
  List<String> tags;
  String? integrationId;
  String? integrationEntityId;
  String? integrationAdditionalData;

  final improvisations = ToMany<ImprovisationEntity>();

  PacingEntity({
    this.id = 0,
    required this.name,
    required this.defaultNumberOfTeams,
    this.createdDate,
    this.modifiedDate,
    this.tags = const [],
    this.integrationId,
    this.integrationEntityId,
    this.integrationAdditionalData,
  });

  List<String> get categories => improvisations.where((e) => e.category.isNotEmpty).map((e) => e.category).toList();

  List<String> get themes => improvisations.where((e) => e.theme.isNotEmpty).map((e) => e.theme).toList();
}
