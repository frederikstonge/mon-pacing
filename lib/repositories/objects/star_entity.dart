import 'package:objectbox/objectbox.dart';

@Entity()
class StarEntity {
  int id;
  int performerId;
  int teamId;

  StarEntity({this.id = 0, required this.performerId, required this.teamId});
}
