import 'package:json_annotation/json_annotation.dart';

import 'base_model.dart';

part 'pacing_model.g.dart';

@JsonSerializable()
class PacingModel extends BaseModel {
  PacingModel({
    required int? id,
    required String name,
    required DateTime? createdDate,
    required DateTime? modifiedDate,
  }) : super(
          id: id,
          name: name,
          createdDate: createdDate,
          modifiedDate: modifiedDate,
        );

  factory PacingModel.fromJson(Map<String, dynamic> json) =>
      _$PacingModelFromJson(json);

  Map<String, dynamic> toJson() => _$PacingModelToJson(this);
}
