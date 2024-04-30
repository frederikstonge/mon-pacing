import 'package:objectbox/objectbox.dart';

import '../base_model.dart';

@Entity()
class DurationEntityModel implements BaseModel {
  @Id()
  @override
  int id;

  @override
  DateTime? createdDate;

  @override
  DateTime? modifiedDate;

  int durationInSeconds;

  DurationEntityModel({
    this.id = 0,
    required this.durationInSeconds,
  });
}
