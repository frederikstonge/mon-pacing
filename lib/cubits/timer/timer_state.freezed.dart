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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$TimerStoppedStateCopyWith<$Res> {
  factory _$$TimerStoppedStateCopyWith(
          _$TimerStoppedState value, $Res Function(_$TimerStoppedState) then) =
      __$$TimerStoppedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerStoppedStateCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerStoppedState>
    implements _$$TimerStoppedStateCopyWith<$Res> {
  __$$TimerStoppedStateCopyWithImpl(
      _$TimerStoppedState _value, $Res Function(_$TimerStoppedState) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$TimerStoppedState implements TimerStoppedState {
  const _$TimerStoppedState({final String? $type}) : $type = $type ?? 'stopped';

  factory _$TimerStoppedState.fromJson(Map<String, dynamic> json) =>
      _$$TimerStoppedStateFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TimerState.stopped()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimerStoppedState);
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
    return _$$TimerStoppedStateToJson(
      this,
    );
  }
}

abstract class TimerStoppedState implements TimerState {
  const factory TimerStoppedState() = _$TimerStoppedState;

  factory TimerStoppedState.fromJson(Map<String, dynamic> json) =
      _$TimerStoppedState.fromJson;
}

/// @nodoc
abstract class _$$TimerRunningStateCopyWith<$Res> {
  factory _$$TimerRunningStateCopyWith(
          _$TimerRunningState value, $Res Function(_$TimerRunningState) then) =
      __$$TimerRunningStateCopyWithImpl<$Res>;
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
class __$$TimerRunningStateCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerRunningState>
    implements _$$TimerRunningStateCopyWith<$Res> {
  __$$TimerRunningStateCopyWithImpl(
      _$TimerRunningState _value, $Res Function(_$TimerRunningState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? match = null,
    Object? improvisation = null,
    Object? initialDuration = null,
    Object? elapsedTime = freezed,
  }) {
    return _then(_$TimerRunningState(
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
class _$TimerRunningState implements TimerRunningState {
  const _$TimerRunningState(
      {required this.match,
      required this.improvisation,
      required this.initialDuration,
      this.elapsedTime,
      final String? $type})
      : $type = $type ?? 'running';

  factory _$TimerRunningState.fromJson(Map<String, dynamic> json) =>
      _$$TimerRunningStateFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerRunningState &&
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
  _$$TimerRunningStateCopyWith<_$TimerRunningState> get copyWith =>
      __$$TimerRunningStateCopyWithImpl<_$TimerRunningState>(this, _$identity);

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
    return _$$TimerRunningStateToJson(
      this,
    );
  }
}

abstract class TimerRunningState implements TimerState {
  const factory TimerRunningState(
      {required final MatchModel match,
      required final ImprovisationModel improvisation,
      required final Duration initialDuration,
      final Duration? elapsedTime}) = _$TimerRunningState;

  factory TimerRunningState.fromJson(Map<String, dynamic> json) =
      _$TimerRunningState.fromJson;

  MatchModel get match;
  ImprovisationModel get improvisation;
  Duration get initialDuration;
  Duration? get elapsedTime;
  @JsonKey(ignore: true)
  _$$TimerRunningStateCopyWith<_$TimerRunningState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimerPausedStateCopyWith<$Res> {
  factory _$$TimerPausedStateCopyWith(
          _$TimerPausedState value, $Res Function(_$TimerPausedState) then) =
      __$$TimerPausedStateCopyWithImpl<$Res>;
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
class __$$TimerPausedStateCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerPausedState>
    implements _$$TimerPausedStateCopyWith<$Res> {
  __$$TimerPausedStateCopyWithImpl(
      _$TimerPausedState _value, $Res Function(_$TimerPausedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? match = null,
    Object? improvisation = null,
    Object? initialDuration = null,
    Object? elapsedTime = freezed,
  }) {
    return _then(_$TimerPausedState(
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
class _$TimerPausedState implements TimerPausedState {
  const _$TimerPausedState(
      {required this.match,
      required this.improvisation,
      required this.initialDuration,
      this.elapsedTime,
      final String? $type})
      : $type = $type ?? 'paused';

  factory _$TimerPausedState.fromJson(Map<String, dynamic> json) =>
      _$$TimerPausedStateFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerPausedState &&
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
  _$$TimerPausedStateCopyWith<_$TimerPausedState> get copyWith =>
      __$$TimerPausedStateCopyWithImpl<_$TimerPausedState>(this, _$identity);

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
    return _$$TimerPausedStateToJson(
      this,
    );
  }
}

abstract class TimerPausedState implements TimerState {
  const factory TimerPausedState(
      {required final MatchModel match,
      required final ImprovisationModel improvisation,
      required final Duration initialDuration,
      final Duration? elapsedTime}) = _$TimerPausedState;

  factory TimerPausedState.fromJson(Map<String, dynamic> json) =
      _$TimerPausedState.fromJson;

  MatchModel get match;
  ImprovisationModel get improvisation;
  Duration get initialDuration;
  Duration? get elapsedTime;
  @JsonKey(ignore: true)
  _$$TimerPausedStateCopyWith<_$TimerPausedState> get copyWith =>
      throw _privateConstructorUsedError;
}
