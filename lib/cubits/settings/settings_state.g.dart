// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsStateImpl _$$SettingsStateImplFromJson(Map<String, dynamic> json) =>
    _$SettingsStateImpl(
      theme: $enumDecode(_$ThemeTypeEnumMap, json['theme']),
      enableDefaultPaddingDuration:
          json['enableDefaultPaddingDuration'] as bool,
      defaultPaddingDuration:
          Duration(microseconds: json['defaultPaddingDuration'] as int),
      language: json['language'] as String,
    );

Map<String, dynamic> _$$SettingsStateImplToJson(_$SettingsStateImpl instance) =>
    <String, dynamic>{
      'theme': _$ThemeTypeEnumMap[instance.theme]!,
      'enableDefaultPaddingDuration': instance.enableDefaultPaddingDuration,
      'defaultPaddingDuration': instance.defaultPaddingDuration.inMicroseconds,
      'language': instance.language,
    };

const _$ThemeTypeEnumMap = {
  ThemeType.light: 'light',
  ThemeType.dark: 'dark',
  ThemeType.lni: 'lni',
};
