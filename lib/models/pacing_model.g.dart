// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pacing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PacingModelImpl _$$PacingModelImplFromJson(Map<String, dynamic> json) =>
    _$PacingModelImpl(
      id: json['id'] as int?,
      name: json['name'] as String,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      enablePaddingDuration: json['enablePaddingDuration'] as bool,
      paddingDuration: Duration(microseconds: json['paddingDuration'] as int),
      defaultNumberOfTeams: json['defaultNumberOfTeams'] as int,
      improvisations: (json['improvisations'] as List<dynamic>)
          .map((e) => ImprovisationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PacingModelImplToJson(_$PacingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'enablePaddingDuration': instance.enablePaddingDuration,
      'paddingDuration': instance.paddingDuration.inMicroseconds,
      'defaultNumberOfTeams': instance.defaultNumberOfTeams,
      'improvisations': instance.improvisations,
    };
