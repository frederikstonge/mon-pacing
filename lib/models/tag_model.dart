import 'package:dart_mappable/dart_mappable.dart';

import '../repositories/entities/tag_entity.dart';

part 'tag_model.mapper.dart';

@MappableClass()
class TagModel with TagModelMappable {
  final int id;
  final String name;

  const TagModel({required this.id, required this.name});

  factory TagModel.fromEntity({required TagEntity entity}) => TagModel(id: entity.id, name: entity.name);

  TagEntity toEntity() => TagEntity(id: id, name: name);
}
