// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'improvisation_type.dart';

class ImprovisationTypeMapper extends EnumMapper<ImprovisationType> {
  ImprovisationTypeMapper._();

  static ImprovisationTypeMapper? _instance;
  static ImprovisationTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ImprovisationTypeMapper._());
    }
    return _instance!;
  }

  static ImprovisationType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ImprovisationType decode(dynamic value) {
    switch (value) {
      case 'mixed':
        return ImprovisationType.mixed;
      case 'compared':
        return ImprovisationType.compared;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ImprovisationType self) {
    switch (self) {
      case ImprovisationType.mixed:
        return 'mixed';
      case ImprovisationType.compared:
        return 'compared';
    }
  }
}

extension ImprovisationTypeMapperExtension on ImprovisationType {
  String toValue() {
    ImprovisationTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ImprovisationType>(this) as String;
  }
}
