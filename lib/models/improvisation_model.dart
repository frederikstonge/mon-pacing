import 'package:json_annotation/json_annotation.dart';

part 'improvisation_model.g.dart';

@JsonSerializable()
class ImprovisationModel {
  int order;
  String name;
  int type;
  String? category;
  String? theme;
  Duration duration;
  int performers;
  int pacingId;

  ImprovisationModel({
    required this.order,
    required this.name,
    required this.type,
    this.category,
    this.theme,
    required this.duration,
    required this.performers,
    required this.pacingId,
  });

  factory ImprovisationModel.fromJson(Map<String, dynamic> json) => _$ImprovisationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImprovisationModelToJson(this);
}
