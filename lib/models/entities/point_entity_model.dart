import 'package:objectbox/objectbox.dart';

@Entity()
class PointEntityModel {
  @Id()
  int id;

  int teamId;

  int improvisationId;

  int value;

  PointEntityModel({
    this.id = 0,
    required this.teamId,
    required this.improvisationId,
    required this.value,
  });
}
