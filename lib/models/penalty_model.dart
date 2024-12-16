import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

part 'penalty_model.mapper.dart';
part 'penalty_model.g.dart';

@MappableClass()
@Embedded(ignore: {'copyWith'})
class PenaltyModel with PenaltyModelMappable {
  final int id;
  final bool major;
  final String type;
  final int? performerId;
  final int teamId;
  final int improvisationId;

  const PenaltyModel({
    required this.id,
    required this.major,
    required this.type,
    required this.performerId,
    required this.teamId,
    required this.improvisationId,
  });
}
