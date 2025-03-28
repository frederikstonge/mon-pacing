import 'package:objectbox/objectbox.dart';

@Entity()
class PointEntity {
  int id;
  int teamId;
  int improvisationId;
  int value;

  PointEntity({this.id = 0, required this.teamId, required this.improvisationId, required this.value});
}
