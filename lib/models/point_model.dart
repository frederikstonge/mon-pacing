import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

part 'point_model.mapper.dart';

@MappableClass()
@Embedded(ignore: {'copyWith'})
class PointModel with PointModelMappable {
  final int id;
  final int teamId;
  final int improvisationId;
  final int value;

  const PointModel({
    required this.id,
    required this.teamId,
    required this.improvisationId,
    required this.value,
  });
}
