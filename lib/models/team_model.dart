import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import 'entities/team_entity_model.dart';

part 'team_model.freezed.dart';
part 'team_model.g.dart';

@freezed
@Embedded(ignore: {'copyWith'})
class TeamModel with _$TeamModel {
  const factory TeamModel({
    required int id,
    required String name,
    required int color,
  }) = _TeamModel;

  factory TeamModel.fromJson(Map<String, dynamic> json) => _$TeamModelFromJson(json);

  factory TeamModel.fromEntity(TeamEntityModel model) => TeamModel(
        id: model.id,
        name: model.name,
        color: model.color,
      );
}
