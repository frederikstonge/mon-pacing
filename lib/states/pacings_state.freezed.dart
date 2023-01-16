// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pacings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PacingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(List<PacingModel> pacings, bool hasReachedMax)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(List<PacingModel> pacings, bool hasReachedMax)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(List<PacingModel> pacings, bool hasReachedMax)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PacingsInitialState value) initial,
    required TResult Function(PacingsErrorState value) error,
    required TResult Function(PacingsSuccessState value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PacingsInitialState value)? initial,
    TResult? Function(PacingsErrorState value)? error,
    TResult? Function(PacingsSuccessState value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PacingsInitialState value)? initial,
    TResult Function(PacingsErrorState value)? error,
    TResult Function(PacingsSuccessState value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PacingsStateCopyWith<$Res> {
  factory $PacingsStateCopyWith(
          PacingsState value, $Res Function(PacingsState) then) =
      _$PacingsStateCopyWithImpl<$Res, PacingsState>;
}

/// @nodoc
class _$PacingsStateCopyWithImpl<$Res, $Val extends PacingsState>
    implements $PacingsStateCopyWith<$Res> {
  _$PacingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PacingsInitialStateCopyWith<$Res> {
  factory _$$PacingsInitialStateCopyWith(_$PacingsInitialState value,
          $Res Function(_$PacingsInitialState) then) =
      __$$PacingsInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PacingsInitialStateCopyWithImpl<$Res>
    extends _$PacingsStateCopyWithImpl<$Res, _$PacingsInitialState>
    implements _$$PacingsInitialStateCopyWith<$Res> {
  __$$PacingsInitialStateCopyWithImpl(
      _$PacingsInitialState _value, $Res Function(_$PacingsInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PacingsInitialState implements PacingsInitialState {
  const _$PacingsInitialState();

  @override
  String toString() {
    return 'PacingsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PacingsInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(List<PacingModel> pacings, bool hasReachedMax)
        success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(List<PacingModel> pacings, bool hasReachedMax)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(List<PacingModel> pacings, bool hasReachedMax)? success,
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
    required TResult Function(PacingsInitialState value) initial,
    required TResult Function(PacingsErrorState value) error,
    required TResult Function(PacingsSuccessState value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PacingsInitialState value)? initial,
    TResult? Function(PacingsErrorState value)? error,
    TResult? Function(PacingsSuccessState value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PacingsInitialState value)? initial,
    TResult Function(PacingsErrorState value)? error,
    TResult Function(PacingsSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PacingsInitialState implements PacingsState {
  const factory PacingsInitialState() = _$PacingsInitialState;
}

/// @nodoc
abstract class _$$PacingsErrorStateCopyWith<$Res> {
  factory _$$PacingsErrorStateCopyWith(
          _$PacingsErrorState value, $Res Function(_$PacingsErrorState) then) =
      __$$PacingsErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$PacingsErrorStateCopyWithImpl<$Res>
    extends _$PacingsStateCopyWithImpl<$Res, _$PacingsErrorState>
    implements _$$PacingsErrorStateCopyWith<$Res> {
  __$$PacingsErrorStateCopyWithImpl(
      _$PacingsErrorState _value, $Res Function(_$PacingsErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$PacingsErrorState(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PacingsErrorState implements PacingsErrorState {
  const _$PacingsErrorState(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'PacingsState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PacingsErrorState &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PacingsErrorStateCopyWith<_$PacingsErrorState> get copyWith =>
      __$$PacingsErrorStateCopyWithImpl<_$PacingsErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(List<PacingModel> pacings, bool hasReachedMax)
        success,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(List<PacingModel> pacings, bool hasReachedMax)? success,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(List<PacingModel> pacings, bool hasReachedMax)? success,
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
    required TResult Function(PacingsInitialState value) initial,
    required TResult Function(PacingsErrorState value) error,
    required TResult Function(PacingsSuccessState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PacingsInitialState value)? initial,
    TResult? Function(PacingsErrorState value)? error,
    TResult? Function(PacingsSuccessState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PacingsInitialState value)? initial,
    TResult Function(PacingsErrorState value)? error,
    TResult Function(PacingsSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PacingsErrorState implements PacingsState {
  const factory PacingsErrorState(final String error) = _$PacingsErrorState;

  String get error;
  @JsonKey(ignore: true)
  _$$PacingsErrorStateCopyWith<_$PacingsErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PacingsSuccessStateCopyWith<$Res> {
  factory _$$PacingsSuccessStateCopyWith(_$PacingsSuccessState value,
          $Res Function(_$PacingsSuccessState) then) =
      __$$PacingsSuccessStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PacingModel> pacings, bool hasReachedMax});
}

/// @nodoc
class __$$PacingsSuccessStateCopyWithImpl<$Res>
    extends _$PacingsStateCopyWithImpl<$Res, _$PacingsSuccessState>
    implements _$$PacingsSuccessStateCopyWith<$Res> {
  __$$PacingsSuccessStateCopyWithImpl(
      _$PacingsSuccessState _value, $Res Function(_$PacingsSuccessState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pacings = null,
    Object? hasReachedMax = null,
  }) {
    return _then(_$PacingsSuccessState(
      null == pacings
          ? _value._pacings
          : pacings // ignore: cast_nullable_to_non_nullable
              as List<PacingModel>,
      null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PacingsSuccessState implements PacingsSuccessState {
  const _$PacingsSuccessState(
      final List<PacingModel> pacings, this.hasReachedMax)
      : _pacings = pacings;

  final List<PacingModel> _pacings;
  @override
  List<PacingModel> get pacings {
    if (_pacings is EqualUnmodifiableListView) return _pacings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pacings);
  }

  @override
  final bool hasReachedMax;

  @override
  String toString() {
    return 'PacingsState.success(pacings: $pacings, hasReachedMax: $hasReachedMax)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PacingsSuccessState &&
            const DeepCollectionEquality().equals(other._pacings, _pacings) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_pacings), hasReachedMax);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PacingsSuccessStateCopyWith<_$PacingsSuccessState> get copyWith =>
      __$$PacingsSuccessStateCopyWithImpl<_$PacingsSuccessState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(List<PacingModel> pacings, bool hasReachedMax)
        success,
  }) {
    return success(pacings, hasReachedMax);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(List<PacingModel> pacings, bool hasReachedMax)? success,
  }) {
    return success?.call(pacings, hasReachedMax);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(List<PacingModel> pacings, bool hasReachedMax)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(pacings, hasReachedMax);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PacingsInitialState value) initial,
    required TResult Function(PacingsErrorState value) error,
    required TResult Function(PacingsSuccessState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PacingsInitialState value)? initial,
    TResult? Function(PacingsErrorState value)? error,
    TResult? Function(PacingsSuccessState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PacingsInitialState value)? initial,
    TResult Function(PacingsErrorState value)? error,
    TResult Function(PacingsSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class PacingsSuccessState implements PacingsState {
  const factory PacingsSuccessState(
          final List<PacingModel> pacings, final bool hasReachedMax) =
      _$PacingsSuccessState;

  List<PacingModel> get pacings;
  bool get hasReachedMax;
  @JsonKey(ignore: true)
  _$$PacingsSuccessStateCopyWith<_$PacingsSuccessState> get copyWith =>
      throw _privateConstructorUsedError;
}
