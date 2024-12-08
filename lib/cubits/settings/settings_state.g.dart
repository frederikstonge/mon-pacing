// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsStateImpl _$$SettingsStateImplFromJson(Map<String, dynamic> json) =>
    _$SettingsStateImpl(
      language: json['language'] as String,
      theme: $enumDecode(_$ThemeTypeEnumMap, json['theme']),
      enableWakelock: json['enableWakelock'] as bool? ?? true,
      enableHapticFeedback: json['enableHapticFeedback'] as bool? ?? true,
      enableTimerHapticFeedback:
          json['enableTimerHapticFeedback'] as bool? ?? true,
      defaultNumberOfTeams:
          (json['defaultNumberOfTeams'] as num?)?.toInt() ?? 2,
      defaultImprovisationDurationInSeconds:
          (json['defaultImprovisationDurationInSeconds'] as num?)?.toInt() ??
              150,
      defaultTimeBufferInSeconds:
          (json['defaultTimeBufferInSeconds'] as num?)?.toInt() ?? 30,
      defaultHuddleTimerInSeconds:
          (json['defaultHuddleTimerInSeconds'] as num?)?.toInt() ?? 30,
      defaultEnableStatistics: json['defaultEnableStatistics'] as bool? ?? true,
      enableDefaultPenaltiesImpactPoints:
          json['enableDefaultPenaltiesImpactPoints'] as bool? ?? true,
      defaultPenaltiesImpactType: $enumDecodeNullable(
              _$PenaltiesImpactTypeEnumMap,
              json['defaultPenaltiesImpactType']) ??
          PenaltiesImpactType.addPoints,
      defaultPenaltiesRequiredToImpactPoints:
          (json['defaultPenaltiesRequiredToImpactPoints'] as num?)?.toInt() ??
              3,
      enableDefaultMatchExpulsion:
          json['enableDefaultMatchExpulsion'] as bool? ?? true,
      defaultPenaltiesRequiredToExpel:
          (json['defaultPenaltiesRequiredToExpel'] as num?)?.toInt() ?? 3,
    );

Map<String, dynamic> _$$SettingsStateImplToJson(_$SettingsStateImpl instance) =>
    <String, dynamic>{
      'language': instance.language,
      'theme': _$ThemeTypeEnumMap[instance.theme]!,
      'enableWakelock': instance.enableWakelock,
      'enableHapticFeedback': instance.enableHapticFeedback,
      'enableTimerHapticFeedback': instance.enableTimerHapticFeedback,
      'defaultNumberOfTeams': instance.defaultNumberOfTeams,
      'defaultImprovisationDurationInSeconds':
          instance.defaultImprovisationDurationInSeconds,
      'defaultTimeBufferInSeconds': instance.defaultTimeBufferInSeconds,
      'defaultHuddleTimerInSeconds': instance.defaultHuddleTimerInSeconds,
      'defaultEnableStatistics': instance.defaultEnableStatistics,
      'enableDefaultPenaltiesImpactPoints':
          instance.enableDefaultPenaltiesImpactPoints,
      'defaultPenaltiesImpactType':
          _$PenaltiesImpactTypeEnumMap[instance.defaultPenaltiesImpactType]!,
      'defaultPenaltiesRequiredToImpactPoints':
          instance.defaultPenaltiesRequiredToImpactPoints,
      'enableDefaultMatchExpulsion': instance.enableDefaultMatchExpulsion,
      'defaultPenaltiesRequiredToExpel':
          instance.defaultPenaltiesRequiredToExpel,
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
