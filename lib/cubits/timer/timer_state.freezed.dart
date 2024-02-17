// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimerState _$TimerStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'stopped':
      return TimerStoppedState.fromJson(json);
    case 'running':
      return TimerRunningState.fromJson(json);
    case 'paused':
      return TimerPausedState.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'TimerState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$TimerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() stopped,
    required TResult Function(
            MatchModel match,
            ImprovisationModel improvisation,
            Duration initialDuration,
            Duration? elapsedTime)
        running,
    required TResult Function(
            MatchModel match,
            ImprovisationModel improvisation,
            Duration initialDuration,
            Duration? elapsedTime)
        paused,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? stopped,
    TResult? Function(MatchModel match, ImprovisationModel improvisation,
            Duration initialDuration, Duration? elapsedTime)?
        running,
    TResult? Function(MatchModel match, ImprovisationModel improvisation,
            Duration initialDuration, Duration? elapsedTime)?
        paused,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? stopped,
    TResult Function(MatchModel match, ImprovisationModel improvisation,
            Duration initialDuration, Duration? elapsedTime)?
        running,
    TResult Function(MatchModel match, ImprovisationModel improvisation,
            Duration initialDuration, Duration? elapsedTime)?
        paused,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerStoppedState value) stopped,
    required TResult Function(TimerRunningState value) running,
    required TResult Function(TimerPausedState value) paused,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimerStoppedState value)? stopped,
    TResult? Function(TimerRunningState value)? running,
    TResult? Function(TimerPausedState value)? paused,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerStoppedState value)? stopped,
    TResult Function(TimerRunningState value)? running,
    TResult Function(TimerPausedState value)? paused,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res, TimerState>;
}

/// @nodoc
class _$TimerStateCopyWithImpl<$Res, $Val extends TimerState>
    implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TimerStoppedStateImplCopyWith<$Res> {
  factory _$$TimerStoppedStateImplCopyWith(_$TimerStoppedStateImpl value,
          $Res Function(_$TimerStoppedStateImpl) then) =
      __$$TimerStoppedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerStoppedStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerStoppedStateImpl>
    implements _$$TimerStoppedStateImplCopyWith<$Res> {
  __$$TimerStoppedStateImplCopyWithImpl(_$TimerStoppedStateImpl _value,
      $Res Function(_$TimerStoppedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$TimerStoppedStateImpl implements TimerStoppedState {
  const _$TimerStoppedStateImpl({final String? $type})
      : $type = $type ?? 'stopped';

  factory _$TimerStoppedStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimerStoppedStateImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TimerState.stopped()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimerStoppedStateImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() stopped,
    required TResult Function(
            MatchModel match,
            ImprovisationModel improvisation,
            Duration initialDuration,
            Duration? elapsedTime)
        running,
    required TResult Function(
            MatchModel match,
            ImprovisationModel improvisation,
            Duration initialDuration,
            Duration? elapsedTime)
        paused,
  }) {
    return stopped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? stopped,
    TResult? Function(MatchModel match, ImprovisationModel improvisation,
            Duration initialDuration, Duration? elapsedTime)?
        running,
    TResult? Function(MatchModel match, ImprovisationModel improvisation,
            Duration initialDuration, Duration? elapsedTime)?
        paused,
  }) {
    return stopped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? stopped,
    TResult Function(MatchModel match, ImprovisationModel improvisation,
            Duration initialDuration, Duration? elapsedTime)?
        running,
    TResult Function(MatchModel match, ImprovisationModel improvisation,
            Duration initialDuration, Duration? elapsedTime)?
        paused,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerStoppedState value) stopped,
    required TResult Function(TimerRunningState value) running,
    required TResult Function(TimerPausedState value) paused,
  }) {
    return stopped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimerStoppedState value)? stopped,
    TResult? Function(TimerRunningState value)? running,
    TResult? Function(TimerPausedState value)? paused,
  }) {
    return stopped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerStoppedState value)? stopped,
    TResult Function(TimerRunningState value)? running,
    TResult Function(TimerPausedState value)? paused,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TimerStoppedStateImplToJson(
      this,
    );
  }
}

abstract class TimerStoppedState implements TimerState {
  const factory TimerStoppedState() = _$TimerStoppedStateImpl;

  factory TimerStoppedState.fromJson(Map<String, dynamic> json) =
      _$TimerStoppedStateImpl.fromJson;
}

/// @nodoc
abstract class _$$TimerRunningStateImplCopyWith<$Res> {
  factory _$$TimerRunningStateImplCopyWith(_$TimerRunningStateImpl value,
          $Res Function(_$TimerRunningStateImpl) then) =
      __$$TimerRunningStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {MatchModel match,
      ImprovisationModel improvisation,
      Duration initialDuration,
      Duration? elapsedTime});

  $MatchModelCopyWith<$Res> get match;
  $ImprovisationModelCopyWith<$Res> get improvisation;
}

