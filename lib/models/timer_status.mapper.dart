// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'timer_status.dart';

class TimerStatusMapper extends EnumMapper<TimerStatus> {
  TimerStatusMapper._();

  static TimerStatusMapper? _instance;
  static TimerStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TimerStatusMapper._());
    }
    return _instance!;
  }

  static TimerStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TimerStatus decode(dynamic value) {
    switch (value) {
      case r'started':
        return TimerStatus.started;
      case r'paused':
        return TimerStatus.paused;
      case r'stopped':
        return TimerStatus.stopped;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TimerStatus self) {
    switch (self) {
      case TimerStatus.started:
        return r'started';
      case TimerStatus.paused:
        return r'paused';
      case TimerStatus.stopped:
        return r'stopped';
    }
  }
}

extension TimerStatusMapperExtension on TimerStatus {
  String toValue() {
    TimerStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TimerStatus>(this) as String;
  }
}
