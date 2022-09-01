import 'dart:convert';

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
  }) : super(id, name, createdDate, modifiedDate);

  factory PacingModel.fromJson(Map<String, dynamic> json) => _$PacingModelFromJson(json);

  factory PacingModel.fromDatabase(Map<String, dynamic> json) {
    var newValues = Map<String, dynamic>.from(json);
    newValues.update("improvisations", (value) => jsonDecode(value));
    return PacingModel.fromJson(newValues);
  }

  factory PacingModel.fromCopy(PacingModel model) => PacingModel(
        id: model.id,
        name: model.name,
        createdDate: model.createdDate,
        modifiedDate: model.modifiedDate,
        improvisations: model.improvisations
            ?.map(
              (e) => ImprovisationModel.fromCopy(e),
            )
            .toList(),
      );

  Map<String, dynamic> toJson() => _$PacingModelToJson(this);

  Map<String, dynamic> toDatabase() {
    var items = toJson();
    items["improvisations"] = jsonEncode(items["improvisations"]);
    return items;
  }
}
