import 'package:json_annotation/json_annotation.dart';

part 'penalty_model.g.dart';

@JsonSerializable()
class PenaltyModel {
  bool major;
  String? player;
  int teamId;
  int improvisationId;

  PenaltyModel({required this.major, required this.teamId, required this.improvisationId, this.player});

  factory PenaltyModel.fromJson(Map<String, dynamic> json) => _$PenaltyModelFromJson(json);

  factory PenaltyModel.fromCopy(PenaltyModel model) => PenaltyModel(
        major: model.major,
        teamId: model.teamId,
        improvisationId: model.improvisationId,
        player: model.player,
      );

  Map<String, dynamic> toJson() => _$PenaltyModelToJson(this);
}
