// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MatchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(MatchModel match) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(MatchModel match)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(MatchModel match)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchInitialState value) initial,
    required TResult Function(MatchErrorState value) error,
    required TResult Function(MatchSuccessState value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchInitialState value)? initial,
    TResult? Function(MatchErrorState value)? error,
    TResult? Function(MatchSuccessState value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchInitialState value)? initial,
    TResult Function(MatchErrorState value)? error,
    TResult Function(MatchSuccessState value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchStateCopyWith<$Res> {
  factory $MatchStateCopyWith(
          MatchState value, $Res Function(MatchState) then) =
      _$MatchStateCopyWithImpl<$Res, MatchState>;
}

/// @nodoc
class _$MatchStateCopyWithImpl<$Res, $Val extends MatchState>
    implements $MatchStateCopyWith<$Res> {
  _$MatchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MatchInitialStateCopyWith<$Res> {
  factory _$$MatchInitialStateCopyWith(
          _$MatchInitialState value, $Res Function(_$MatchInitialState) then) =
      __$$MatchInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MatchInitialStateCopyWithImpl<$Res>
    extends _$MatchStateCopyWithImpl<$Res, _$MatchInitialState>
    implements _$$MatchInitialStateCopyWith<$Res> {
  __$$MatchInitialStateCopyWithImpl(
      _$MatchInitialState _value, $Res Function(_$MatchInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MatchInitialState implements MatchInitialState {
  const _$MatchInitialState();

  @override
  String toString() {
    return 'MatchState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MatchInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(MatchModel match) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(MatchModel match)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(MatchModel match)? success,
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
    required TResult Function(MatchInitialState value) initial,
    required TResult Function(MatchErrorState value) error,
    required TResult Function(MatchSuccessState value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchInitialState value)? initial,
    TResult? Function(MatchErrorState value)? error,
    TResult? Function(MatchSuccessState value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchInitialState value)? initial,
    TResult Function(MatchErrorState value)? error,
    TResult Function(MatchSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MatchInitialState implements MatchState {
  const factory MatchInitialState() = _$MatchInitialState;
}

/// @nodoc
abstract class _$$MatchErrorStateCopyWith<$Res> {
  factory _$$MatchErrorStateCopyWith(
          _$MatchErrorState value, $Res Function(_$MatchErrorState) then) =
      __$$MatchErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$MatchErrorStateCopyWithImpl<$Res>
    extends _$MatchStateCopyWithImpl<$Res, _$MatchErrorState>
    implements _$$MatchErrorStateCopyWith<$Res> {
  __$$MatchErrorStateCopyWithImpl(
      _$MatchErrorState _value, $Res Function(_$MatchErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$MatchErrorState(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MatchErrorState implements MatchErrorState {
  const _$MatchErrorState(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'MatchState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchErrorState &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchErrorStateCopyWith<_$MatchErrorState> get copyWith =>
      __$$MatchErrorStateCopyWithImpl<_$MatchErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(MatchModel match) success,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(MatchModel match)? success,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(MatchModel match)? success,
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
    required TResult Function(MatchInitialState value) initial,
    required TResult Function(MatchErrorState value) error,
    required TResult Function(MatchSuccessState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchInitialState value)? initial,
    TResult? Function(MatchErrorState value)? error,
    TResult? Function(MatchSuccessState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchInitialState value)? initial,
    TResult Function(MatchErrorState value)? error,
    TResult Function(MatchSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MatchErrorState implements MatchState {
  const factory MatchErrorState(final String error) = _$MatchErrorState;

  String get error;
  @JsonKey(ignore: true)
  _$$MatchErrorStateCopyWith<_$MatchErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MatchSuccessStateCopyWith<$Res> {
  factory _$$MatchSuccessStateCopyWith(
          _$MatchSuccessState value, $Res Function(_$MatchSuccessState) then) =
      __$$MatchSuccessStateCopyWithImpl<$Res>;
  @useResult
  $Res call({MatchModel match});

  $MatchModelCopyWith<$Res> get match;
}

/// @nodoc
class __$$MatchSuccessStateCopyWithImpl<$Res>
    extends _$MatchStateCopyWithImpl<$Res, _$MatchSuccessState>
    implements _$$MatchSuccessStateCopyWith<$Res> {
  __$$MatchSuccessStateCopyWithImpl(
      _$MatchSuccessState _value, $Res Function(_$MatchSuccessState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? match = null,
  }) {
    return _then(_$MatchSuccessState(
      null == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as MatchModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MatchModelCopyWith<$Res> get match {
    return $MatchModelCopyWith<$Res>(_value.match, (value) {
      return _then(_value.copyWith(match: value));
    });
  }
}

/// @nodoc

class _$MatchSuccessState implements MatchSuccessState {
  const _$MatchSuccessState(this.match);

  @override
  final MatchModel match;

  @override
  String toString() {
    return 'MatchState.success(match: $match)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchSuccessState &&
            (identical(other.match, match) || other.match == match));
  }

  @override
  int get hashCode => Object.hash(runtimeType, match);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchSuccessStateCopyWith<_$MatchSuccessState> get copyWith =>
      __$$MatchSuccessStateCopyWithImpl<_$MatchSuccessState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(MatchModel match) success,
  }) {
    return success(match);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(MatchModel match)? success,
  }) {
    return success?.call(match);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(MatchModel match)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(match);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchInitialState value) initial,
    required TResult Function(MatchErrorState value) error,
    required TResult Function(MatchSuccessState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchInitialState value)? initial,
    TResult? Function(MatchErrorState value)? error,
    TResult? Function(MatchSuccessState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchInitialState value)? initial,
    TResult Function(MatchErrorState value)? error,
    TResult Function(MatchSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class MatchSuccessState implements MatchState {
  const factory MatchSuccessState(final MatchModel match) = _$MatchSuccessState;

  MatchModel get match;
  @JsonKey(ignore: true)
  _$$MatchSuccessStateCopyWith<_$MatchSuccessState> get copyWith =>
      throw _privateConstructorUsedError;
}
