// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matches_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MatchesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(List<MatchModel> matches, bool hasReachedMax)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(List<MatchModel> matches, bool hasReachedMax)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(List<MatchModel> matches, bool hasReachedMax)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchesInitialState value) initial,
    required TResult Function(MatchesErrorState value) error,
    required TResult Function(MatchesSuccessState value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchesInitialState value)? initial,
    TResult? Function(MatchesErrorState value)? error,
    TResult? Function(MatchesSuccessState value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchesInitialState value)? initial,
    TResult Function(MatchesErrorState value)? error,
    TResult Function(MatchesSuccessState value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchesStateCopyWith<$Res> {
  factory $MatchesStateCopyWith(
          MatchesState value, $Res Function(MatchesState) then) =
      _$MatchesStateCopyWithImpl<$Res, MatchesState>;
}

/// @nodoc
class _$MatchesStateCopyWithImpl<$Res, $Val extends MatchesState>
    implements $MatchesStateCopyWith<$Res> {
  _$MatchesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MatchesInitialStateCopyWith<$Res> {
  factory _$$MatchesInitialStateCopyWith(_$MatchesInitialState value,
          $Res Function(_$MatchesInitialState) then) =
      __$$MatchesInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MatchesInitialStateCopyWithImpl<$Res>
    extends _$MatchesStateCopyWithImpl<$Res, _$MatchesInitialState>
    implements _$$MatchesInitialStateCopyWith<$Res> {
  __$$MatchesInitialStateCopyWithImpl(
      _$MatchesInitialState _value, $Res Function(_$MatchesInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MatchesInitialState implements MatchesInitialState {
  const _$MatchesInitialState();

  @override
  String toString() {
    return 'MatchesState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MatchesInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(List<MatchModel> matches, bool hasReachedMax)
        success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(List<MatchModel> matches, bool hasReachedMax)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(List<MatchModel> matches, bool hasReachedMax)? success,
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
    required TResult Function(MatchesInitialState value) initial,
    required TResult Function(MatchesErrorState value) error,
    required TResult Function(MatchesSuccessState value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchesInitialState value)? initial,
    TResult? Function(MatchesErrorState value)? error,
    TResult? Function(MatchesSuccessState value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchesInitialState value)? initial,
    TResult Function(MatchesErrorState value)? error,
    TResult Function(MatchesSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MatchesInitialState implements MatchesState {
  const factory MatchesInitialState() = _$MatchesInitialState;
}

/// @nodoc
abstract class _$$MatchesErrorStateCopyWith<$Res> {
  factory _$$MatchesErrorStateCopyWith(
          _$MatchesErrorState value, $Res Function(_$MatchesErrorState) then) =
      __$$MatchesErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$MatchesErrorStateCopyWithImpl<$Res>
    extends _$MatchesStateCopyWithImpl<$Res, _$MatchesErrorState>
    implements _$$MatchesErrorStateCopyWith<$Res> {
  __$$MatchesErrorStateCopyWithImpl(
      _$MatchesErrorState _value, $Res Function(_$MatchesErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$MatchesErrorState(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MatchesErrorState implements MatchesErrorState {
  const _$MatchesErrorState(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'MatchesState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchesErrorState &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchesErrorStateCopyWith<_$MatchesErrorState> get copyWith =>
      __$$MatchesErrorStateCopyWithImpl<_$MatchesErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(List<MatchModel> matches, bool hasReachedMax)
        success,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(List<MatchModel> matches, bool hasReachedMax)? success,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(List<MatchModel> matches, bool hasReachedMax)? success,
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
    required TResult Function(MatchesInitialState value) initial,
    required TResult Function(MatchesErrorState value) error,
    required TResult Function(MatchesSuccessState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchesInitialState value)? initial,
    TResult? Function(MatchesErrorState value)? error,
    TResult? Function(MatchesSuccessState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchesInitialState value)? initial,
    TResult Function(MatchesErrorState value)? error,
    TResult Function(MatchesSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MatchesErrorState implements MatchesState {
  const factory MatchesErrorState(final String error) = _$MatchesErrorState;

  String get error;
  @JsonKey(ignore: true)
  _$$MatchesErrorStateCopyWith<_$MatchesErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MatchesSuccessStateCopyWith<$Res> {
  factory _$$MatchesSuccessStateCopyWith(_$MatchesSuccessState value,
          $Res Function(_$MatchesSuccessState) then) =
      __$$MatchesSuccessStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MatchModel> matches, bool hasReachedMax});
}

/// @nodoc
class __$$MatchesSuccessStateCopyWithImpl<$Res>
    extends _$MatchesStateCopyWithImpl<$Res, _$MatchesSuccessState>
    implements _$$MatchesSuccessStateCopyWith<$Res> {
  __$$MatchesSuccessStateCopyWithImpl(
      _$MatchesSuccessState _value, $Res Function(_$MatchesSuccessState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matches = null,
    Object? hasReachedMax = null,
  }) {
    return _then(_$MatchesSuccessState(
      null == matches
          ? _value._matches
          : matches // ignore: cast_nullable_to_non_nullable
              as List<MatchModel>,
      null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MatchesSuccessState implements MatchesSuccessState {
  const _$MatchesSuccessState(
      final List<MatchModel> matches, this.hasReachedMax)
      : _matches = matches;

  final List<MatchModel> _matches;
  @override
  List<MatchModel> get matches {
    if (_matches is EqualUnmodifiableListView) return _matches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matches);
  }

  @override
  final bool hasReachedMax;

  @override
  String toString() {
    return 'MatchesState.success(matches: $matches, hasReachedMax: $hasReachedMax)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchesSuccessState &&
            const DeepCollectionEquality().equals(other._matches, _matches) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_matches), hasReachedMax);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchesSuccessStateCopyWith<_$MatchesSuccessState> get copyWith =>
      __$$MatchesSuccessStateCopyWithImpl<_$MatchesSuccessState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(List<MatchModel> matches, bool hasReachedMax)
        success,
  }) {
    return success(matches, hasReachedMax);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(List<MatchModel> matches, bool hasReachedMax)? success,
  }) {
    return success?.call(matches, hasReachedMax);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(List<MatchModel> matches, bool hasReachedMax)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(matches, hasReachedMax);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchesInitialState value) initial,
    required TResult Function(MatchesErrorState value) error,
    required TResult Function(MatchesSuccessState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchesInitialState value)? initial,
    TResult? Function(MatchesErrorState value)? error,
    TResult? Function(MatchesSuccessState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchesInitialState value)? initial,
    TResult Function(MatchesErrorState value)? error,
    TResult Function(MatchesSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class MatchesSuccessState implements MatchesState {
  const factory MatchesSuccessState(
          final List<MatchModel> matches, final bool hasReachedMax) =
      _$MatchesSuccessState;

  List<MatchModel> get matches;
  bool get hasReachedMax;
  @JsonKey(ignore: true)
  _$$MatchesSuccessStateCopyWith<_$MatchesSuccessState> get copyWith =>
      throw _privateConstructorUsedError;
}
