// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pacings_status.dart';

class PacingsStatusMapper extends EnumMapper<PacingsStatus> {
  PacingsStatusMapper._();

  static PacingsStatusMapper? _instance;
  static PacingsStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PacingsStatusMapper._());
    }
    return _instance!;
  }

  static PacingsStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  PacingsStatus decode(dynamic value) {
    switch (value) {
      case 'initial':
        return PacingsStatus.initial;
      case 'loading':
        return PacingsStatus.loading;
      case 'error':
        return PacingsStatus.error;
      case 'success':
        return PacingsStatus.success;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(PacingsStatus self) {
    switch (self) {
      case PacingsStatus.initial:
        return 'initial';
      case PacingsStatus.loading:
        return 'loading';
      case PacingsStatus.error:
        return 'error';
      case PacingsStatus.success:
        return 'success';
    }
  }
}

extension PacingsStatusMapperExtension on PacingsStatus {
  String toValue() {
    PacingsStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<PacingsStatus>(this) as String;
  }
}
