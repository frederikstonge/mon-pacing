// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsStateImpl _$$SettingsStateImplFromJson(Map<String, dynamic> json) =>
    _$SettingsStateImpl(
      language: json['language'] as String,
      theme: $enumDecode(_$ThemeTypeEnumMap, json['theme']),
      defaultImprovisationDurationInSeconds:
          json['defaultImprovisationDurationInSeconds'] as int? ?? 150,
      enableDefaultTimeBuffer: json['enableDefaultTimeBuffer'] as bool? ?? true,
      defaultTimeBufferInSeconds:
          json['defaultTimeBufferInSeconds'] as int? ?? 60,
      enableDefaultPenaltiesImpactPoints:
          json['enableDefaultPenaltiesImpactPoints'] as bool? ?? true,
      defaultPenaltiesBehavior: $enumDecodeNullable(
              _$PenaltiesBehaviorEnumMap, json['defaultPenaltiesBehavior']) ??
          PenaltiesBehavior.addPoints,
      defaultPenaltiesRequiredToImpactPoints:
          json['defaultPenaltiesRequiredToImpactPoints'] as int? ?? 3,
    );

Map<String, dynamic> _$$SettingsStateImplToJson(_$SettingsStateImpl instance) =>
    <String, dynamic>{
      'language': instance.language,
      'theme': _$ThemeTypeEnumMap[instance.theme]!,
      'defaultImprovisationDurationInSeconds':
          instance.defaultImprovisationDurationInSeconds,
      'enableDefaultTimeBuffer': instance.enableDefaultTimeBuffer,
      'defaultTimeBufferInSeconds': instance.defaultTimeBufferInSeconds,
      'enableDefaultPenaltiesImpactPoints':
          instance.enableDefaultPenaltiesImpactPoints,
      'defaultPenaltiesBehavior':
          _$PenaltiesBehaviorEnumMap[instance.defaultPenaltiesBehavior]!,
      'defaultPenaltiesRequiredToImpactPoints':
          instance.defaultPenaltiesRequiredToImpactPoints,
    };

const _$ThemeTypeEnumMap = {
  ThemeType.light: 'light',
  ThemeType.dark: 'dark',
  ThemeType.lni: 'lni',
};

const _$PenaltiesBehaviorEnumMap = {
  PenaltiesBehavior.addPoints: 'addPoints',
  PenaltiesBehavior.substractPoints: 'substractPoints',
};
