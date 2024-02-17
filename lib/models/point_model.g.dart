// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PointModelImpl _$$PointModelImplFromJson(Map<String, dynamic> json) =>
    _$PointModelImpl(
      id: json['id'] as int,
      teamId: json['teamId'] as int,
      improvisationId: json['improvisationId'] as int,
      value: json['value'] as int,
    );

Map<String, dynamic> _$$PointModelImplToJson(_$PointModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'teamId': instance.teamId,
      'improvisationId': instance.improvisationId,
      'value': instance.value,
    };
