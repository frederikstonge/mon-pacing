// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'matches_status.dart';

class MatchesStatusMapper extends EnumMapper<MatchesStatus> {
  MatchesStatusMapper._();

  static MatchesStatusMapper? _instance;
  static MatchesStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MatchesStatusMapper._());
    }
    return _instance!;
  }

  static MatchesStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  MatchesStatus decode(dynamic value) {
    switch (value) {
      case 'initial':
        return MatchesStatus.initial;
      case 'loading':
        return MatchesStatus.loading;
      case 'error':
        return MatchesStatus.error;
      case 'success':
        return MatchesStatus.success;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(MatchesStatus self) {
    switch (self) {
      case MatchesStatus.initial:
        return 'initial';
      case MatchesStatus.loading:
        return 'loading';
      case MatchesStatus.error:
        return 'error';
      case MatchesStatus.success:
        return 'success';
    }
  }
}

extension MatchesStatusMapperExtension on MatchesStatus {
  String toValue() {
    MatchesStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<MatchesStatus>(this) as String;
  }
}
