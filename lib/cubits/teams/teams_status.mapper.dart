// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'teams_status.dart';

class TeamsStatusMapper extends EnumMapper<TeamsStatus> {
  TeamsStatusMapper._();

  static TeamsStatusMapper? _instance;
  static TeamsStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TeamsStatusMapper._());
    }
    return _instance!;
  }

  static TeamsStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TeamsStatus decode(dynamic value) {
    switch (value) {
      case r'initial':
        return TeamsStatus.initial;
      case r'loading':
        return TeamsStatus.loading;
      case r'error':
        return TeamsStatus.error;
      case r'success':
        return TeamsStatus.success;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TeamsStatus self) {
    switch (self) {
      case TeamsStatus.initial:
        return r'initial';
      case TeamsStatus.loading:
        return r'loading';
      case TeamsStatus.error:
        return r'error';
      case TeamsStatus.success:
        return r'success';
    }
  }
}

extension TeamsStatusMapperExtension on TeamsStatus {
  String toValue() {
    TeamsStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TeamsStatus>(this) as String;
  }
}
