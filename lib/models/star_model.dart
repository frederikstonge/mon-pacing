import 'package:dart_mappable/dart_mappable.dart';

import '../repositories/legacy_entities/star_entity.dart';

part 'star_model.mapper.dart';

@MappableClass()
class StarModel with StarModelMappable {
  final int id;
  final int order;
  final int performerId;
  final int teamId;

  const StarModel({required this.id, required this.order, required this.performerId, required this.teamId});

  factory StarModel.fromEntity({required StarEntity entity, required int order}) =>
      StarModel(id: entity.id, order: order, performerId: entity.performerId, teamId: entity.teamId);

  StarEntity toEntity() => StarEntity(id: id, performerId: performerId, teamId: teamId);
}
