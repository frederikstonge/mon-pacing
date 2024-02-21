// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsStateImpl _$$SettingsStateImplFromJson(Map<String, dynamic> json) =>
    _$SettingsStateImpl(
      theme: $enumDecode(_$ThemeTypeEnumMap, json['theme']),
      enableDefaultTimeBuffer: json['enableDefaultTimeBuffer'] as bool,
      defaultTimeBufferInSeconds: json['defaultTimeBufferInSeconds'] as int,
      language: json['language'] as String,
    );

Map<String, dynamic> _$$SettingsStateImplToJson(_$SettingsStateImpl instance) =>
    <String, dynamic>{
      'theme': _$ThemeTypeEnumMap[instance.theme]!,
      'enableDefaultTimeBuffer': instance.enableDefaultTimeBuffer,
      'defaultTimeBufferInSeconds': instance.defaultTimeBufferInSeconds,
      'language': instance.language,
    };

const _$ThemeTypeEnumMap = {
  ThemeType.light: 'light',
  ThemeType.dark: 'dark',
  ThemeType.lni: 'lni',
};
