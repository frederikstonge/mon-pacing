import 'package:objectbox/objectbox.dart';

@Entity()
class ImprovisationEntity {
  late int id;
  late int type;
  late String category;
  late String theme;
  @Property(type: PropertyType.intVector)
  late List<int> durationsInSeconds;
  late String performers;
  late String notes;
  late int timeBufferInSeconds = 30;
  late int huddleTimerInSeconds = 30;
  late String? integrationEntityId;
  late String? integrationAdditionalData;

  ImprovisationEntity();
}
