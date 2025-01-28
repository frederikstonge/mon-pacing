import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

part 'performer_model.mapper.dart';
part 'performer_model.g.dart';

@MappableClass()
@Embedded(ignore: {'copyWith'})
class PerformerModel with PerformerModelMappable {
  final int id;
  final String name;
  final String? integrationEntityId;
  final String? integrationAdditionalData;

  const PerformerModel({
    required this.id,
    required this.name,
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
