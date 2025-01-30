import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

import '../../models/improvisation_type.dart';
import '../app_database.dart';

part 'improvisation_model.g.dart';
part 'improvisation_model.mapper.dart';

@MappableClass()
@Embedded(ignore: {'copyWith'})
class ImprovisationModel with ImprovisationModelMappable {
  final int id;
  final ImprovisationType type;
  final String category;
  final String theme;
  final List<int> durationsInSeconds;
  final String performers;
  final String notes;
  final int timeBufferInSeconds;
  final int huddleTimerInSeconds;
  final String? integrationEntityId;
  final String? integrationAdditionalData;

  const ImprovisationModel({
    required this.id,
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

  ImprovisationEntityData toEntity(int order) {
    return ImprovisationEntityData(
      id: id,
      order: order,
      createdDate: DateTime.now(),
      modifiedDate: DateTime.now(),
      type: type,
      category: category,
      theme: theme,
      durationsInSeconds: durationsInSeconds,
      performers: performers,
      notes: notes,
      timeBufferInSeconds: timeBufferInSeconds,
      huddleTimerInSeconds: huddleTimerInSeconds,
      integrationEntityId: integrationEntityId,
      integrationAdditionalData: integrationAdditionalData,
    );
  }
}
