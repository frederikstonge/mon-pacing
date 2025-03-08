import 'package:objectbox/objectbox.dart';

@Entity()
class PerformerEntity {
  late int id;
  late String name;
  late String? integrationEntityId;
  late String? integrationAdditionalData;

  PerformerEntity();
}
