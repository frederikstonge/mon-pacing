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
  return _TimerState.fromJson(json);
}

/// @nodoc
mixin _$TimerState {
  TimerModel? get timerStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimerStateCopyWith<TimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res, TimerState>;
  @useResult
  $Res call({TimerModel? timerStatus});

  $TimerModelCopyWith<$Res>? get timerStatus;
}

/// @nodoc
class _$TimerStateCopyWithImpl<$Res, $Val extends TimerState>
    implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timerStatus = freezed,
  }) {
    return _then(_value.copyWith(
      timerStatus: freezed == timerStatus
          ? _value.timerStatus
          : timerStatus // ignore: cast_nullable_to_non_nullable
              as TimerModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TimerModelCopyWith<$Res>? get timerStatus {
    if (_value.timerStatus == null) {
      return null;
    }

    return $TimerModelCopyWith<$Res>(_value.timerStatus!, (value) {
      return _then(_value.copyWith(timerStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TimerStateImplCopyWith<$Res>
    implements $TimerStateCopyWith<$Res> {
  factory _$$TimerStateImplCopyWith(
          _$TimerStateImpl value, $Res Function(_$TimerStateImpl) then) =
      __$$TimerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TimerModel? timerStatus});

  @override
  $TimerModelCopyWith<$Res>? get timerStatus;
}

/// @nodoc
class __$$TimerStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerStateImpl>
    implements _$$TimerStateImplCopyWith<$Res> {
  __$$TimerStateImplCopyWithImpl(
      _$TimerStateImpl _value, $Res Function(_$TimerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timerStatus = freezed,
  }) {
    return _then(_$TimerStateImpl(
      timerStatus: freezed == timerStatus
          ? _value.timerStatus
          : timerStatus // ignore: cast_nullable_to_non_nullable
              as TimerModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimerStateImpl implements _TimerState {
  const _$TimerStateImpl({this.timerStatus});

  factory _$TimerStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimerStateImplFromJson(json);

  @override
  final TimerModel? timerStatus;

  @override
  String toString() {
    return 'TimerState(timerStatus: $timerStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerStateImpl &&
            (identical(other.timerStatus, timerStatus) ||
                other.timerStatus == timerStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, timerStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerStateImplCopyWith<_$TimerStateImpl> get copyWith =>
      __$$TimerStateImplCopyWithImpl<_$TimerStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimerStateImplToJson(
      this,
    );
  }
}

abstract class _TimerState implements TimerState {
  const factory _TimerState({final TimerModel? timerStatus}) = _$TimerStateImpl;

  factory _TimerState.fromJson(Map<String, dynamic> json) =
      _$TimerStateImpl.fromJson;

  @override
  TimerModel? get timerStatus;
  @override
  @JsonKey(ignore: true)
  _$$TimerStateImplCopyWith<_$TimerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
