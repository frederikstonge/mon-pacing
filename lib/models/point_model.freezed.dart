// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$PointModelCopyWithImpl<$Res>;
  $Res call({int teamId, int improvisationId});
}

/// @nodoc
class _$PointModelCopyWithImpl<$Res> implements $PointModelCopyWith<$Res> {
  _$PointModelCopyWithImpl(this._value, this._then);

  final PointModel _value;
  // ignore: unused_field
  final $Res Function(PointModel) _then;

  @override
  $Res call({
    Object? teamId = freezed,
    Object? improvisationId = freezed,
  }) {
    return _then(_value.copyWith(
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
      improvisationId: improvisationId == freezed
          ? _value.improvisationId
          : improvisationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_PointModelCopyWith<$Res>
    implements $PointModelCopyWith<$Res> {
  factory _$$_PointModelCopyWith(
          _$_PointModel value, $Res Function(_$_PointModel) then) =
      __$$_PointModelCopyWithImpl<$Res>;
  @override
  $Res call({int teamId, int improvisationId});
}

/// @nodoc
class __$$_PointModelCopyWithImpl<$Res> extends _$PointModelCopyWithImpl<$Res>
    implements _$$_PointModelCopyWith<$Res> {
  __$$_PointModelCopyWithImpl(
      _$_PointModel _value, $Res Function(_$_PointModel) _then)
      : super(_value, (v) => _then(v as _$_PointModel));

  @override
  _$_PointModel get _value => super._value as _$_PointModel;

  @override
  $Res call({
    Object? teamId = freezed,
    Object? improvisationId = freezed,
  }) {
    return _then(_$_PointModel(
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
      improvisationId: improvisationId == freezed
          ? _value.improvisationId
          : improvisationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PointModel implements _PointModel {
  const _$_PointModel({required this.teamId, required this.improvisationId});

  factory _$_PointModel.fromJson(Map<String, dynamic> json) =>
      _$$_PointModelFromJson(json);

  @override
  final int teamId;
  @override
  final int improvisationId;

  @override
  String toString() {
    return 'PointModel(teamId: $teamId, improvisationId: $improvisationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PointModel &&
            const DeepCollectionEquality().equals(other.teamId, teamId) &&
            const DeepCollectionEquality()
                .equals(other.improvisationId, improvisationId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(teamId),
      const DeepCollectionEquality().hash(improvisationId));

  @JsonKey(ignore: true)
  @override
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
      {required final int teamId,
      required final int improvisationId}) = _$_PointModel;

  factory _PointModel.fromJson(Map<String, dynamic> json) =
      _$_PointModel.fromJson;

  @override
  int get teamId;
  @override
  int get improvisationId;
  @override
  @JsonKey(ignore: true)
  _$$_PointModelCopyWith<_$_PointModel> get copyWith =>
      throw _privateConstructorUsedError;
}
