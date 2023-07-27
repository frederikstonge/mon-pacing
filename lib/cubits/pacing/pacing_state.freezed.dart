// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pacing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PacingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(PacingModel pacing) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(PacingModel pacing)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(PacingModel pacing)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PacingInitialState value) initial,
    required TResult Function(PacingErrorState value) error,
    required TResult Function(PacingSuccessState value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PacingInitialState value)? initial,
    TResult? Function(PacingErrorState value)? error,
    TResult? Function(PacingSuccessState value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PacingInitialState value)? initial,
    TResult Function(PacingErrorState value)? error,
    TResult Function(PacingSuccessState value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PacingStateCopyWith<$Res> {
  factory $PacingStateCopyWith(
          PacingState value, $Res Function(PacingState) then) =
      _$PacingStateCopyWithImpl<$Res, PacingState>;
}

/// @nodoc
class _$PacingStateCopyWithImpl<$Res, $Val extends PacingState>
    implements $PacingStateCopyWith<$Res> {
  _$PacingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PacingInitialStateCopyWith<$Res> {
  factory _$$PacingInitialStateCopyWith(_$PacingInitialState value,
          $Res Function(_$PacingInitialState) then) =
      __$$PacingInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PacingInitialStateCopyWithImpl<$Res>
    extends _$PacingStateCopyWithImpl<$Res, _$PacingInitialState>
    implements _$$PacingInitialStateCopyWith<$Res> {
  __$$PacingInitialStateCopyWithImpl(
      _$PacingInitialState _value, $Res Function(_$PacingInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PacingInitialState implements PacingInitialState {
  const _$PacingInitialState();

  @override
  String toString() {
    return 'PacingState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PacingInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(PacingModel pacing) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(PacingModel pacing)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(PacingModel pacing)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PacingInitialState value) initial,
    required TResult Function(PacingErrorState value) error,
    required TResult Function(PacingSuccessState value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PacingInitialState value)? initial,
    TResult? Function(PacingErrorState value)? error,
    TResult? Function(PacingSuccessState value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PacingInitialState value)? initial,
    TResult Function(PacingErrorState value)? error,
    TResult Function(PacingSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PacingInitialState implements PacingState {
  const factory PacingInitialState() = _$PacingInitialState;
}

/// @nodoc
abstract class _$$PacingErrorStateCopyWith<$Res> {
  factory _$$PacingErrorStateCopyWith(
          _$PacingErrorState value, $Res Function(_$PacingErrorState) then) =
      __$$PacingErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$PacingErrorStateCopyWithImpl<$Res>
    extends _$PacingStateCopyWithImpl<$Res, _$PacingErrorState>
    implements _$$PacingErrorStateCopyWith<$Res> {
  __$$PacingErrorStateCopyWithImpl(
      _$PacingErrorState _value, $Res Function(_$PacingErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$PacingErrorState(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PacingErrorState implements PacingErrorState {
  const _$PacingErrorState(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'PacingState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PacingErrorState &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PacingErrorStateCopyWith<_$PacingErrorState> get copyWith =>
      __$$PacingErrorStateCopyWithImpl<_$PacingErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(PacingModel pacing) success,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(PacingModel pacing)? success,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(PacingModel pacing)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PacingInitialState value) initial,
    required TResult Function(PacingErrorState value) error,
    required TResult Function(PacingSuccessState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PacingInitialState value)? initial,
    TResult? Function(PacingErrorState value)? error,
    TResult? Function(PacingSuccessState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PacingInitialState value)? initial,
    TResult Function(PacingErrorState value)? error,
    TResult Function(PacingSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PacingErrorState implements PacingState {
  const factory PacingErrorState(final String error) = _$PacingErrorState;

  String get error;
  @JsonKey(ignore: true)
  _$$PacingErrorStateCopyWith<_$PacingErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PacingSuccessStateCopyWith<$Res> {
  factory _$$PacingSuccessStateCopyWith(_$PacingSuccessState value,
          $Res Function(_$PacingSuccessState) then) =
      __$$PacingSuccessStateCopyWithImpl<$Res>;
  @useResult
  $Res call({PacingModel pacing});

  $PacingModelCopyWith<$Res> get pacing;
}

/// @nodoc
class __$$PacingSuccessStateCopyWithImpl<$Res>
    extends _$PacingStateCopyWithImpl<$Res, _$PacingSuccessState>
    implements _$$PacingSuccessStateCopyWith<$Res> {
  __$$PacingSuccessStateCopyWithImpl(
      _$PacingSuccessState _value, $Res Function(_$PacingSuccessState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pacing = null,
  }) {
    return _then(_$PacingSuccessState(
      null == pacing
          ? _value.pacing
          : pacing // ignore: cast_nullable_to_non_nullable
              as PacingModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PacingModelCopyWith<$Res> get pacing {
    return $PacingModelCopyWith<$Res>(_value.pacing, (value) {
      return _then(_value.copyWith(pacing: value));
    });
  }
}

/// @nodoc

class _$PacingSuccessState implements PacingSuccessState {
  const _$PacingSuccessState(this.pacing);

  @override
  final PacingModel pacing;

  @override
  String toString() {
    return 'PacingState.success(pacing: $pacing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PacingSuccessState &&
            (identical(other.pacing, pacing) || other.pacing == pacing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pacing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PacingSuccessStateCopyWith<_$PacingSuccessState> get copyWith =>
      __$$PacingSuccessStateCopyWithImpl<_$PacingSuccessState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(PacingModel pacing) success,
  }) {
    return success(pacing);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(PacingModel pacing)? success,
  }) {
    return success?.call(pacing);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(PacingModel pacing)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(pacing);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PacingInitialState value) initial,
    required TResult Function(PacingErrorState value) error,
    required TResult Function(PacingSuccessState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PacingInitialState value)? initial,
    TResult? Function(PacingErrorState value)? error,
    TResult? Function(PacingSuccessState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PacingInitialState value)? initial,
    TResult Function(PacingErrorState value)? error,
    TResult Function(PacingSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class PacingSuccessState implements PacingState {
  const factory PacingSuccessState(final PacingModel pacing) =
      _$PacingSuccessState;

  PacingModel get pacing;
  @JsonKey(ignore: true)
  _$$PacingSuccessStateCopyWith<_$PacingSuccessState> get copyWith =>
      throw _privateConstructorUsedError;
}
