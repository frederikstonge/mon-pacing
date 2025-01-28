import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

import '../repositories/app_database.dart';
import 'improvisation_type.dart';

part 'improvisation_model.mapper.dart';
part 'improvisation_model.g.dart';

@MappableClass()
@Embedded(ignore: {'copyWith'})
class ImprovisationModel with ImprovisationModelMappable {
  final int id;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
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
    this.createdDate,
    this.modifiedDate,
    this.timeBufferInSeconds = 30,
    this.huddleTimerInSeconds = 30,
    this.integrationEntityId,
    this.integrationAdditionalData,
  });

  factory ImprovisationModel.fromEntity(
    ImprovisationEntityData improvisation,
  ) {
    return ImprovisationModel(
      id: improvisation.id,
      type: improvisation.type,
      category: improvisation.category,
      theme: improvisation.theme,
      durationsInSeconds: improvisation.durationsInSeconds,
      performers: improvisation.performers,
      notes: improvisation.notes,
      timeBufferInSeconds: improvisation.timeBufferInSeconds,
      huddleTimerInSeconds: improvisation.huddleTimerInSeconds,
      integrationEntityId: improvisation.integrationEntityId,
      integrationAdditionalData: improvisation.integrationAdditionalData,
    );
  }

  ImprovisationEntityData toEntity(int order) {
    return ImprovisationEntityData(
      id: id,
      order: order,
      createdDate: createdDate ?? DateTime.now(),
      modifiedDate: modifiedDate ?? DateTime.now(),
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
