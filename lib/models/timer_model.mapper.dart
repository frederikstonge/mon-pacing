// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'timer_model.dart';

class TimerModelMapper extends ClassMapperBase<TimerModel> {
  TimerModelMapper._();

  static TimerModelMapper? _instance;
  static TimerModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TimerModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TimerModel';

  static Duration _$duration(TimerModel v) => v.duration;
  static const Field<TimerModel, Duration> _f$duration =
      Field('duration', _$duration);
  static int _$matchId(TimerModel v) => v.matchId;
  static const Field<TimerModel, int> _f$matchId = Field('matchId', _$matchId);
  static int _$improvisationId(TimerModel v) => v.improvisationId;
  static const Field<TimerModel, int> _f$improvisationId =
      Field('improvisationId', _$improvisationId);
  static int _$durationIndex(TimerModel v) => v.durationIndex;
  static const Field<TimerModel, int> _f$durationIndex =
      Field('durationIndex', _$durationIndex);
  static TimerStatus _$status(TimerModel v) => v.status;
  static const Field<TimerModel, TimerStatus> _f$status =
      Field('status', _$status);
  static int _$remainingMilliseconds(TimerModel v) => v.remainingMilliseconds;
  static const Field<TimerModel, int> _f$remainingMilliseconds =
      Field('remainingMilliseconds', _$remainingMilliseconds);
  static bool _$hapticFeedback(TimerModel v) => v.hapticFeedback;
  static const Field<TimerModel, bool> _f$hapticFeedback =
      Field('hapticFeedback', _$hapticFeedback);
  static String _$notificationTitle(TimerModel v) => v.notificationTitle;
  static const Field<TimerModel, String> _f$notificationTitle =
      Field('notificationTitle', _$notificationTitle);

  @override
  final MappableFields<TimerModel> fields = const {
    #duration: _f$duration,
    #matchId: _f$matchId,
    #improvisationId: _f$improvisationId,
    #durationIndex: _f$durationIndex,
    #status: _f$status,
    #remainingMilliseconds: _f$remainingMilliseconds,
    #hapticFeedback: _f$hapticFeedback,
    #notificationTitle: _f$notificationTitle,
  };

  static TimerModel _instantiate(DecodingData data) {
    return TimerModel(
        duration: data.dec(_f$duration),
        matchId: data.dec(_f$matchId),
        improvisationId: data.dec(_f$improvisationId),
        durationIndex: data.dec(_f$durationIndex),
        status: data.dec(_f$status),
        remainingMilliseconds: data.dec(_f$remainingMilliseconds),
        hapticFeedback: data.dec(_f$hapticFeedback),
        notificationTitle: data.dec(_f$notificationTitle));
  }

  @override
  final Function instantiate = _instantiate;

  static TimerModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TimerModel>(map);
  }

  static TimerModel fromJson(String json) {
    return ensureInitialized().decodeJson<TimerModel>(json);
  }
}

mixin TimerModelMappable {
  String toJson() {
    return TimerModelMapper.ensureInitialized()
        .encodeJson<TimerModel>(this as TimerModel);
  }

  Map<String, dynamic> toMap() {
    return TimerModelMapper.ensureInitialized()
        .encodeMap<TimerModel>(this as TimerModel);
  }

  TimerModelCopyWith<TimerModel, TimerModel, TimerModel> get copyWith =>
      _TimerModelCopyWithImpl(this as TimerModel, $identity, $identity);
  @override
  String toString() {
    return TimerModelMapper.ensureInitialized()
        .stringifyValue(this as TimerModel);
  }

  @override
  bool operator ==(Object other) {
    return TimerModelMapper.ensureInitialized()
        .equalsValue(this as TimerModel, other);
  }

  @override
  int get hashCode {
    return TimerModelMapper.ensureInitialized().hashValue(this as TimerModel);
  }
}

extension TimerModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TimerModel, $Out> {
  TimerModelCopyWith<$R, TimerModel, $Out> get $asTimerModel =>
      $base.as((v, t, t2) => _TimerModelCopyWithImpl(v, t, t2));
}

abstract class TimerModelCopyWith<$R, $In extends TimerModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {Duration? duration,
      int? matchId,
      int? improvisationId,
      int? durationIndex,
      TimerStatus? status,
      int? remainingMilliseconds,
      bool? hapticFeedback,
      String? notificationTitle});
  TimerModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TimerModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TimerModel, $Out>
    implements TimerModelCopyWith<$R, TimerModel, $Out> {
  _TimerModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TimerModel> $mapper =
      TimerModelMapper.ensureInitialized();
  @override
  $R call(
          {Duration? duration,
          int? matchId,
          int? improvisationId,
          int? durationIndex,
          TimerStatus? status,
          int? remainingMilliseconds,
          bool? hapticFeedback,
          String? notificationTitle}) =>
      $apply(FieldCopyWithData({
        if (duration != null) #duration: duration,
        if (matchId != null) #matchId: matchId,
        if (improvisationId != null) #improvisationId: improvisationId,
        if (durationIndex != null) #durationIndex: durationIndex,
        if (status != null) #status: status,
        if (remainingMilliseconds != null)
          #remainingMilliseconds: remainingMilliseconds,
        if (hapticFeedback != null) #hapticFeedback: hapticFeedback,
        if (notificationTitle != null) #notificationTitle: notificationTitle
      }));
  @override
  TimerModel $make(CopyWithData data) => TimerModel(
      duration: data.get(#duration, or: $value.duration),
      matchId: data.get(#matchId, or: $value.matchId),
      improvisationId: data.get(#improvisationId, or: $value.improvisationId),
      durationIndex: data.get(#durationIndex, or: $value.durationIndex),
      status: data.get(#status, or: $value.status),
      remainingMilliseconds:
          data.get(#remainingMilliseconds, or: $value.remainingMilliseconds),
      hapticFeedback: data.get(#hapticFeedback, or: $value.hapticFeedback),
      notificationTitle:
          data.get(#notificationTitle, or: $value.notificationTitle));

  @override
  TimerModelCopyWith<$R2, TimerModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TimerModelCopyWithImpl($value, $cast, t);
}
