import 'package:json_annotation/json_annotation.dart';

import 'base_model.dart';
import 'improvisation_model.dart';

part 'pacing_model.g.dart';

@JsonSerializable()
class PacingModel extends BaseModel {
  List<ImprovisationModel>? improvisations;
  PacingModel({
    int? id,
    String? name,
    DateTime? createdDate,
    DateTime? modifiedDate,
    this.improvisations,
  }) : super(
          id: id,
          name: name,
          createdDate: createdDate,
          modifiedDate: modifiedDate,
        );

  factory PacingModel.fromJson(Map<String, dynamic> json) => _$PacingModelFromJson(json);

  Map<String, dynamic> toJson() => _$PacingModelToJson(this);
}
