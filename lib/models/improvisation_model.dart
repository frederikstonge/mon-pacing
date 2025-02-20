import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../repositories/app_database.dart';
import 'improvisation_type.dart';

part 'improvisation_model.mapper.dart';

@MappableClass()
class ImprovisationModel with ImprovisationModelMappable {
  final int? id;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final int order;
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
  final int? pacingId;
  final int? matchId;

  const ImprovisationModel({
    required this.id,
    required this.order,
    required this.type,
    required this.category,
    required this.theme,
    required this.durationsInSeconds,
    required this.performers,
    required this.notes,
    required this.matchId,
    required this.pacingId,
    this.timeBufferInSeconds = 30,
    this.huddleTimerInSeconds = 30,
    this.createdDate,
    this.modifiedDate,
    this.integrationEntityId,
    this.integrationAdditionalData,
  });

  factory ImprovisationModel.fromEntity(
    ImprovisationEntityData improvisation,
  ) {
    return ImprovisationModel(
      id: improvisation.id,
      createdDate: improvisation.createdDate,
      modifiedDate: improvisation.modifiedDate,
      order: improvisation.order,
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
      matchId: improvisation.match,
      pacingId: improvisation.pacing,
    );
  }

  ImprovisationEntityCompanion toCompanion({int? pacingId, int? matchId}) {
    assert(!(pacingId != null && matchId != null), 'Cannot have both pacingId and matchId');
    return ImprovisationEntityCompanion(
      id: id != null ? Value(id!) : Value.absent(),
      createdDate: Value(createdDate ?? DateTime.now()),
      modifiedDate: Value(modifiedDate ?? DateTime.now()),
      order: Value(order),
      type: Value(type),
      category: Value(category),
      theme: Value(theme),
      durationsInSeconds: Value(durationsInSeconds),
      performers: Value(performers),
      notes: Value(notes),
      timeBufferInSeconds: Value(timeBufferInSeconds),
      huddleTimerInSeconds: Value(huddleTimerInSeconds),
      integrationEntityId: Value(integrationEntityId),
      integrationAdditionalData: Value(integrationAdditionalData),
      match: Value(matchId ?? this.matchId),
      pacing: Value(pacingId ?? this.pacingId),
    );
  }
}
