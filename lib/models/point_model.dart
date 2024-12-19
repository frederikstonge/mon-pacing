import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'package:isar/isar.dart';

part 'point_model.mapper.dart';
part 'point_model.g.dart';

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

  static JsonTypeConverter<PointModel, String> converter = TypeConverter.json(
    fromJson: (json) => PointModelMapper.fromMap(json as Map<String, Object?>),
    toJson: (pref) => pref.toMap(),
  );
}
