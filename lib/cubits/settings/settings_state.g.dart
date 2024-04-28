// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsStateImpl _$$SettingsStateImplFromJson(Map<String, dynamic> json) =>
    _$SettingsStateImpl(
      language: json['language'] as String,
      theme: $enumDecode(_$ThemeTypeEnumMap, json['theme']),
      enableHapticFeedback: json['enableHapticFeedback'] as bool? ?? true,
      enableTimerHapticFeedback:
          json['enableTimerHapticFeedback'] as bool? ?? true,
      defaultImprovisationDurationInSeconds:
          json['defaultImprovisationDurationInSeconds'] as int? ?? 150,
      defaultTimeBufferInSeconds:
          json['defaultTimeBufferInSeconds'] as int? ?? 30,
      defaultHuddleTimerInSeconds:
          json['defaultHuddleTimerInSeconds'] as int? ?? 30,
      enableDefaultPenaltiesImpactPoints:
          json['enableDefaultPenaltiesImpactPoints'] as bool? ?? true,
      defaultPenaltiesImpactType: $enumDecodeNullable(
              _$PenaltiesImpactTypeEnumMap,
              json['defaultPenaltiesImpactType']) ??
          PenaltiesImpactType.addPoints,
      defaultPenaltiesRequiredToImpactPoints:
          json['defaultPenaltiesRequiredToImpactPoints'] as int? ?? 3,
    );

Map<String, dynamic> _$$SettingsStateImplToJson(_$SettingsStateImpl instance) =>
    <String, dynamic>{
      'language': instance.language,
      'theme': _$ThemeTypeEnumMap[instance.theme]!,
      'enableHapticFeedback': instance.enableHapticFeedback,
      'enableTimerHapticFeedback': instance.enableTimerHapticFeedback,
      'defaultImprovisationDurationInSeconds':
          instance.defaultImprovisationDurationInSeconds,
      'defaultTimeBufferInSeconds': instance.defaultTimeBufferInSeconds,
      'defaultHuddleTimerInSeconds': instance.defaultHuddleTimerInSeconds,
      'enableDefaultPenaltiesImpactPoints':
          instance.enableDefaultPenaltiesImpactPoints,
      'defaultPenaltiesImpactType':
          _$PenaltiesImpactTypeEnumMap[instance.defaultPenaltiesImpactType]!,
      'defaultPenaltiesRequiredToImpactPoints':
          instance.defaultPenaltiesRequiredToImpactPoints,
    };

const _$ThemeTypeEnumMap = {
  ThemeType.light: 'light',
  ThemeType.dark: 'dark',
  ThemeType.lni: 'lni',
};

const _$PenaltiesImpactTypeEnumMap = {
  PenaltiesImpactType.addPoints: 'addPoints',
  PenaltiesImpactType.substractPoints: 'substractPoints',
};
