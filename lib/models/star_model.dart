import 'package:dart_mappable/dart_mappable.dart';

import '../repositories/entities/star_entity.dart';

part 'star_model.mapper.dart';

@MappableClass()
class StarModel with StarModelMappable {
  final int id;
  final int performerId;
  final int teamId;

  const StarModel({required this.id, required this.performerId, required this.teamId});

  factory StarModel.fromEntity({required StarEntity entity}) =>
      StarModel(id: entity.id, performerId: entity.performerId, teamId: entity.teamId);

  StarEntity toEntity(int order) => StarEntity(id: id, order: order, performerId: performerId, teamId: teamId);

  StarModel createNew() => copyWith(id: 0);
}
