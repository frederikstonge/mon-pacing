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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PacingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(List<PacingModel> pacings, bool hasMore) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(List<PacingModel> pacings, bool hasMore)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(List<PacingModel> pacings, bool hasMore)? success,
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

  /// Create a copy of PacingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PacingsInitialStateImplCopyWith<$Res> {
  factory _$$PacingsInitialStateImplCopyWith(_$PacingsInitialStateImpl value,
          $Res Function(_$PacingsInitialStateImpl) then) =
      __$$PacingsInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PacingsInitialStateImplCopyWithImpl<$Res>
    extends _$PacingsStateCopyWithImpl<$Res, _$PacingsInitialStateImpl>
    implements _$$PacingsInitialStateImplCopyWith<$Res> {
  __$$PacingsInitialStateImplCopyWithImpl(_$PacingsInitialStateImpl _value,
      $Res Function(_$PacingsInitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PacingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PacingsInitialStateImpl implements PacingsInitialState {
  const _$PacingsInitialStateImpl();

  @override
  String toString() {
    return 'PacingsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PacingsInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(List<PacingModel> pacings, bool hasMore) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(List<PacingModel> pacings, bool hasMore)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(List<PacingModel> pacings, bool hasMore)? success,
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
  const factory PacingsInitialState() = _$PacingsInitialStateImpl;
}

/// @nodoc
abstract class _$$PacingsErrorStateImplCopyWith<$Res> {
  factory _$$PacingsErrorStateImplCopyWith(_$PacingsErrorStateImpl value,
          $Res Function(_$PacingsErrorStateImpl) then) =
      __$$PacingsErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$PacingsErrorStateImplCopyWithImpl<$Res>
    extends _$PacingsStateCopyWithImpl<$Res, _$PacingsErrorStateImpl>
    implements _$$PacingsErrorStateImplCopyWith<$Res> {
  __$$PacingsErrorStateImplCopyWithImpl(_$PacingsErrorStateImpl _value,
      $Res Function(_$PacingsErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PacingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$PacingsErrorStateImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PacingsErrorStateImpl implements PacingsErrorState {
  const _$PacingsErrorStateImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'PacingsState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PacingsErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of PacingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PacingsErrorStateImplCopyWith<_$PacingsErrorStateImpl> get copyWith =>
      __$$PacingsErrorStateImplCopyWithImpl<_$PacingsErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(List<PacingModel> pacings, bool hasMore) success,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(List<PacingModel> pacings, bool hasMore)? success,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(List<PacingModel> pacings, bool hasMore)? success,
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
  const factory PacingsErrorState(final String error) = _$PacingsErrorStateImpl;

  String get error;

  /// Create a copy of PacingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PacingsErrorStateImplCopyWith<_$PacingsErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PacingsSuccessStateImplCopyWith<$Res> {
  factory _$$PacingsSuccessStateImplCopyWith(_$PacingsSuccessStateImpl value,
          $Res Function(_$PacingsSuccessStateImpl) then) =
      __$$PacingsSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PacingModel> pacings, bool hasMore});
}

/// @nodoc
class __$$PacingsSuccessStateImplCopyWithImpl<$Res>
    extends _$PacingsStateCopyWithImpl<$Res, _$PacingsSuccessStateImpl>
    implements _$$PacingsSuccessStateImplCopyWith<$Res> {
  __$$PacingsSuccessStateImplCopyWithImpl(_$PacingsSuccessStateImpl _value,
      $Res Function(_$PacingsSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PacingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pacings = null,
    Object? hasMore = null,
  }) {
    return _then(_$PacingsSuccessStateImpl(
      null == pacings
          ? _value._pacings
          : pacings // ignore: cast_nullable_to_non_nullable
              as List<PacingModel>,
      null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PacingsSuccessStateImpl implements PacingsSuccessState {
  const _$PacingsSuccessStateImpl(final List<PacingModel> pacings, this.hasMore)
      : _pacings = pacings;

  final List<PacingModel> _pacings;
  @override
  List<PacingModel> get pacings {
    if (_pacings is EqualUnmodifiableListView) return _pacings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pacings);
  }

  @override
  final bool hasMore;

  @override
  String toString() {
    return 'PacingsState.success(pacings: $pacings, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PacingsSuccessStateImpl &&
            const DeepCollectionEquality().equals(other._pacings, _pacings) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_pacings), hasMore);

  /// Create a copy of PacingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PacingsSuccessStateImplCopyWith<_$PacingsSuccessStateImpl> get copyWith =>
      __$$PacingsSuccessStateImplCopyWithImpl<_$PacingsSuccessStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(List<PacingModel> pacings, bool hasMore) success,
  }) {
    return success(pacings, hasMore);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(List<PacingModel> pacings, bool hasMore)? success,
  }) {
    return success?.call(pacings, hasMore);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(List<PacingModel> pacings, bool hasMore)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(pacings, hasMore);
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
          final List<PacingModel> pacings, final bool hasMore) =
      _$PacingsSuccessStateImpl;

  List<PacingModel> get pacings;
  bool get hasMore;

  /// Create a copy of PacingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PacingsSuccessStateImplCopyWith<_$PacingsSuccessStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
