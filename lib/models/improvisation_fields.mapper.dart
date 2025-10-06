// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'improvisation_fields.dart';

class ImprovisationFieldsMapper extends EnumMapper<ImprovisationFields> {
  ImprovisationFieldsMapper._();

  static ImprovisationFieldsMapper? _instance;
  static ImprovisationFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ImprovisationFieldsMapper._());
    }
    return _instance!;
  }

  static ImprovisationFields fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ImprovisationFields decode(dynamic value) {
    switch (value) {
      case r'type':
        return ImprovisationFields.type;
      case r'category':
        return ImprovisationFields.category;
      case r'theme':
        return ImprovisationFields.theme;
      case r'durations':
        return ImprovisationFields.durations;
      case r'performers':
        return ImprovisationFields.performers;
      case r'notes':
        return ImprovisationFields.notes;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ImprovisationFields self) {
    switch (self) {
      case ImprovisationFields.type:
        return r'type';
      case ImprovisationFields.category:
        return r'category';
      case ImprovisationFields.theme:
        return r'theme';
      case ImprovisationFields.durations:
        return r'durations';
      case ImprovisationFields.performers:
        return r'performers';
      case ImprovisationFields.notes:
        return r'notes';
    }
  }
}

extension ImprovisationFieldsMapperExtension on ImprovisationFields {
  String toValue() {
    ImprovisationFieldsMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ImprovisationFields>(this) as String;
  }
}

