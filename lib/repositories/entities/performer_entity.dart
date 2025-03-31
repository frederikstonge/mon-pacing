import 'package:objectbox/objectbox.dart';

@Entity()
class PerformerEntity {
  int id;
  String name;
  int order;
  String? integrationEntityId;
  String? integrationAdditionalData;

  PerformerEntity({
    this.id = 0,
    required this.name,
    required this.order,
    this.integrationEntityId,
    this.integrationAdditionalData,
  });
}
