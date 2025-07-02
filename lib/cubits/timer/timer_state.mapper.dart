// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'timer_state.dart';

class TimerStateMapper extends ClassMapperBase<TimerState> {
  TimerStateMapper._();

  static TimerStateMapper? _instance;
  static TimerStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TimerStateMapper._());
      TimerModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TimerState';

  static TimerModel? _$timer(TimerState v) => v.timer;
  static const Field<TimerState, TimerModel> _f$timer =
      Field('timer', _$timer, opt: true);

  @override
  final MappableFields<TimerState> fields = const {
    #timer: _f$timer,
  };

  static TimerState _instantiate(DecodingData data) {
    return TimerState(timer: data.dec(_f$timer));
  }

  @override
  final Function instantiate = _instantiate;

  static TimerState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TimerState>(map);
  }

  static TimerState fromJson(String json) {
    return ensureInitialized().decodeJson<TimerState>(json);
  }
}

mixin TimerStateMappable {
  String toJson() {
    return TimerStateMapper.ensureInitialized()
        .encodeJson<TimerState>(this as TimerState);
  }

  Map<String, dynamic> toMap() {
    return TimerStateMapper.ensureInitialized()
        .encodeMap<TimerState>(this as TimerState);
  }

  TimerStateCopyWith<TimerState, TimerState, TimerState> get copyWith =>
      _TimerStateCopyWithImpl<TimerState, TimerState>(
          this as TimerState, $identity, $identity);
  @override
  String toString() {
    return TimerStateMapper.ensureInitialized()
        .stringifyValue(this as TimerState);
  }

  @override
  bool operator ==(Object other) {
    return TimerStateMapper.ensureInitialized()
        .equalsValue(this as TimerState, other);
  }

  @override
  int get hashCode {
    return TimerStateMapper.ensureInitialized().hashValue(this as TimerState);
  }
}

extension TimerStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TimerState, $Out> {
  TimerStateCopyWith<$R, TimerState, $Out> get $asTimerState =>
      $base.as((v, t, t2) => _TimerStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TimerStateCopyWith<$R, $In extends TimerState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  TimerModelCopyWith<$R, TimerModel, TimerModel>? get timer;
  $R call({TimerModel? timer});
  TimerStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TimerStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TimerState, $Out>
    implements TimerStateCopyWith<$R, TimerState, $Out> {
  _TimerStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TimerState> $mapper =
      TimerStateMapper.ensureInitialized();
  @override
  TimerModelCopyWith<$R, TimerModel, TimerModel>? get timer =>
      $value.timer?.copyWith.$chain((v) => call(timer: v));
  @override
  $R call({Object? timer = $none}) =>
      $apply(FieldCopyWithData({if (timer != $none) #timer: timer}));
  @override
  TimerState $make(CopyWithData data) =>
      TimerState(timer: data.get(#timer, or: $value.timer));

  @override
  TimerStateCopyWith<$R2, TimerState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TimerStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
