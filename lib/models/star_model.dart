import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

part 'star_model.mapper.dart';

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
}
