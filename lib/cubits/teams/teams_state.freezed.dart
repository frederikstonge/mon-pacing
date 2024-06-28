// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teams_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TeamsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(List<TeamModel> teams, bool hasMore) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(List<TeamModel> teams, bool hasMore)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(List<TeamModel> teams, bool hasMore)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TeamsInitialState value) initial,
    required TResult Function(TeamsErrorState value) error,
    required TResult Function(TeamsSuccessState value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TeamsInitialState value)? initial,
    TResult? Function(TeamsErrorState value)? error,
    TResult? Function(TeamsSuccessState value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TeamsInitialState value)? initial,
    TResult Function(TeamsErrorState value)? error,
    TResult Function(TeamsSuccessState value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamsStateCopyWith<$Res> {
  factory $TeamsStateCopyWith(
          TeamsState value, $Res Function(TeamsState) then) =
      _$TeamsStateCopyWithImpl<$Res, TeamsState>;
}

/// @nodoc
class _$TeamsStateCopyWithImpl<$Res, $Val extends TeamsState>
    implements $TeamsStateCopyWith<$Res> {
  _$TeamsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TeamsInitialStateImplCopyWith<$Res> {
  factory _$$TeamsInitialStateImplCopyWith(_$TeamsInitialStateImpl value,
          $Res Function(_$TeamsInitialStateImpl) then) =
      __$$TeamsInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TeamsInitialStateImplCopyWithImpl<$Res>
    extends _$TeamsStateCopyWithImpl<$Res, _$TeamsInitialStateImpl>
    implements _$$TeamsInitialStateImplCopyWith<$Res> {
  __$$TeamsInitialStateImplCopyWithImpl(_$TeamsInitialStateImpl _value,
      $Res Function(_$TeamsInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TeamsInitialStateImpl implements TeamsInitialState {
  const _$TeamsInitialStateImpl();

  @override
  String toString() {
    return 'TeamsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TeamsInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(List<TeamModel> teams, bool hasMore) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(List<TeamModel> teams, bool hasMore)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(List<TeamModel> teams, bool hasMore)? success,
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
    required TResult Function(TeamsInitialState value) initial,
    required TResult Function(TeamsErrorState value) error,
    required TResult Function(TeamsSuccessState value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TeamsInitialState value)? initial,
    TResult? Function(TeamsErrorState value)? error,
    TResult? Function(TeamsSuccessState value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TeamsInitialState value)? initial,
    TResult Function(TeamsErrorState value)? error,
    TResult Function(TeamsSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TeamsInitialState implements TeamsState {
  const factory TeamsInitialState() = _$TeamsInitialStateImpl;
}

/// @nodoc
abstract class _$$TeamsErrorStateImplCopyWith<$Res> {
  factory _$$TeamsErrorStateImplCopyWith(_$TeamsErrorStateImpl value,
          $Res Function(_$TeamsErrorStateImpl) then) =
      __$$TeamsErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$TeamsErrorStateImplCopyWithImpl<$Res>
    extends _$TeamsStateCopyWithImpl<$Res, _$TeamsErrorStateImpl>
    implements _$$TeamsErrorStateImplCopyWith<$Res> {
  __$$TeamsErrorStateImplCopyWithImpl(
      _$TeamsErrorStateImpl _value, $Res Function(_$TeamsErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$TeamsErrorStateImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TeamsErrorStateImpl implements TeamsErrorState {
  const _$TeamsErrorStateImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'TeamsState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamsErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamsErrorStateImplCopyWith<_$TeamsErrorStateImpl> get copyWith =>
      __$$TeamsErrorStateImplCopyWithImpl<_$TeamsErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(List<TeamModel> teams, bool hasMore) success,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(List<TeamModel> teams, bool hasMore)? success,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(List<TeamModel> teams, bool hasMore)? success,
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
    required TResult Function(TeamsInitialState value) initial,
    required TResult Function(TeamsErrorState value) error,
    required TResult Function(TeamsSuccessState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TeamsInitialState value)? initial,
    TResult? Function(TeamsErrorState value)? error,
    TResult? Function(TeamsSuccessState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TeamsInitialState value)? initial,
    TResult Function(TeamsErrorState value)? error,
    TResult Function(TeamsSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TeamsErrorState implements TeamsState {
  const factory TeamsErrorState(final String error) = _$TeamsErrorStateImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$TeamsErrorStateImplCopyWith<_$TeamsErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TeamsSuccessStateImplCopyWith<$Res> {
  factory _$$TeamsSuccessStateImplCopyWith(_$TeamsSuccessStateImpl value,
          $Res Function(_$TeamsSuccessStateImpl) then) =
      __$$TeamsSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TeamModel> teams, bool hasMore});
}

/// @nodoc
class __$$TeamsSuccessStateImplCopyWithImpl<$Res>
    extends _$TeamsStateCopyWithImpl<$Res, _$TeamsSuccessStateImpl>
    implements _$$TeamsSuccessStateImplCopyWith<$Res> {
  __$$TeamsSuccessStateImplCopyWithImpl(_$TeamsSuccessStateImpl _value,
      $Res Function(_$TeamsSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teams = null,
    Object? hasMore = null,
  }) {
    return _then(_$TeamsSuccessStateImpl(
      null == teams
          ? _value._teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<TeamModel>,
      null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TeamsSuccessStateImpl implements TeamsSuccessState {
  const _$TeamsSuccessStateImpl(final List<TeamModel> teams, this.hasMore)
      : _teams = teams;

  final List<TeamModel> _teams;
  @override
  List<TeamModel> get teams {
    if (_teams is EqualUnmodifiableListView) return _teams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teams);
  }

  @override
  final bool hasMore;

  @override
  String toString() {
    return 'TeamsState.success(teams: $teams, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamsSuccessStateImpl &&
            const DeepCollectionEquality().equals(other._teams, _teams) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_teams), hasMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamsSuccessStateImplCopyWith<_$TeamsSuccessStateImpl> get copyWith =>
      __$$TeamsSuccessStateImplCopyWithImpl<_$TeamsSuccessStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(List<TeamModel> teams, bool hasMore) success,
  }) {
    return success(teams, hasMore);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(List<TeamModel> teams, bool hasMore)? success,
  }) {
    return success?.call(teams, hasMore);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(List<TeamModel> teams, bool hasMore)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(teams, hasMore);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TeamsInitialState value) initial,
    required TResult Function(TeamsErrorState value) error,
    required TResult Function(TeamsSuccessState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TeamsInitialState value)? initial,
    TResult? Function(TeamsErrorState value)? error,
    TResult? Function(TeamsSuccessState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TeamsInitialState value)? initial,
    TResult Function(TeamsErrorState value)? error,
    TResult Function(TeamsSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class TeamsSuccessState implements TeamsState {
  const factory TeamsSuccessState(
          final List<TeamModel> teams, final bool hasMore) =
      _$TeamsSuccessStateImpl;

  List<TeamModel> get teams;
  bool get hasMore;
  @JsonKey(ignore: true)
  _$$TeamsSuccessStateImplCopyWith<_$TeamsSuccessStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
