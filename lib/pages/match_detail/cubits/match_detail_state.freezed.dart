// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MatchDetailState {
  bool get editMode => throw _privateConstructorUsedError;
  MatchModel get match => throw _privateConstructorUsedError;

  /// Create a copy of MatchDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchDetailStateCopyWith<MatchDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchDetailStateCopyWith<$Res> {
  factory $MatchDetailStateCopyWith(
          MatchDetailState value, $Res Function(MatchDetailState) then) =
      _$MatchDetailStateCopyWithImpl<$Res, MatchDetailState>;
  @useResult
  $Res call({bool editMode, MatchModel match});
}

/// @nodoc
class _$MatchDetailStateCopyWithImpl<$Res, $Val extends MatchDetailState>
    implements $MatchDetailStateCopyWith<$Res> {
  _$MatchDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editMode = null,
    Object? match = null,
  }) {
    return _then(_value.copyWith(
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      match: null == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as MatchModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchDetailStateImplCopyWith<$Res>
    implements $MatchDetailStateCopyWith<$Res> {
  factory _$$MatchDetailStateImplCopyWith(_$MatchDetailStateImpl value,
          $Res Function(_$MatchDetailStateImpl) then) =
      __$$MatchDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool editMode, MatchModel match});
}

/// @nodoc
class __$$MatchDetailStateImplCopyWithImpl<$Res>
    extends _$MatchDetailStateCopyWithImpl<$Res, _$MatchDetailStateImpl>
    implements _$$MatchDetailStateImplCopyWith<$Res> {
  __$$MatchDetailStateImplCopyWithImpl(_$MatchDetailStateImpl _value,
      $Res Function(_$MatchDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editMode = null,
    Object? match = null,
  }) {
    return _then(_$MatchDetailStateImpl(
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      match: null == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as MatchModel,
    ));
  }
}

/// @nodoc

class _$MatchDetailStateImpl implements _MatchDetailState {
  const _$MatchDetailStateImpl({required this.editMode, required this.match});

  @override
  final bool editMode;
  @override
  final MatchModel match;

  @override
  String toString() {
    return 'MatchDetailState(editMode: $editMode, match: $match)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchDetailStateImpl &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode) &&
            (identical(other.match, match) || other.match == match));
  }

  @override
  int get hashCode => Object.hash(runtimeType, editMode, match);

  /// Create a copy of MatchDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchDetailStateImplCopyWith<_$MatchDetailStateImpl> get copyWith =>
      __$$MatchDetailStateImplCopyWithImpl<_$MatchDetailStateImpl>(
          this, _$identity);
}

abstract class _MatchDetailState implements MatchDetailState {
  const factory _MatchDetailState(
      {required final bool editMode,
      required final MatchModel match}) = _$MatchDetailStateImpl;

  @override
  bool get editMode;
  @override
  MatchModel get match;

  /// Create a copy of MatchDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchDetailStateImplCopyWith<_$MatchDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
