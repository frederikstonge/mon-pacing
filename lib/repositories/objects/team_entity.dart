import 'package:objectbox/objectbox.dart';

import 'performer_entity.dart';

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
  List<String> tags;

  final performers = ToMany<PerformerEntity>();

  TeamEntity({
    this.id = 0,
    required this.name,
    required this.color,
    this.createdDate,
    this.modifiedDate,
    this.tags = const [],
  });

  List<String> get performerNames => performers.map((p) => p.name).toList();
}
