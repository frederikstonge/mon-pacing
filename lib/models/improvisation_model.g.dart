// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'improvisation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImprovisationModel _$$_ImprovisationModelFromJson(
        Map<String, dynamic> json) =>
    _$_ImprovisationModel(
      order: json['order'] as int,
      type: $enumDecode(_$ImprovisationTypeEnumMap, json['type']),
      category: json['category'] as String?,
      theme: json['theme'] as String?,
      duration: Duration(microseconds: json['duration'] as int),
      performers: json['performers'] as int?,
    );

Map<String, dynamic> _$$_ImprovisationModelToJson(
        _$_ImprovisationModel instance) =>
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
