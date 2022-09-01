import 'package:json_annotation/json_annotation.dart';
import 'package:monpacing/models/improvisation_model.dart';

import 'improvisation_type.dart';

part 'match_improvisation_model.g.dart';

@JsonSerializable()
class MatchImprovisationModel extends ImprovisationModel {
  int? wonByTeam;

  MatchImprovisationModel({
    required order,
    required type,
    required duration,
    category,
    theme,
    performers,
    this.wonByTeam,
  }) : super(
          duration: duration,
          order: order,
          type: type,
          category: category,
          performers: performers,
          theme: theme,
        );

  factory MatchImprovisationModel.fromJson(Map<String, dynamic> json) => _$MatchImprovisationModelFromJson(json);

  factory MatchImprovisationModel.fromCopy(MatchImprovisationModel model) => MatchImprovisationModel(
        duration: model.duration,
        order: model.order,
        type: model.type,
        category: model.category,
        performers: model.performers,
        theme: model.theme,
        wonByTeam: model.wonByTeam,
      );

  @override
  Map<String, dynamic> toJson() => _$MatchImprovisationModelToJson(this);
}
