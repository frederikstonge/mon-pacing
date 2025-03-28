import 'package:objectbox/objectbox.dart';

@Entity()
class ImprovisationEntity {
  int id;
  int type;
  String category;
  String theme;
  @Property(type: PropertyType.intVector)
  List<int> durationsInSeconds;
  String performers;
  String notes;
  int timeBufferInSeconds = 30;
  int huddleTimerInSeconds = 30;
  String? integrationEntityId;
  String? integrationAdditionalData;

  ImprovisationEntity({
    this.id = 0,
    required this.type,
    required this.category,
    required this.theme,
    required this.durationsInSeconds,
    required this.performers,
    required this.notes,
    this.timeBufferInSeconds = 30,
    this.huddleTimerInSeconds = 30,
    this.integrationEntityId,
    this.integrationAdditionalData,
  });
}
