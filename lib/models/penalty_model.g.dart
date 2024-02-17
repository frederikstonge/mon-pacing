// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penalty_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PenaltyModelImpl _$$PenaltyModelImplFromJson(Map<String, dynamic> json) =>
    _$PenaltyModelImpl(
      id: json['id'] as int,
      major: json['major'] as bool,
      player: json['player'] as String,
      teamId: json['teamId'] as int,
      improvisationId: json['improvisationId'] as int,
    );

Map<String, dynamic> _$$PenaltyModelImplToJson(_$PenaltyModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'major': instance.major,
      'player': instance.player,
      'teamId': instance.teamId,
      'improvisationId': instance.improvisationId,
    };
