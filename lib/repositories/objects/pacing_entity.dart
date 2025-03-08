import 'package:objectbox/objectbox.dart';

import 'improvisation_entity.dart';

@Entity()
class PacingEntity {
  late int id;
  @Index()
  late String name;
  @Index()
  @Property(type: PropertyType.date)
  late DateTime? createdDate;
  @Index()
  @Property(type: PropertyType.date)
  late DateTime? modifiedDate;
  late int defaultNumberOfTeams;
  late List<String> tags;
  late String? integrationId;
  late String? integrationEntityId;
  late String? integrationAdditionalData;

  final improvisations = ToMany<ImprovisationEntity>();

  PacingEntity();

  List<String> get categories => improvisations.where((e) => e.category.isNotEmpty).map((e) => e.category).toList();

  List<String> get themes => improvisations.where((e) => e.theme.isNotEmpty).map((e) => e.theme).toList();
}
