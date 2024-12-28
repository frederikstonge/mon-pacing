// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'match_status.dart';

class MatchStatusMapper extends EnumMapper<MatchStatus> {
  MatchStatusMapper._();

  static MatchStatusMapper? _instance;
  static MatchStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MatchStatusMapper._());
    }
    return _instance!;
  }

  static MatchStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  MatchStatus decode(dynamic value) {
    switch (value) {
      case 'initial':
        return MatchStatus.initial;
      case 'loading':
        return MatchStatus.loading;
      case 'error':
        return MatchStatus.error;
      case 'success':
        return MatchStatus.success;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(MatchStatus self) {
    switch (self) {
      case MatchStatus.initial:
        return 'initial';
      case MatchStatus.loading:
        return 'loading';
      case MatchStatus.error:
        return 'error';
      case MatchStatus.success:
        return 'success';
    }
  }
}

extension MatchStatusMapperExtension on MatchStatus {
  String toValue() {
    MatchStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<MatchStatus>(this) as String;
  }
}