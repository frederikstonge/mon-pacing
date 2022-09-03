// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_improvisation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MatchImprovisationModel _$$_MatchImprovisationModelFromJson(
        Map<String, dynamic> json) =>
    _$_MatchImprovisationModel(
      order: json['order'] as int,
      type: $enumDecode(_$ImprovisationTypeEnumMap, json['type']),
      category: json['category'] as String?,
      theme: json['theme'] as String?,
      duration: Duration(microseconds: json['duration'] as int),
      performers: json['performers'] as int?,
      wonByTeam: json['wonByTeam'] as int?,
    );

Map<String, dynamic> _$$_MatchImprovisationModelToJson(
        _$_MatchImprovisationModel instance) =>
    <String, dynamic>{
      'order': instance.order,
      'type': _$ImprovisationTypeEnumMap[instance.type]!,
      'category': instance.category,
      'theme': instance.theme,
      'duration': instance.duration.inMicroseconds,
      'performers': instance.performers,
      'wonByTeam': instance.wonByTeam,
    };

const _$ImprovisationTypeEnumMap = {
  ImprovisationType.mixed: 'mixed',
  ImprovisationType.compared: 'compared',
};
