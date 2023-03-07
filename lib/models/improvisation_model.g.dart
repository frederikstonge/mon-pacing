// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'improvisation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImprovisationModel _$$_ImprovisationModelFromJson(
        Map<String, dynamic> json) =>
    _$_ImprovisationModel(
      id: json['id'] as int,
      order: json['order'] as int,
      type: $enumDecode(_$ImprovisationTypeEnumMap, json['type']),
      category: json['category'] as String,
      theme: json['theme'] as String,
      durations: (json['durations'] as List<dynamic>)
          .map((e) => Duration(microseconds: e as int))
          .toList(),
      performers: json['performers'] as int?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$_ImprovisationModelToJson(
        _$_ImprovisationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'type': _$ImprovisationTypeEnumMap[instance.type]!,
      'category': instance.category,
      'theme': instance.theme,
      'durations': instance.durations.map((e) => e.inMicroseconds).toList(),
      'performers': instance.performers,
      'notes': instance.notes,
    };

const _$ImprovisationTypeEnumMap = {
  ImprovisationType.mixed: 'mixed',
  ImprovisationType.compared: 'compared',
};
