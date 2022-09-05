// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penalty_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PenaltyModel _$$_PenaltyModelFromJson(Map<String, dynamic> json) =>
    _$_PenaltyModel(
      major: json['major'] as bool,
      player: json['player'] as String,
      teamId: json['teamId'] as int,
      improvisationId: json['improvisationId'] as int,
    );

Map<String, dynamic> _$$_PenaltyModelToJson(_$_PenaltyModel instance) =>
    <String, dynamic>{
      'major': instance.major,
      'player': instance.player,
      'teamId': instance.teamId,
      'improvisationId': instance.improvisationId,
    };
