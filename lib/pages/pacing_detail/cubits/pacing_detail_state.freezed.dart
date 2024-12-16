// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pacing_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PacingDetailState {
  bool get editMode => throw _privateConstructorUsedError;
  PacingModel get pacing => throw _privateConstructorUsedError;

  /// Create a copy of PacingDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PacingDetailStateCopyWith<PacingDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PacingDetailStateCopyWith<$Res> {
  factory $PacingDetailStateCopyWith(
          PacingDetailState value, $Res Function(PacingDetailState) then) =
      _$PacingDetailStateCopyWithImpl<$Res, PacingDetailState>;
  @useResult
  $Res call({bool editMode, PacingModel pacing});
}

/// @nodoc
class _$PacingDetailStateCopyWithImpl<$Res, $Val extends PacingDetailState>
    implements $PacingDetailStateCopyWith<$Res> {
  _$PacingDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PacingDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editMode = null,
    Object? pacing = null,
  }) {
    return _then(_value.copyWith(
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      pacing: null == pacing
          ? _value.pacing
          : pacing // ignore: cast_nullable_to_non_nullable
              as PacingModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PacingDetailStateImplCopyWith<$Res>
    implements $PacingDetailStateCopyWith<$Res> {
  factory _$$PacingDetailStateImplCopyWith(_$PacingDetailStateImpl value,
          $Res Function(_$PacingDetailStateImpl) then) =
      __$$PacingDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool editMode, PacingModel pacing});
}

/// @nodoc
class __$$PacingDetailStateImplCopyWithImpl<$Res>
    extends _$PacingDetailStateCopyWithImpl<$Res, _$PacingDetailStateImpl>
    implements _$$PacingDetailStateImplCopyWith<$Res> {
  __$$PacingDetailStateImplCopyWithImpl(_$PacingDetailStateImpl _value,
      $Res Function(_$PacingDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PacingDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editMode = null,
    Object? pacing = null,
  }) {
    return _then(_$PacingDetailStateImpl(
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      pacing: null == pacing
          ? _value.pacing
          : pacing // ignore: cast_nullable_to_non_nullable
              as PacingModel,
    ));
  }
}

/// @nodoc

class _$PacingDetailStateImpl implements _PacingDetailState {
  const _$PacingDetailStateImpl({required this.editMode, required this.pacing});

  @override
  final bool editMode;
  @override
  final PacingModel pacing;

  @override
  String toString() {
    return 'PacingDetailState(editMode: $editMode, pacing: $pacing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PacingDetailStateImpl &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode) &&
            (identical(other.pacing, pacing) || other.pacing == pacing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, editMode, pacing);

  /// Create a copy of PacingDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PacingDetailStateImplCopyWith<_$PacingDetailStateImpl> get copyWith =>
      __$$PacingDetailStateImplCopyWithImpl<_$PacingDetailStateImpl>(
          this, _$identity);
}

abstract class _PacingDetailState implements PacingDetailState {
  const factory _PacingDetailState(
      {required final bool editMode,
      required final PacingModel pacing}) = _$PacingDetailStateImpl;

  @override
  bool get editMode;
  @override
  PacingModel get pacing;

  /// Create a copy of PacingDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PacingDetailStateImplCopyWith<_$PacingDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
