import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

part 'penalty_entity.mapper.dart';
part 'penalty_entity.g.dart';

@MappableClass()
@Embedded(ignore: {'copyWith'})
@Name('PenaltyModel')
class PenaltyEntity with PenaltyEntityMappable {
  final int id;
  final bool major;
  final String type;
  final int? performerId;
  final int teamId;
  final int improvisationId;

  const PenaltyEntity({
    required this.id,
    required this.major,
    required this.type,
    required this.performerId,
    required this.teamId,
    required this.improvisationId,
  });
}
