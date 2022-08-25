// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'improvisation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImprovisationModel _$ImprovisationModelFromJson(Map<String, dynamic> json) =>
    ImprovisationModel(
      order: json['order'] as int,
      type: $enumDecode(_$ImprovisationTypeEnumMap, json['type']),
      duration: Duration(microseconds: json['duration'] as int),
      category: json['category'] as String?,
      theme: json['theme'] as String?,
      performers: json['performers'] as int?,
    );

Map<String, dynamic> _$ImprovisationModelToJson(ImprovisationModel instance) =>
    <String, dynamic>{
      'order': instance.order,
      'type': _$ImprovisationTypeEnumMap[instance.type]!,
      'category': instance.category,
      'theme': instance.theme,
      'duration': instance.duration.inMicroseconds,
      'performers': instance.performers,
    };

const _$ImprovisationTypeEnumMap = {
  ImprovisationType.mixed: 'mixed',
  ImprovisationType.compared: 'compared',
};
