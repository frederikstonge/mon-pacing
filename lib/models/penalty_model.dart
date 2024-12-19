import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../repositories/app_database.dart';

part 'penalty_model.mapper.dart';

@MappableClass()
class PenaltyModel with PenaltyModelMappable {
  final int? id;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final bool major;
  final String type;
  final int? performerId;
  final int? teamId;
  final int? improvisationId;
  final int? matchId;

  const PenaltyModel({
    required this.id,
    required this.major,
    required this.type,
    required this.performerId,
    required this.improvisationId,
    required this.teamId,
    required this.matchId,
    this.createdDate,
    this.modifiedDate,
  });

  factory PenaltyModel.fromEntity(
    PenaltyEntityData penalty,
  ) {
    return PenaltyModel(
      id: penalty.id,
      type: penalty.type,
      major: penalty.major,
      performerId: penalty.performer,
      teamId: penalty.team,
      improvisationId: penalty.improvisation,
      matchId: penalty.match,
      modifiedDate: penalty.modifiedDate,
      createdDate: penalty.createdDate,
    );
  }

  PenaltyEntityCompanion toCompanion({int? teamId, int? improvisationId, int? matchId, int? performerId}) {
    return PenaltyEntityCompanion(
      id: id != null ? Value(id!) : Value.absent(),
      createdDate: Value(createdDate ?? DateTime.now()),
      modifiedDate: Value(modifiedDate ?? DateTime.now()),
      type: Value(type),
      major: Value(major),
      performer: Value(performerId ?? this.performerId),
      team: Value(teamId ?? this.teamId!),
      improvisation: Value(improvisationId ?? this.improvisationId!),
      match: Value(matchId ?? this.matchId!),
    );
  }
}
