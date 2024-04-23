// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_improvisation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MatchImprovisationState _$MatchImprovisationStateFromJson(
    Map<String, dynamic> json) {
  return _MatchImprovisationState.fromJson(json);
}

/// @nodoc
mixin _$MatchImprovisationState {
  ImprovisationModel get improvisation => throw _privateConstructorUsedError;
  bool get editMode => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchImprovisationStateCopyWith<MatchImprovisationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchImprovisationStateCopyWith<$Res> {
  factory $MatchImprovisationStateCopyWith(MatchImprovisationState value,
          $Res Function(MatchImprovisationState) then) =
      _$MatchImprovisationStateCopyWithImpl<$Res, MatchImprovisationState>;
  @useResult
  $Res call({ImprovisationModel improvisation, bool editMode, int index});

  $ImprovisationModelCopyWith<$Res> get improvisation;
}

/// @nodoc
class _$MatchImprovisationStateCopyWithImpl<$Res,
        $Val extends MatchImprovisationState>
    implements $MatchImprovisationStateCopyWith<$Res> {
  _$MatchImprovisationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? improvisation = null,
    Object? editMode = null,
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      improvisation: null == improvisation
          ? _value.improvisation
          : improvisation // ignore: cast_nullable_to_non_nullable
              as ImprovisationModel,
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImprovisationModelCopyWith<$Res> get improvisation {
    return $ImprovisationModelCopyWith<$Res>(_value.improvisation, (value) {
      return _then(_value.copyWith(improvisation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MatchImprovisationStateImplCopyWith<$Res>
    implements $MatchImprovisationStateCopyWith<$Res> {
  factory _$$MatchImprovisationStateImplCopyWith(
          _$MatchImprovisationStateImpl value,
          $Res Function(_$MatchImprovisationStateImpl) then) =
      __$$MatchImprovisationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ImprovisationModel improvisation, bool editMode, int index});

  @override
  $ImprovisationModelCopyWith<$Res> get improvisation;
}

/// @nodoc
class __$$MatchImprovisationStateImplCopyWithImpl<$Res>
    extends _$MatchImprovisationStateCopyWithImpl<$Res,
        _$MatchImprovisationStateImpl>
    implements _$$MatchImprovisationStateImplCopyWith<$Res> {
  __$$MatchImprovisationStateImplCopyWithImpl(
      _$MatchImprovisationStateImpl _value,
      $Res Function(_$MatchImprovisationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? improvisation = null,
    Object? editMode = null,
    Object? index = null,
  }) {
    return _then(_$MatchImprovisationStateImpl(
      improvisation: null == improvisation
          ? _value.improvisation
          : improvisation // ignore: cast_nullable_to_non_nullable
              as ImprovisationModel,
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchImprovisationStateImpl implements _MatchImprovisationState {
  const _$MatchImprovisationStateImpl(
      {required this.improvisation,
      required this.editMode,
      required this.index});

  factory _$MatchImprovisationStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchImprovisationStateImplFromJson(json);

  @override
  final ImprovisationModel improvisation;
  @override
  final bool editMode;
  @override
  final int index;

  @override
  String toString() {
    return 'MatchImprovisationState(improvisation: $improvisation, editMode: $editMode, index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchImprovisationStateImpl &&
            (identical(other.improvisation, improvisation) ||
                other.improvisation == improvisation) &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode) &&
            (identical(other.index, index) || other.index == index));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, improvisation, editMode, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchImprovisationStateImplCopyWith<_$MatchImprovisationStateImpl>
      get copyWith => __$$MatchImprovisationStateImplCopyWithImpl<
          _$MatchImprovisationStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchImprovisationStateImplToJson(
      this,
    );
  }
}

abstract class _MatchImprovisationState implements MatchImprovisationState {
  const factory _MatchImprovisationState(
      {required final ImprovisationModel improvisation,
      required final bool editMode,
      required final int index}) = _$MatchImprovisationStateImpl;

  factory _MatchImprovisationState.fromJson(Map<String, dynamic> json) =
      _$MatchImprovisationStateImpl.fromJson;

  @override
  ImprovisationModel get improvisation;
  @override
  bool get editMode;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$MatchImprovisationStateImplCopyWith<_$MatchImprovisationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
