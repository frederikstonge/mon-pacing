import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

import '../repositories/app_database.dart';

part 'star_model.mapper.dart';
part 'star_model.g.dart';

@MappableClass()
@Embedded(ignore: {'copyWith'})
class StarModel with StarModelMappable {
  final int id;
  final int performerId;
  final int teamId;
  final int? matchId;
  final DateTime? createdDate;
  final DateTime? modifiedDate;

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
      performerId: star.performer,
      teamId: star.team,
      matchId: star.match,
    );
  }

  StarEntityData toEntity() {
    return StarEntityData(
      id: id,
      createdDate: createdDate ?? DateTime.now(),
      modifiedDate: modifiedDate ?? DateTime.now(),
      performer: performerId,
      team: teamId,
      match: matchId,
    );
  }
}
