import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:monpacing/models/penalty_model.dart';

import 'match_improvisation_model.dart';
import 'team_model.dart';
import 'base_model.dart';

part 'match_model.g.dart';

@JsonSerializable()
class MatchModel extends BaseModel {
  List<TeamModel>? teams;
  List<MatchImprovisationModel>? improvisations;
  List<PenaltyModel>? penalties;

  MatchModel({
    int? id,
    String? name,
    DateTime? createdDate,
    DateTime? modifiedDate,
    this.teams,
    this.improvisations,
    this.penalties,
  }) : super(id, name, createdDate, modifiedDate);

  factory MatchModel.fromJson(Map<String, dynamic> json) => _$MatchModelFromJson(json);

  factory MatchModel.fromDatabase(Map<String, dynamic> json) {
    var newValues = Map<String, dynamic>.from(json);
    newValues.update("improvisations", (value) => jsonDecode(value));
    newValues.update("teams", (value) => jsonDecode(value));
    newValues.update("penalties", (value) => jsonDecode(value));
    return MatchModel.fromJson(newValues);
  }

  factory MatchModel.fromCopy(MatchModel model) => MatchModel(
        id: model.id,
        name: model.name,
        createdDate: model.createdDate,
        modifiedDate: model.modifiedDate,
        improvisations: model.improvisations
            ?.map(
              (e) => MatchImprovisationModel.fromCopy(e),
            )
            .toList(),
        teams: model.teams
            ?.map(
              (e) => TeamModel.fromCopy(e),
            )
            .toList(),
        penalties: model.penalties
            ?.map(
              (e) => PenaltyModel.fromCopy(e),
            )
            .toList(),
      );

  Map<String, dynamic> toJson() => _$MatchModelToJson(this);

  Map<String, dynamic> toDatabase() {
    var items = toJson();
    items["improvisations"] = jsonEncode(items["improvisations"]);
    items["teams"] = jsonEncode(items["teams"]);
    items["penalties"] = jsonEncode(items["penalties"]);
    return items;
  }
}
