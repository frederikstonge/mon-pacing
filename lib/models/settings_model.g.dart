// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingsModel _$$_SettingsModelFromJson(Map<String, dynamic> json) =>
    _$_SettingsModel(
      color: json['color'] as int,
      enableDefaultPaddingDuration:
          json['enableDefaultPaddingDuration'] as bool,
      defaultPaddingDuration:
          Duration(microseconds: json['defaultPaddingDuration'] as int),
      language: json['language'] as String,
    );

Map<String, dynamic> _$$_SettingsModelToJson(_$_SettingsModel instance) =>
    <String, dynamic>{
      'color': instance.color,
      'enableDefaultPaddingDuration': instance.enableDefaultPaddingDuration,
      'defaultPaddingDuration': instance.defaultPaddingDuration.inMicroseconds,
      'language': instance.language,
    };
