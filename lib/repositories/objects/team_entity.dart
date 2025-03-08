import 'package:objectbox/objectbox.dart';

import 'performer_entity.dart';

@Entity()
class TeamEntity {
  late int id;
  @Index()
  @Property(type: PropertyType.date)
  late DateTime? createdDate;
  @Index()
  @Property(type: PropertyType.date)
  late DateTime? modifiedDate;
  @Index()
  late String name;
  late int color;
  late List<String> tags;

  final performers = ToMany<PerformerEntity>();

  TeamEntity();

  List<String> get performerNames => performers.map((p) => p.name).toList();
}
