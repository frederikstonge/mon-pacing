import 'package:objectbox/objectbox.dart';

@Entity()
class TeamEntityModel {
  @Id()
  int id;

  @Index(type: IndexType.value)
  String name;

  int color;

  TeamEntityModel({
    this.id = 0,
    required this.name,
    required this.color,
  });
}
