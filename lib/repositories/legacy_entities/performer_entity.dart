import 'package:dart_mappable/dart_mappable.dart';
import 'package:isar/isar.dart';

part 'performer_entity.mapper.dart';
part 'performer_entity.g.dart';

@MappableClass()
@Embedded(ignore: {'copyWith'})
@Name('PerformerModel')
class PerformerEntity with PerformerEntityMappable {
  final int id;
  final String name;
  final String? integrationEntityId;
  final String? integrationAdditionalData;

  const PerformerEntity({
    required this.id,
    required this.name,
    this.integrationEntityId,
    this.integrationAdditionalData,
  });
}
