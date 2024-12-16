// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
      case 'initial':
        return FeatureFlagsStatus.initial;
      case 'loading':
        return FeatureFlagsStatus.loading;
      case 'success':
        return FeatureFlagsStatus.success;
      case 'failure':
        return FeatureFlagsStatus.failure;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(FeatureFlagsStatus self) {
    switch (self) {
      case FeatureFlagsStatus.initial:
        return 'initial';
      case FeatureFlagsStatus.loading:
        return 'loading';
      case FeatureFlagsStatus.success:
        return 'success';
      case FeatureFlagsStatus.failure:
        return 'failure';
    }
  }
}

extension FeatureFlagsStatusMapperExtension on FeatureFlagsStatus {
  String toValue() {
    FeatureFlagsStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<FeatureFlagsStatus>(this) as String;
  }
}
