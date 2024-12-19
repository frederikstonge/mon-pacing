import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'package:isar/isar.dart';

part 'star_model.mapper.dart';
part 'star_model.g.dart';

@MappableClass()
@Embedded(ignore: {'copyWith'})
class StarModel with StarModelMappable {
  final int id;
  final int performerId;
  final int teamId;

  const StarModel({
    required this.id,
    required this.performerId,
    required this.teamId,
  });

  static JsonTypeConverter<StarModel, String> converter = TypeConverter.json(
    fromJson: (json) => StarModelMapper.fromMap(json as Map<String, Object?>),
    toJson: (pref) => pref.toMap(),
  );
}
