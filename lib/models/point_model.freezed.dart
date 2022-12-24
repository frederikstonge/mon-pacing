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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PointModel _$PointModelFromJson(Map<String, dynamic> json) {
  return _PointModel.fromJson(json);
}

/// @nodoc
mixin _$PointModel {
  int get id => throw _privateConstructorUsedError;
  int get teamId => throw _privateConstructorUsedError;
  int get improvisationId => throw _privateConstructorUsedError;

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
  $Res call({int id, int teamId, int improvisationId});
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PointModelCopyWith<$Res>
    implements $PointModelCopyWith<$Res> {
  factory _$$_PointModelCopyWith(
          _$_PointModel value, $Res Function(_$_PointModel) then) =
      __$$_PointModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int teamId, int improvisationId});
}

/// @nodoc
class __$$_PointModelCopyWithImpl<$Res>
    extends _$PointModelCopyWithImpl<$Res, _$_PointModel>
    implements _$$_PointModelCopyWith<$Res> {
  __$$_PointModelCopyWithImpl(
      _$_PointModel _value, $Res Function(_$_PointModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? teamId = null,
    Object? improvisationId = null,
  }) {
    return _then(_$_PointModel(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PointModel implements _PointModel {
  const _$_PointModel(
      {required this.id, required this.teamId, required this.improvisationId});

  factory _$_PointModel.fromJson(Map<String, dynamic> json) =>
      _$$_PointModelFromJson(json);

  @override
  final int id;
  @override
  final int teamId;
  @override
  final int improvisationId;

  @override
  String toString() {
    return 'PointModel(id: $id, teamId: $teamId, improvisationId: $improvisationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PointModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.improvisationId, improvisationId) ||
                other.improvisationId == improvisationId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, teamId, improvisationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PointModelCopyWith<_$_PointModel> get copyWith =>
      __$$_PointModelCopyWithImpl<_$_PointModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PointModelToJson(
      this,
    );
  }
}

abstract class _PointModel implements PointModel {
  const factory _PointModel(
      {required final int id,
      required final int teamId,
      required final int improvisationId}) = _$_PointModel;

  factory _PointModel.fromJson(Map<String, dynamic> json) =
      _$_PointModel.fromJson;

  @override
  int get id;
  @override
  int get teamId;
  @override
  int get improvisationId;
  @override
  @JsonKey(ignore: true)
  _$$_PointModelCopyWith<_$_PointModel> get copyWith =>
      throw _privateConstructorUsedError;
}
