import 'package:json_annotation/json_annotation.dart';

part 'team_model.g.dart';

@JsonSerializable()
class TeamModel {
  String name;
  int color;

  TeamModel({required this.name, required this.color});

  factory TeamModel.fromJson(Map<String, dynamic> json) => _$TeamModelFromJson(json);

  factory TeamModel.fromCopy(TeamModel model) => TeamModel(
        name: model.name,
        color: model.color,
      );

  Map<String, dynamic> toJson() => _$TeamModelToJson(this);
}
