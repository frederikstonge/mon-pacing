// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'theme_type.dart';

class ThemeTypeMapper extends EnumMapper<ThemeType> {
  ThemeTypeMapper._();

  static ThemeTypeMapper? _instance;
  static ThemeTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ThemeTypeMapper._());
    }
    return _instance!;
  }

  static ThemeType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ThemeType decode(dynamic value) {
    switch (value) {
      case r'light':
        return ThemeType.light;
      case r'dark':
        return ThemeType.dark;
      case r'lni':
        return ThemeType.lni;
      case r'ligma':
        return ThemeType.ligma;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ThemeType self) {
    switch (self) {
      case ThemeType.light:
        return r'light';
      case ThemeType.dark:
        return r'dark';
      case ThemeType.lni:
        return r'lni';
      case ThemeType.ligma:
        return r'ligma';
    }
  }
}

extension ThemeTypeMapperExtension on ThemeType {
  String toValue() {
    ThemeTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ThemeType>(this) as String;
  }
}
