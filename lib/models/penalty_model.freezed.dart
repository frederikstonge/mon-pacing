// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'penalty_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PenaltyModel _$PenaltyModelFromJson(Map<String, dynamic> json) {
  return _PenaltyModel.fromJson(json);
}

/// @nodoc
mixin _$PenaltyModel {
  int get id => throw _privateConstructorUsedError;
  bool get major => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int? get performerId => throw _privateConstructorUsedError;
  int get teamId => throw _privateConstructorUsedError;
  int get improvisationId => throw _privateConstructorUsedError;

  /// Serializes this PenaltyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PenaltyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PenaltyModelCopyWith<PenaltyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PenaltyModelCopyWith<$Res> {
  factory $PenaltyModelCopyWith(
          PenaltyModel value, $Res Function(PenaltyModel) then) =
      _$PenaltyModelCopyWithImpl<$Res, PenaltyModel>;
  @useResult
  $Res call(
      {int id,
      bool major,
      String type,
      int? performerId,
      int teamId,
      int improvisationId});
}

/// @nodoc
class _$PenaltyModelCopyWithImpl<$Res, $Val extends PenaltyModel>
    implements $PenaltyModelCopyWith<$Res> {
  _$PenaltyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PenaltyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? major = null,
    Object? type = null,
    Object? performerId = freezed,
    Object? teamId = null,
    Object? improvisationId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      major: null == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      performerId: freezed == performerId
          ? _value.performerId
          : performerId // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$PenaltyModelImplCopyWith<$Res>
    implements $PenaltyModelCopyWith<$Res> {
  factory _$$PenaltyModelImplCopyWith(
          _$PenaltyModelImpl value, $Res Function(_$PenaltyModelImpl) then) =
      __$$PenaltyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      bool major,
      String type,
      int? performerId,
      int teamId,
      int improvisationId});
}

/// @nodoc
class __$$PenaltyModelImplCopyWithImpl<$Res>
    extends _$PenaltyModelCopyWithImpl<$Res, _$PenaltyModelImpl>
    implements _$$PenaltyModelImplCopyWith<$Res> {
  __$$PenaltyModelImplCopyWithImpl(
      _$PenaltyModelImpl _value, $Res Function(_$PenaltyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PenaltyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? major = null,
    Object? type = null,
    Object? performerId = freezed,
    Object? teamId = null,
    Object? improvisationId = null,
  }) {
    return _then(_$PenaltyModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      major: null == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      performerId: freezed == performerId
          ? _value.performerId
          : performerId // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$PenaltyModelImpl implements _PenaltyModel {
  const _$PenaltyModelImpl(
      {required this.id,
      required this.major,
      required this.type,
      required this.performerId,
      required this.teamId,
      required this.improvisationId});

  factory _$PenaltyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PenaltyModelImplFromJson(json);

  @override
  final int id;
  @override
  final bool major;
  @override
  final String type;
  @override
  final int? performerId;
  @override
  final int teamId;
  @override
  final int improvisationId;

  @override
  String toString() {
    return 'PenaltyModel(id: $id, major: $major, type: $type, performerId: $performerId, teamId: $teamId, improvisationId: $improvisationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PenaltyModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.major, major) || other.major == major) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.performerId, performerId) ||
                other.performerId == performerId) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.improvisationId, improvisationId) ||
                other.improvisationId == improvisationId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, major, type, performerId, teamId, improvisationId);

  /// Create a copy of PenaltyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PenaltyModelImplCopyWith<_$PenaltyModelImpl> get copyWith =>
      __$$PenaltyModelImplCopyWithImpl<_$PenaltyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PenaltyModelImplToJson(
      this,
    );
  }
}

abstract class _PenaltyModel implements PenaltyModel {
  const factory _PenaltyModel(
      {required final int id,
      required final bool major,
      required final String type,
      required final int? performerId,
      required final int teamId,
      required final int improvisationId}) = _$PenaltyModelImpl;

  factory _PenaltyModel.fromJson(Map<String, dynamic> json) =
      _$PenaltyModelImpl.fromJson;

  @override
  int get id;
  @override
  bool get major;
  @override
  String get type;
  @override
  int? get performerId;
  @override
  int get teamId;
  @override
  int get improvisationId;

  /// Create a copy of PenaltyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PenaltyModelImplCopyWith<_$PenaltyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
