// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pacing_status.dart';

class PacingStatusMapper extends EnumMapper<PacingStatus> {
  PacingStatusMapper._();

  static PacingStatusMapper? _instance;
  static PacingStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PacingStatusMapper._());
    }
    return _instance!;
  }

  static PacingStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  PacingStatus decode(dynamic value) {
    switch (value) {
      case 'initial':
        return PacingStatus.initial;
      case 'loading':
        return PacingStatus.loading;
      case 'error':
        return PacingStatus.error;
      case 'success':
        return PacingStatus.success;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(PacingStatus self) {
    switch (self) {
      case PacingStatus.initial:
        return 'initial';
      case PacingStatus.loading:
        return 'loading';
      case PacingStatus.error:
        return 'error';
      case PacingStatus.success:
        return 'success';
    }
  }
}

extension PacingStatusMapperExtension on PacingStatus {
  String toValue() {
    PacingStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<PacingStatus>(this) as String;
  }
}
