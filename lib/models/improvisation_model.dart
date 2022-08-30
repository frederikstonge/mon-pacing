import 'package:json_annotation/json_annotation.dart';

import 'improvisation_type.dart';

part 'improvisation_model.g.dart';

@JsonSerializable()
class ImprovisationModel {
  int order;
  ImprovisationType type;
  String? category;
  String? theme;
  Duration duration;
  int? performers;

  ImprovisationModel({
    required this.order,
    required this.type,
    required this.duration,
    this.category,
    this.theme,
    this.performers,
  });

  factory ImprovisationModel.fromJson(Map<String, dynamic> json) => _$ImprovisationModelFromJson(json);

  factory ImprovisationModel.fromCopy(ImprovisationModel model) => ImprovisationModel(
        duration: model.duration,
        order: model.order,
        type: model.type,
        category: model.category,
        performers: model.performers,
        theme: model.theme,
      );

  Map<String, dynamic> toJson() => _$ImprovisationModelToJson(this);
}
