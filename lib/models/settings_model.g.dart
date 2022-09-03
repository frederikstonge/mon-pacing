// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingsModel _$$_SettingsModelFromJson(Map<String, dynamic> json) =>
    _$_SettingsModel(
      color: json['color'] as int,
      enablePaddingDuration: json['enablePaddingDuration'] as bool,
      paddingDuration: Duration(microseconds: json['paddingDuration'] as int),
    );

Map<String, dynamic> _$$_SettingsModelToJson(_$_SettingsModel instance) =>
    <String, dynamic>{
      'color': instance.color,
      'enablePaddingDuration': instance.enablePaddingDuration,
      'paddingDuration': instance.paddingDuration.inMicroseconds,
    };
