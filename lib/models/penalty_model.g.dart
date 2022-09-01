// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penalty_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PenaltyModel _$PenaltyModelFromJson(Map<String, dynamic> json) => PenaltyModel(
      major: json['major'] as bool,
      teamId: json['teamId'] as int,
      improvisationId: json['improvisationId'] as int,
      player: json['player'] as String?,
    );

Map<String, dynamic> _$PenaltyModelToJson(PenaltyModel instance) =>
    <String, dynamic>{
      'major': instance.major,
      'player': instance.player,
      'teamId': instance.teamId,
      'improvisationId': instance.improvisationId,
    };
