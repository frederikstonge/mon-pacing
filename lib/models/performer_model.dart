import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'package:isar/isar.dart';

part 'performer_model.mapper.dart';
part 'performer_model.g.dart';

@MappableClass()
@Embedded(ignore: {'copyWith'})
class PerformerModel with PerformerModelMappable {
  final int id;
  final String name;
  final String? integrationEntityId;
  final String? integrationAdditionalData;

  const PerformerModel({
    required this.id,
    required this.name,
    this.integrationEntityId,
    this.integrationAdditionalData,
  });

  static JsonTypeConverter<PerformerModel, String> converter = TypeConverter.json(
    fromJson: (json) => PerformerModelMapper.fromMap(json as Map<String, Object?>),
    toJson: (pref) => pref.toMap(),
  );
}
