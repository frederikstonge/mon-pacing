import 'package:objectbox/objectbox.dart';

@Entity()
class StarEntity {
  int id;
  int order;
  int performerId;
  int teamId;

  StarEntity({this.id = 0, required this.order, required this.performerId, required this.teamId});
}
