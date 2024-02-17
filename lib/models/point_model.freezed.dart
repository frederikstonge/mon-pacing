// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'point_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PointModel _$PointModelFromJson(Map<String, dynamic> json) {
  return _PointModel.fromJson(json);
}

/// @nodoc
mixin _$PointModel {
  int get id => throw _privateConstructorUsedError;
  int get teamId => throw _privateConstructorUsedError;
  int get improvisationId => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointModelCopyWith<PointModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointModelCopyWith<$Res> {
  factory $PointModelCopyWith(
          PointModel value, $Res Function(PointModel) then) =
      _$PointModelCopyWithImpl<$Res, PointModel>;
  @useResult
  $Res call({int id, int teamId, int improvisationId, int value});
}

/// @nodoc
class _$PointModelCopyWithImpl<$Res, $Val extends PointModel>
    implements $PointModelCopyWith<$Res> {
  _$PointModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? teamId = null,
    Object? improvisationId = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
      improvisationId: null == improvisationId
          ? _value.improvisationId
          : improvisationId // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointModelImplCopyWith<$Res>
    implements $PointModelCopyWith<$Res> {
  factory _$$PointModelImplCopyWith(
          _$PointModelImpl value, $Res Function(_$PointModelImpl) then) =
      __$$PointModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int teamId, int improvisationId, int value});
}

/// @nodoc
class __$$PointModelImplCopyWithImpl<$Res>
    extends _$PointModelCopyWithImpl<$Res, _$PointModelImpl>
    implements _$$PointModelImplCopyWith<$Res> {
  __$$PointModelImplCopyWithImpl(
      _$PointModelImpl _value, $Res Function(_$PointModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? teamId = null,
    Object? improvisationId = null,
    Object? value = null,
  }) {
    return _then(_$PointModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
      improvisationId: null == improvisationId
          ? _value.improvisationId
          : improvisationId // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointModelImpl implements _PointModel {
  const _$PointModelImpl(
      {required this.id,
      required this.teamId,
      required this.improvisationId,
      required this.value});

  factory _$PointModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointModelImplFromJson(json);

  @override
  final int id;
  @override
  final int teamId;
  @override
  final int improvisationId;
  @override
  final int value;

  @override
  String toString() {
    return 'PointModel(id: $id, teamId: $teamId, improvisationId: $improvisationId, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.improvisationId, improvisationId) ||
                other.improvisationId == improvisationId) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, teamId, improvisationId, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PointModelImplCopyWith<_$PointModelImpl> get copyWith =>
      __$$PointModelImplCopyWithImpl<_$PointModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointModelImplToJson(
      this,
    );
  }
}

abstract class _PointModel implements PointModel {
  const factory _PointModel(
      {required final int id,
      required final int teamId,
      required final int improvisationId,
      required final int value}) = _$PointModelImpl;

  factory _PointModel.fromJson(Map<String, dynamic> json) =
      _$PointModelImpl.fromJson;

  @override
  int get id;
  @override
  int get teamId;
  @override
  int get improvisationId;
  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$PointModelImplCopyWith<_$PointModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
