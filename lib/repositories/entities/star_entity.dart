import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

part 'star_entity.mapper.dart';
part 'star_entity.g.dart';

@MappableClass()
@Embedded(ignore: {'copyWith'})
@Name('StarModel')
class StarEntity with StarEntityMappable {
  final int id;
  final int performerId;
  final int teamId;

  const StarEntity({required this.id, required this.performerId, required this.teamId});
}
