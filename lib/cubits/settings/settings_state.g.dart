// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsStateImpl _$$SettingsStateImplFromJson(Map<String, dynamic> json) =>
    _$SettingsStateImpl(
      themeMode: $enumDecode(_$ThemeModeEnumMap, json['themeMode']),
      enableDefaultPaddingDuration:
          json['enableDefaultPaddingDuration'] as bool,
      defaultPaddingDuration:
          Duration(microseconds: json['defaultPaddingDuration'] as int),
      language: json['language'] as String,
    );

Map<String, dynamic> _$$SettingsStateImplToJson(_$SettingsStateImpl instance) =>
    <String, dynamic>{
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'enableDefaultPaddingDuration': instance.enableDefaultPaddingDuration,
      'defaultPaddingDuration': instance.defaultPaddingDuration.inMicroseconds,
      'language': instance.language,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