/// @nodoc
class __$$TimerRunningStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerRunningStateImpl>
    implements _$$TimerRunningStateImplCopyWith<$Res> {
  __$$TimerRunningStateImplCopyWithImpl(_$TimerRunningStateImpl _value,
      $Res Function(_$TimerRunningStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? match = null,
    Object? improvisation = null,
    Object? initialDuration = null,
    Object? elapsedTime = freezed,
  }) {
    return _then(_$TimerRunningStateImpl(
      match: null == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as MatchModel,
      improvisation: null == improvisation
          ? _value.improvisation
          : improvisation // ignore: cast_nullable_to_non_nullable
              as ImprovisationModel,
      initialDuration: null == initialDuration
          ? _value.initialDuration
          : initialDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      elapsedTime: freezed == elapsedTime
          ? _value.elapsedTime
          : elapsedTime // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MatchModelCopyWith<$Res> get match {
    return $MatchModelCopyWith<$Res>(_value.match, (value) {
      return _then(_value.copyWith(match: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImprovisationModelCopyWith<$Res> get improvisation {
    return $ImprovisationModelCopyWith<$Res>(_value.improvisation, (value) {
      return _then(_value.copyWith(improvisation: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$TimerRunningStateImpl implements TimerRunningState {
  const _$TimerRunningStateImpl(
      {required this.match,
      required this.improvisation,
      required this.initialDuration,
      this.elapsedTime,
      final String? $type})
      : $type = $type ?? 'running';

  factory _$TimerRunningStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimerRunningStateImplFromJson(json);

  @override
  final MatchModel match;
  @override
  final ImprovisationModel improvisation;
  @override
  final Duration initialDuration;
  @override
  final Duration? elapsedTime;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TimerState.running(match: $match, improvisation: $improvisation, initialDuration: $initialDuration, elapsedTime: $elapsedTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerRunningStateImpl &&
            (identical(other.match, match) || other.match == match) &&
            (identical(other.improvisation, improvisation) ||
                other.improvisation == improvisation) &&
            (identical(other.initialDuration, initialDuration) ||
                other.initialDuration == initialDuration) &&
            (identical(other.elapsedTime, elapsedTime) ||
                other.elapsedTime == elapsedTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, match, improvisation, initialDuration, elapsedTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerRunningStateImplCopyWith<_$TimerRunningStateImpl> get copyWith =>
      __$$TimerRunningStateImplCopyWithImpl<_$TimerRunningStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() stopped,
    required TResult Function(
            MatchModel match,
            ImprovisationModel improvisation,
            Duration initialDuration,
            Duration? elapsedTime)
        running,
    required TResult Function(
            MatchModel match,
            ImprovisationModel improvisation,
            Duration initialDuration,
            Duration? elapsedTime)
        paused,
  }) {
    return running(match, improvisation, initialDuration, elapsedTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? stopped,
    TResult? Function(MatchModel match, ImprovisationModel improvisation,
            Duration initialDuration, Duration? elapsedTime)?
        running,
    TResult? Function(MatchModel match, ImprovisationModel improvisation,
            Duration initialDuration, Duration? elapsedTime)?
        paused,
  }) {
    return running?.call(match, improvisation, initialDuration, elapsedTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? stopped,
    TResult Function(MatchModel match, ImprovisationModel improvisation,
            Duration initialDuration, Duration? elapsedTime)?
        running,
    TResult Function(MatchModel match, ImprovisationModel improvisation,
            Duration initialDuration, Duration? elapsedTime)?
        paused,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(match, improvisation, initialDuration, elapsedTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerStoppedState value) stopped,
    required TResult Function(TimerRunningState value) running,
    required TResult Function(TimerPausedState value) paused,
  }) {
    return running(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimerStoppedState value)? stopped,
    TResult? Function(TimerRunningState value)? running,
    TResult? Function(TimerPausedState value)? paused,
  }) {
    return running?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerStoppedState value)? stopped,
    TResult Function(TimerRunningState value)? running,
    TResult Function(TimerPausedState value)? paused,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TimerRunningStateImplToJson(
      this,
    );
  }
}

abstract class TimerRunningState implements TimerState {
  const factory TimerRunningState(
      {required final MatchModel match,
      required final ImprovisationModel improvisation,
      required final Duration initialDuration,
      final Duration? elapsedTime}) = _$TimerRunningStateImpl;

  factory TimerRunningState.fromJson(Map<String, dynamic> json) =
      _$TimerRunningStateImpl.fromJson;

  MatchModel get match;
  ImprovisationModel get improvisation;
  Duration get initialDuration;
  Duration? get elapsedTime;
  @JsonKey(ignore: true)
  _$$TimerRunningStateImplCopyWith<_$TimerRunningStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimerPausedStateImplCopyWith<$Res> {
  factory _$$TimerPausedStateImplCopyWith(_$TimerPausedStateImpl value,
          $Res Function(_$TimerPausedStateImpl) then) =
      __$$TimerPausedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {MatchModel match,
      ImprovisationModel improvisation,
      Duration initialDuration,
      Duration? elapsedTime});

  $MatchModelCopyWith<$Res> get match;
  $ImprovisationModelCopyWith<$Res> get improvisation;
}

/// @nodoc
class __$$TimerPausedStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerPausedStateImpl>
    implements _$$TimerPausedStateImplCopyWith<$Res> {
  __$$TimerPausedStateImplCopyWithImpl(_$TimerPausedStateImpl _value,
      $Res Function(_$TimerPausedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? match = null,
    Object? improvisation = null,
    Object? initialDuration = null,
    Object? elapsedTime = freezed,
  }) {
    return _then(_$TimerPausedStateImpl(
      match: null == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as MatchModel,
      improvisation: null == improvisation
          ? _value.improvisation
          : improvisation // ignore: cast_nullable_to_non_nullable
              as ImprovisationModel,
      initialDuration: null == initialDuration
          ? _value.initialDuration
          : initialDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      elapsedTime: freezed == elapsedTime
          ? _value.elapsedTime
          : elapsedTime // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MatchModelCopyWith<$Res> get match {
    return $MatchModelCopyWith<$Res>(_value.match, (value) {
      return _then(_value.copyWith(match: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImprovisationModelCopyWith<$Res> get improvisation {
    return $ImprovisationModelCopyWith<$Res>(_value.improvisation, (value) {
      return _then(_value.copyWith(improvisation: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$TimerPausedStateImpl implements TimerPausedState {
  const _$TimerPausedStateImpl(
      {required this.match,
      required this.improvisation,
      required this.initialDuration,
      this.elapsedTime,
      final String? $type})
      : $type = $type ?? 'paused';

  factory _$TimerPausedStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimerPausedStateImplFromJson(json);

  @override
  final MatchModel match;
  @override
  final ImprovisationModel improvisation;
  @override
  final Duration initialDuration;
  @override
  final Duration? elapsedTime;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TimerState.paused(match: $match, improvisation: $improvisation, initialDuration: $initialDuration, elapsedTime: $elapsedTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerPausedStateImpl &&
            (identical(other.match, match) || other.match == match) &&
            (identical(other.improvisation, improvisation) ||
                other.improvisation == improvisation) &&
            (identical(other.initialDuration, initialDuration) ||
                other.initialDuration == initialDuration) &&
            (identical(other.elapsedTime, elapsedTime) ||
                other.elapsedTime == elapsedTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, match, improvisation, initialDuration, elapsedTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerPausedStateImplCopyWith<_$TimerPausedStateImpl> get copyWith =>
      __$$TimerPausedStateImplCopyWithImpl<_$TimerPausedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() stopped,
    required TResult Function(
            MatchModel match,
            ImprovisationModel improvisation,
            Duration initialDuration,
            Duration? elapsedTime)
        running,
    required TResult Function(
            MatchModel match,
            ImprovisationModel improvisation,
            Duration initialDuration,
            Duration? elapsedTime)
        paused,
  }) {
    return paused(match, improvisation, initialDuration, elapsedTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? stopped,
    TResult? Function(MatchModel match, ImprovisationModel improvisation,
            Duration initialDuration, Duration? elapsedTime)?
        running,
    TResult? Function(MatchModel match, ImprovisationModel improvisation,
            Duration initialDuration, Duration? elapsedTime)?
        paused,
  }) {
    return paused?.call(match, improvisation, initialDuration, elapsedTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? stopped,
    TResult Function(MatchModel match, ImprovisationModel improvisation,
            Duration initialDuration, Duration? elapsedTime)?
        running,
    TResult Function(MatchModel match, ImprovisationModel improvisation,
            Duration initialDuration, Duration? elapsedTime)?
        paused,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(match, improvisation, initialDuration, elapsedTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerStoppedState value) stopped,
    required TResult Function(TimerRunningState value) running,
    required TResult Function(TimerPausedState value) paused,
  }) {
    return paused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimerStoppedState value)? stopped,
    TResult? Function(TimerRunningState value)? running,
    TResult? Function(TimerPausedState value)? paused,
  }) {
    return paused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerStoppedState value)? stopped,
    TResult Function(TimerRunningState value)? running,
    TResult Function(TimerPausedState value)? paused,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TimerPausedStateImplToJson(
      this,
    );
  }
}

abstract class TimerPausedState implements TimerState {
  const factory TimerPausedState(
      {required final MatchModel match,
      required final ImprovisationModel improvisation,
      required final Duration initialDuration,
      final Duration? elapsedTime}) = _$TimerPausedStateImpl;

  factory TimerPausedState.fromJson(Map<String, dynamic> json) =
      _$TimerPausedStateImpl.fromJson;

  MatchModel get match;
  ImprovisationModel get improvisation;
  Duration get initialDuration;
  Duration? get elapsedTime;
  @JsonKey(ignore: true)
  _$$TimerPausedStateImplCopyWith<_$TimerPausedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
