import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

import '../../../models/improvisation_type.dart';

part 'improvisation_entity.mapper.dart';
part 'improvisation_entity.g.dart';

@MappableClass()
@Embedded(ignore: {'copyWith'})
@Name('ImprovisationModel')
class ImprovisationEntity with ImprovisationEntityMappable {
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

  const ImprovisationEntity({
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
}
