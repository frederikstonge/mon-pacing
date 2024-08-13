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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MatchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(MatchModel match, int selectedImprovisationIndex,
            int selectedDurationIndex)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(MatchModel match, int selectedImprovisationIndex,
            int selectedDurationIndex)?
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(MatchModel match, int selectedImprovisationIndex,
            int selectedDurationIndex)?
        success,
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

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MatchInitialStateImplCopyWith<$Res> {
  factory _$$MatchInitialStateImplCopyWith(_$MatchInitialStateImpl value,
          $Res Function(_$MatchInitialStateImpl) then) =
      __$$MatchInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MatchInitialStateImplCopyWithImpl<$Res>
    extends _$MatchStateCopyWithImpl<$Res, _$MatchInitialStateImpl>
    implements _$$MatchInitialStateImplCopyWith<$Res> {
  __$$MatchInitialStateImplCopyWithImpl(_$MatchInitialStateImpl _value,
      $Res Function(_$MatchInitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MatchInitialStateImpl implements MatchInitialState {
  const _$MatchInitialStateImpl();

  @override
  String toString() {
    return 'MatchState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MatchInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(MatchModel match, int selectedImprovisationIndex,
            int selectedDurationIndex)
        success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(MatchModel match, int selectedImprovisationIndex,
            int selectedDurationIndex)?
        success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(MatchModel match, int selectedImprovisationIndex,
            int selectedDurationIndex)?
        success,
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
  const factory MatchInitialState() = _$MatchInitialStateImpl;
}

/// @nodoc
abstract class _$$MatchErrorStateImplCopyWith<$Res> {
  factory _$$MatchErrorStateImplCopyWith(_$MatchErrorStateImpl value,
          $Res Function(_$MatchErrorStateImpl) then) =
      __$$MatchErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$MatchErrorStateImplCopyWithImpl<$Res>
    extends _$MatchStateCopyWithImpl<$Res, _$MatchErrorStateImpl>
    implements _$$MatchErrorStateImplCopyWith<$Res> {
  __$$MatchErrorStateImplCopyWithImpl(
      _$MatchErrorStateImpl _value, $Res Function(_$MatchErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$MatchErrorStateImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MatchErrorStateImpl implements MatchErrorState {
  const _$MatchErrorStateImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'MatchState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchErrorStateImplCopyWith<_$MatchErrorStateImpl> get copyWith =>
      __$$MatchErrorStateImplCopyWithImpl<_$MatchErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(MatchModel match, int selectedImprovisationIndex,
            int selectedDurationIndex)
        success,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(MatchModel match, int selectedImprovisationIndex,
            int selectedDurationIndex)?
        success,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(MatchModel match, int selectedImprovisationIndex,
            int selectedDurationIndex)?
        success,
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
  const factory MatchErrorState(final String error) = _$MatchErrorStateImpl;

  String get error;

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchErrorStateImplCopyWith<_$MatchErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MatchSuccessStateImplCopyWith<$Res> {
  factory _$$MatchSuccessStateImplCopyWith(_$MatchSuccessStateImpl value,
          $Res Function(_$MatchSuccessStateImpl) then) =
      __$$MatchSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {MatchModel match,
      int selectedImprovisationIndex,
      int selectedDurationIndex});

  $MatchModelCopyWith<$Res> get match;
}

/// @nodoc
class __$$MatchSuccessStateImplCopyWithImpl<$Res>
    extends _$MatchStateCopyWithImpl<$Res, _$MatchSuccessStateImpl>
    implements _$$MatchSuccessStateImplCopyWith<$Res> {
  __$$MatchSuccessStateImplCopyWithImpl(_$MatchSuccessStateImpl _value,
      $Res Function(_$MatchSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? match = null,
    Object? selectedImprovisationIndex = null,
    Object? selectedDurationIndex = null,
  }) {
    return _then(_$MatchSuccessStateImpl(
      null == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as MatchModel,
      null == selectedImprovisationIndex
          ? _value.selectedImprovisationIndex
          : selectedImprovisationIndex // ignore: cast_nullable_to_non_nullable
              as int,
      null == selectedDurationIndex
          ? _value.selectedDurationIndex
          : selectedDurationIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MatchModelCopyWith<$Res> get match {
    return $MatchModelCopyWith<$Res>(_value.match, (value) {
      return _then(_value.copyWith(match: value));
    });
  }
}

/// @nodoc

class _$MatchSuccessStateImpl implements MatchSuccessState {
  const _$MatchSuccessStateImpl(
      this.match, this.selectedImprovisationIndex, this.selectedDurationIndex);

  @override
  final MatchModel match;
  @override
  final int selectedImprovisationIndex;
  @override
  final int selectedDurationIndex;

  @override
  String toString() {
    return 'MatchState.success(match: $match, selectedImprovisationIndex: $selectedImprovisationIndex, selectedDurationIndex: $selectedDurationIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchSuccessStateImpl &&
            (identical(other.match, match) || other.match == match) &&
            (identical(other.selectedImprovisationIndex,
                    selectedImprovisationIndex) ||
                other.selectedImprovisationIndex ==
                    selectedImprovisationIndex) &&
            (identical(other.selectedDurationIndex, selectedDurationIndex) ||
                other.selectedDurationIndex == selectedDurationIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, match, selectedImprovisationIndex, selectedDurationIndex);

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchSuccessStateImplCopyWith<_$MatchSuccessStateImpl> get copyWith =>
      __$$MatchSuccessStateImplCopyWithImpl<_$MatchSuccessStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String error) error,
    required TResult Function(MatchModel match, int selectedImprovisationIndex,
            int selectedDurationIndex)
        success,
  }) {
    return success(match, selectedImprovisationIndex, selectedDurationIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String error)? error,
    TResult? Function(MatchModel match, int selectedImprovisationIndex,
            int selectedDurationIndex)?
        success,
  }) {
    return success?.call(
        match, selectedImprovisationIndex, selectedDurationIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String error)? error,
    TResult Function(MatchModel match, int selectedImprovisationIndex,
            int selectedDurationIndex)?
        success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(match, selectedImprovisationIndex, selectedDurationIndex);
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
  const factory MatchSuccessState(
      final MatchModel match,
      final int selectedImprovisationIndex,
      final int selectedDurationIndex) = _$MatchSuccessStateImpl;

  MatchModel get match;
  int get selectedImprovisationIndex;
  int get selectedDurationIndex;

  /// Create a copy of MatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchSuccessStateImplCopyWith<_$MatchSuccessStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
