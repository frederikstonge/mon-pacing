// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pacing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pacing _$PacingFromJson(Map<String, dynamic> json) => Pacing(
      id: json['id'] as int?,
      name: json['name'] as String,
      createdDate: DateTime.parse(json['createdDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
    );

Map<String, dynamic> _$PacingToJson(Pacing instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdDate': instance.createdDate.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
    };
