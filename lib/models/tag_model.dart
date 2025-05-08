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

class TagMapper extends SimpleMapper<TagModel> {
  const TagMapper();

  @override
  TagModel decode(dynamic value) {
    return TagModel(id: 0, name: value.toString());
  }

  @override
  dynamic encode(TagModel self) {
    return self.name;
  }
}
