import 'package:objectbox/objectbox.dart';

@Entity()
class PointEntity {
  late int id;
  late int teamId;
  late int improvisationId;
  late int value;

  PointEntity();
}
