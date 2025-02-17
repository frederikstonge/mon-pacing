import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../repositories/app_database.dart';

part 'star_model.mapper.dart';

@MappableClass()
class StarModel with StarModelMappable {
  final int? id;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final int? performerId;
  final int? teamId;
  final int? matchId;

  const StarModel({
    required this.id,
    required this.performerId,
    required this.teamId,
    required this.matchId,
    this.createdDate,
    this.modifiedDate,
  });

  factory StarModel.fromEntity(
    StarEntityData star,
  ) {
    return StarModel(
      id: star.id,
      createdDate: star.createdDate,
      modifiedDate: star.modifiedDate,
      performerId: star.performer,
      teamId: star.team,
      matchId: star.match,
    );
  }

  StarEntityCompanion toCompanion({int? teamId, int? matchId, int? performerId}) {
    return StarEntityCompanion(
      id: id != null ? Value(id!) : Value.absent(),
      createdDate: Value(createdDate ?? DateTime.now()),
      modifiedDate: Value(modifiedDate ?? DateTime.now()),
      performer: Value(performerId ?? this.performerId!),
      team: Value(teamId ?? this.teamId!),
      match: Value(matchId ?? this.matchId!),
    );
  }
}
