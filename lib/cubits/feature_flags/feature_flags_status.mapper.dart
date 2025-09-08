// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'feature_flags_status.dart';

class FeatureFlagsStatusMapper extends EnumMapper<FeatureFlagsStatus> {
  FeatureFlagsStatusMapper._();

  static FeatureFlagsStatusMapper? _instance;
  static FeatureFlagsStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FeatureFlagsStatusMapper._());
    }
    return _instance!;
  }

  static FeatureFlagsStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  FeatureFlagsStatus decode(dynamic value) {
    switch (value) {
      case r'initial':
        return FeatureFlagsStatus.initial;
      case r'loading':
        return FeatureFlagsStatus.loading;
      case r'success':
        return FeatureFlagsStatus.success;
      case r'failure':
        return FeatureFlagsStatus.failure;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(FeatureFlagsStatus self) {
    switch (self) {
      case FeatureFlagsStatus.initial:
        return r'initial';
      case FeatureFlagsStatus.loading:
        return r'loading';
      case FeatureFlagsStatus.success:
        return r'success';
      case FeatureFlagsStatus.failure:
        return r'failure';
    }
  }
}

extension FeatureFlagsStatusMapperExtension on FeatureFlagsStatus {
  String toValue() {
    FeatureFlagsStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<FeatureFlagsStatus>(this) as String;
  }
}

