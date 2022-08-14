// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'improvisation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImprovisationModel _$ImprovisationModelFromJson(Map<String, dynamic> json) =>
    ImprovisationModel(
      id: json['id'] as int?,
      name: json['name'] as String,
      type: json['type'] as int,
      category: json['category'] as String?,
      theme: json['theme'] as String?,
      duration: Duration(microseconds: json['duration'] as int),
      performers: json['performers'] as int,
      pacingId: json['pacingId'] as int,
    );

Map<String, dynamic> _$ImprovisationModelToJson(ImprovisationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'category': instance.category,
      'theme': instance.theme,
      'duration': instance.duration.inMicroseconds,
      'performers': instance.performers,
      'pacingId': instance.pacingId,
    };
