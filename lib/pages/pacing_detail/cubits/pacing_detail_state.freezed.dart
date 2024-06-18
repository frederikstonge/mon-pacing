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

PacingDetailState _$PacingDetailStateFromJson(Map<String, dynamic> json) {
  return _PacingDetailState.fromJson(json);
}

/// @nodoc
mixin _$PacingDetailState {
  bool get initialized => throw _privateConstructorUsedError;
  bool get editMode => throw _privateConstructorUsedError;
  PacingModel get pacing => throw _privateConstructorUsedError;
  List<String> get allTags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PacingDetailStateCopyWith<PacingDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PacingDetailStateCopyWith<$Res> {
  factory $PacingDetailStateCopyWith(
          PacingDetailState value, $Res Function(PacingDetailState) then) =
      _$PacingDetailStateCopyWithImpl<$Res, PacingDetailState>;
  @useResult
  $Res call(
      {bool initialized,
      bool editMode,
      PacingModel pacing,
      List<String> allTags});

  $PacingModelCopyWith<$Res> get pacing;
}

/// @nodoc
class _$PacingDetailStateCopyWithImpl<$Res, $Val extends PacingDetailState>
    implements $PacingDetailStateCopyWith<$Res> {
  _$PacingDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialized = null,
    Object? editMode = null,
    Object? pacing = null,
    Object? allTags = null,
  }) {
    return _then(_value.copyWith(
      initialized: null == initialized
          ? _value.initialized
          : initialized // ignore: cast_nullable_to_non_nullable
              as bool,
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      pacing: null == pacing
          ? _value.pacing
          : pacing // ignore: cast_nullable_to_non_nullable
              as PacingModel,
      allTags: null == allTags
          ? _value.allTags
          : allTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PacingModelCopyWith<$Res> get pacing {
    return $PacingModelCopyWith<$Res>(_value.pacing, (value) {
      return _then(_value.copyWith(pacing: value) as $Val);
    });
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
  $Res call(
      {bool initialized,
      bool editMode,
      PacingModel pacing,
      List<String> allTags});

  @override
  $PacingModelCopyWith<$Res> get pacing;
}

/// @nodoc
class __$$PacingDetailStateImplCopyWithImpl<$Res>
    extends _$PacingDetailStateCopyWithImpl<$Res, _$PacingDetailStateImpl>
    implements _$$PacingDetailStateImplCopyWith<$Res> {
  __$$PacingDetailStateImplCopyWithImpl(_$PacingDetailStateImpl _value,
      $Res Function(_$PacingDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialized = null,
    Object? editMode = null,
    Object? pacing = null,
    Object? allTags = null,
  }) {
    return _then(_$PacingDetailStateImpl(
      initialized: null == initialized
          ? _value.initialized
          : initialized // ignore: cast_nullable_to_non_nullable
              as bool,
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      pacing: null == pacing
          ? _value.pacing
          : pacing // ignore: cast_nullable_to_non_nullable
              as PacingModel,
      allTags: null == allTags
          ? _value._allTags
          : allTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PacingDetailStateImpl implements _PacingDetailState {
  const _$PacingDetailStateImpl(
      {required this.initialized,
      required this.editMode,
      required this.pacing,
      required final List<String> allTags})
      : _allTags = allTags;

  factory _$PacingDetailStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PacingDetailStateImplFromJson(json);

  @override
  final bool initialized;
  @override
  final bool editMode;
  @override
  final PacingModel pacing;
  final List<String> _allTags;
  @override
  List<String> get allTags {
    if (_allTags is EqualUnmodifiableListView) return _allTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTags);
  }

  @override
  String toString() {
    return 'PacingDetailState(initialized: $initialized, editMode: $editMode, pacing: $pacing, allTags: $allTags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PacingDetailStateImpl &&
            (identical(other.initialized, initialized) ||
                other.initialized == initialized) &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode) &&
            (identical(other.pacing, pacing) || other.pacing == pacing) &&
            const DeepCollectionEquality().equals(other._allTags, _allTags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, initialized, editMode, pacing,
      const DeepCollectionEquality().hash(_allTags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PacingDetailStateImplCopyWith<_$PacingDetailStateImpl> get copyWith =>
      __$$PacingDetailStateImplCopyWithImpl<_$PacingDetailStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PacingDetailStateImplToJson(
      this,
    );
  }
}

abstract class _PacingDetailState implements PacingDetailState {
  const factory _PacingDetailState(
      {required final bool initialized,
      required final bool editMode,
      required final PacingModel pacing,
      required final List<String> allTags}) = _$PacingDetailStateImpl;

  factory _PacingDetailState.fromJson(Map<String, dynamic> json) =
      _$PacingDetailStateImpl.fromJson;

  @override
  bool get initialized;
  @override
  bool get editMode;
  @override
  PacingModel get pacing;
  @override
  List<String> get allTags;
  @override
  @JsonKey(ignore: true)
  _$$PacingDetailStateImplCopyWith<_$PacingDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
