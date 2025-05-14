import 'package:objectbox/objectbox.dart';

@Entity()
class TagEntity {
  int id;
  String name;

  TagEntity({this.id = 0, required this.name});
}
