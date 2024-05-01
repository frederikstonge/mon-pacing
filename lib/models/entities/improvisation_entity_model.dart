import 'package:objectbox/objectbox.dart';

@Entity()
class ImprovisationEntityModel {
  @Id()
  int id;

  int type;

  @Index(type: IndexType.value)
  String category;

  @Index(type: IndexType.value)
  String theme;

  String durationsInSeconds;

  String performers;

  @Index(type: IndexType.value)
  String notes;

  int timeBufferInSeconds;

  int huddleTimerInSeconds;

  ImprovisationEntityModel({
    this.id = 0,
    required this.type,
    required this.category,
    required this.theme,
    required this.durationsInSeconds,
    required this.performers,
    required this.notes,
    required this.timeBufferInSeconds,
    required this.huddleTimerInSeconds,
  });
}
