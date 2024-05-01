import '../models/entities/point_entity_model.dart';
import '../models/point_model.dart';

extension PointExtensions on PointModel {
  PointEntityModel toEntity() => PointEntityModel(
        id: id,
        teamId: teamId,
        improvisationId: improvisationId,
        value: value,
      );
}
