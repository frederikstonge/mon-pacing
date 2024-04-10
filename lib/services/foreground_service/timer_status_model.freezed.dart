// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimerStatusModel _$TimerStatusModelFromJson(Map<String, dynamic> json) {
  return _TimerStatusModel.fromJson(json);
}

/// @nodoc
mixin _$TimerStatusModel {
  Duration get duration => throw _privateConstructorUsedError;
  int get matchId => throw _privateConstructorUsedError;
  int get improvisationId => throw _privateConstructorUsedError;
  int get durationIndex => throw _privateConstructorUsedError;
  TimerStatus get status => throw _privateConstructorUsedError;
  int get remainingMilliseconds => throw _privateConstructorUsedError;
  bool get hapticFeedback => throw _privateConstructorUsedError;
  String get notificationTitle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimerStatusModelCopyWith<TimerStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStatusModelCopyWith<$Res> {
  factory $TimerStatusModelCopyWith(
          TimerStatusModel value, $Res Function(TimerStatusModel) then) =
      _$TimerStatusModelCopyWithImpl<$Res, TimerStatusModel>;
  @useResult
  $Res call(
      {Duration duration,
      int matchId,
      int improvisationId,
      int durationIndex,
      TimerStatus status,
      int remainingMilliseconds,
      bool hapticFeedback,
      String notificationTitle});
}

/// @nodoc
class _$TimerStatusModelCopyWithImpl<$Res, $Val extends TimerStatusModel>
    implements $TimerStatusModelCopyWith<$Res> {
  _$TimerStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? matchId = null,
    Object? improvisationId = null,
    Object? durationIndex = null,
    Object? status = null,
    Object? remainingMilliseconds = null,
    Object? hapticFeedback = null,
    Object? notificationTitle = null,
  }) {
    return _then(_value.copyWith(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as int,
      improvisationId: null == improvisationId
          ? _value.improvisationId
          : improvisationId // ignore: cast_nullable_to_non_nullable
              as int,
      durationIndex: null == durationIndex
          ? _value.durationIndex
          : durationIndex // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TimerStatus,
      remainingMilliseconds: null == remainingMilliseconds
          ? _value.remainingMilliseconds
          : remainingMilliseconds // ignore: cast_nullable_to_non_nullable
              as int,
      hapticFeedback: null == hapticFeedback
          ? _value.hapticFeedback
          : hapticFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationTitle: null == notificationTitle
          ? _value.notificationTitle
          : notificationTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimerStatusModelImplCopyWith<$Res>
    implements $TimerStatusModelCopyWith<$Res> {
  factory _$$TimerStatusModelImplCopyWith(_$TimerStatusModelImpl value,
          $Res Function(_$TimerStatusModelImpl) then) =
      __$$TimerStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Duration duration,
      int matchId,
      int improvisationId,
      int durationIndex,
      TimerStatus status,
      int remainingMilliseconds,
      bool hapticFeedback,
      String notificationTitle});
}

/// @nodoc
class __$$TimerStatusModelImplCopyWithImpl<$Res>
    extends _$TimerStatusModelCopyWithImpl<$Res, _$TimerStatusModelImpl>
    implements _$$TimerStatusModelImplCopyWith<$Res> {
  __$$TimerStatusModelImplCopyWithImpl(_$TimerStatusModelImpl _value,
      $Res Function(_$TimerStatusModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? matchId = null,
    Object? improvisationId = null,
    Object? durationIndex = null,
    Object? status = null,
    Object? remainingMilliseconds = null,
    Object? hapticFeedback = null,
    Object? notificationTitle = null,
  }) {
    return _then(_$TimerStatusModelImpl(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as int,
      improvisationId: null == improvisationId
          ? _value.improvisationId
          : improvisationId // ignore: cast_nullable_to_non_nullable
              as int,
      durationIndex: null == durationIndex
          ? _value.durationIndex
          : durationIndex // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TimerStatus,
      remainingMilliseconds: null == remainingMilliseconds
          ? _value.remainingMilliseconds
          : remainingMilliseconds // ignore: cast_nullable_to_non_nullable
              as int,
      hapticFeedback: null == hapticFeedback
          ? _value.hapticFeedback
          : hapticFeedback // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationTitle: null == notificationTitle
          ? _value.notificationTitle
          : notificationTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimerStatusModelImpl implements _TimerStatusModel {
  const _$TimerStatusModelImpl(
      {required this.duration,
      required this.matchId,
      required this.improvisationId,
      required this.durationIndex,
      required this.status,
      required this.remainingMilliseconds,
      required this.hapticFeedback,
      required this.notificationTitle});

  factory _$TimerStatusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimerStatusModelImplFromJson(json);

  @override
  final Duration duration;
  @override
  final int matchId;
  @override
  final int improvisationId;
  @override
  final int durationIndex;
  @override
  final TimerStatus status;
  @override
  final int remainingMilliseconds;
  @override
  final bool hapticFeedback;
  @override
  final String notificationTitle;

  @override
  String toString() {
    return 'TimerStatusModel(duration: $duration, matchId: $matchId, improvisationId: $improvisationId, durationIndex: $durationIndex, status: $status, remainingMilliseconds: $remainingMilliseconds, hapticFeedback: $hapticFeedback, notificationTitle: $notificationTitle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerStatusModelImpl &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.matchId, matchId) || other.matchId == matchId) &&
            (identical(other.improvisationId, improvisationId) ||
                other.improvisationId == improvisationId) &&
            (identical(other.durationIndex, durationIndex) ||
                other.durationIndex == durationIndex) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.remainingMilliseconds, remainingMilliseconds) ||
                other.remainingMilliseconds == remainingMilliseconds) &&
            (identical(other.hapticFeedback, hapticFeedback) ||
                other.hapticFeedback == hapticFeedback) &&
            (identical(other.notificationTitle, notificationTitle) ||
                other.notificationTitle == notificationTitle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      duration,
      matchId,
      improvisationId,
      durationIndex,
      status,
      remainingMilliseconds,
      hapticFeedback,
      notificationTitle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerStatusModelImplCopyWith<_$TimerStatusModelImpl> get copyWith =>
      __$$TimerStatusModelImplCopyWithImpl<_$TimerStatusModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimerStatusModelImplToJson(
      this,
    );
  }
}

abstract class _TimerStatusModel implements TimerStatusModel {
  const factory _TimerStatusModel(
      {required final Duration duration,
      required final int matchId,
      required final int improvisationId,
      required final int durationIndex,
      required final TimerStatus status,
      required final int remainingMilliseconds,
      required final bool hapticFeedback,
      required final String notificationTitle}) = _$TimerStatusModelImpl;

  factory _TimerStatusModel.fromJson(Map<String, dynamic> json) =
      _$TimerStatusModelImpl.fromJson;

  @override
  Duration get duration;
  @override
  int get matchId;
  @override
  int get improvisationId;
  @override
  int get durationIndex;
  @override
  TimerStatus get status;
  @override
  int get remainingMilliseconds;
  @override
  bool get hapticFeedback;
  @override
  String get notificationTitle;
  @override
  @JsonKey(ignore: true)
  _$$TimerStatusModelImplCopyWith<_$TimerStatusModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
