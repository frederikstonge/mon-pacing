import '../models/entities/team_entity_model.dart';
import '../models/team_model.dart';

extension TeamExtensions on TeamModel {
  TeamEntityModel toEntity() => TeamEntityModel(
        id: id,
        name: name,
        color: color,
      );
}
