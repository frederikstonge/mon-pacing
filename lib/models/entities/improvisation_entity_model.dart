import 'package:objectbox/objectbox.dart';

import 'duration_entity_model.dart';

@Entity()
class ImprovisationEntityModel {
  @Id()
  int id;

  int type;

  @Index(type: IndexType.value)
  String category;

  @Index(type: IndexType.value)
  String theme;

  ToMany<DurationEntityModel> durations;

  String performers;

  @Index(type: IndexType.value)
  String notes;

  ToOne<DurationEntityModel> timeBuffer;

  ToOne<DurationEntityModel> huddleTimer;

  ImprovisationEntityModel({
    this.id = 0,
    required this.type,
    required this.category,
    required this.theme,
    required this.durations,
    required this.performers,
    required this.notes,
    required this.timeBuffer,
    required this.huddleTimer,
  });
}
