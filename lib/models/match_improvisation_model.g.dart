// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_improvisation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchImprovisationModel _$MatchImprovisationModelFromJson(
        Map<String, dynamic> json) =>
    MatchImprovisationModel(
      order: json['order'],
      type: json['type'],
      duration: json['duration'],
      category: json['category'],
      theme: json['theme'],
      performers: json['performers'],
      wonByTeam: json['wonByTeam'] as int?,
    );

Map<String, dynamic> _$MatchImprovisationModelToJson(
        MatchImprovisationModel instance) =>
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
