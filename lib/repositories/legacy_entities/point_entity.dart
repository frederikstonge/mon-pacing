import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

part 'point_entity.mapper.dart';
part 'point_entity.g.dart';

@MappableClass()
@Embedded(ignore: {'copyWith'})
@Name('PointModel')
class PointEntity with PointEntityMappable {
  final int id;
  final int teamId;
  final int improvisationId;
  final int value;

  const PointEntity({required this.id, required this.teamId, required this.improvisationId, required this.value});
}
