// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pacing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PacingModel _$PacingModelFromJson(Map<String, dynamic> json) => PacingModel(
      id: json['id'] as int?,
      name: json['name'] as String,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
    );

Map<String, dynamic> _$PacingModelToJson(PacingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
    };
