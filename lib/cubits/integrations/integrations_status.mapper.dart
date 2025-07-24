// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'integrations_status.dart';

class IntegrationsStatusMapper extends EnumMapper<IntegrationsStatus> {
  IntegrationsStatusMapper._();

  static IntegrationsStatusMapper? _instance;
  static IntegrationsStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IntegrationsStatusMapper._());
    }
    return _instance!;
  }

  static IntegrationsStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  IntegrationsStatus decode(dynamic value) {
    switch (value) {
      case r'initial':
        return IntegrationsStatus.initial;
      case r'loading':
        return IntegrationsStatus.loading;
      case r'success':
        return IntegrationsStatus.success;
      case r'failure':
        return IntegrationsStatus.failure;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(IntegrationsStatus self) {
    switch (self) {
      case IntegrationsStatus.initial:
        return r'initial';
      case IntegrationsStatus.loading:
        return r'loading';
      case IntegrationsStatus.success:
        return r'success';
      case IntegrationsStatus.failure:
        return r'failure';
    }
  }
}

extension IntegrationsStatusMapperExtension on IntegrationsStatus {
  String toValue() {
    IntegrationsStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<IntegrationsStatus>(this) as String;
  }
}
