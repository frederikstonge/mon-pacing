// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'improvisations_status.dart';

class ImprovisationsStatusMapper extends EnumMapper<ImprovisationsStatus> {
  ImprovisationsStatusMapper._();

  static ImprovisationsStatusMapper? _instance;
  static ImprovisationsStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ImprovisationsStatusMapper._());
    }
    return _instance!;
  }

  static ImprovisationsStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ImprovisationsStatus decode(dynamic value) {
    switch (value) {
      case r'initial':
        return ImprovisationsStatus.initial;
      case r'loading':
        return ImprovisationsStatus.loading;
      case r'error':
        return ImprovisationsStatus.error;
      case r'success':
        return ImprovisationsStatus.success;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ImprovisationsStatus self) {
    switch (self) {
      case ImprovisationsStatus.initial:
        return r'initial';
      case ImprovisationsStatus.loading:
        return r'loading';
      case ImprovisationsStatus.error:
        return r'error';
      case ImprovisationsStatus.success:
        return r'success';
    }
  }
}

extension ImprovisationsStatusMapperExtension on ImprovisationsStatus {
  String toValue() {
    ImprovisationsStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ImprovisationsStatus>(this)
        as String;
  }
}

