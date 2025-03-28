import 'package:objectbox/objectbox.dart';

@Entity()
class PerformerEntity {
  int id;
  String name;
  String? integrationEntityId;
  String? integrationAdditionalData;

  PerformerEntity({this.id = 0, required this.name, this.integrationEntityId, this.integrationAdditionalData});
}
