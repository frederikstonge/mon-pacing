// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'star_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StarModel _$StarModelFromJson(Map<String, dynamic> json) {
  return _StarModel.fromJson(json);
}

/// @nodoc
mixin _$StarModel {
  int get id => throw _privateConstructorUsedError;
  int get performerId => throw _privateConstructorUsedError;
  int get teamId => throw _privateConstructorUsedError;

  /// Serializes this StarModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StarModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StarModelCopyWith<StarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StarModelCopyWith<$Res> {
  factory $StarModelCopyWith(StarModel value, $Res Function(StarModel) then) =
      _$StarModelCopyWithImpl<$Res, StarModel>;
  @useResult
  $Res call({int id, int performerId, int teamId});
}

/// @nodoc
class _$StarModelCopyWithImpl<$Res, $Val extends StarModel>
    implements $StarModelCopyWith<$Res> {
  _$StarModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StarModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? performerId = null,
    Object? teamId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      performerId: null == performerId
          ? _value.performerId
          : performerId // ignore: cast_nullable_to_non_nullable
              as int,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StarModelImplCopyWith<$Res>
    implements $StarModelCopyWith<$Res> {
  factory _$$StarModelImplCopyWith(
          _$StarModelImpl value, $Res Function(_$StarModelImpl) then) =
      __$$StarModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int performerId, int teamId});
}

/// @nodoc
class __$$StarModelImplCopyWithImpl<$Res>
    extends _$StarModelCopyWithImpl<$Res, _$StarModelImpl>
    implements _$$StarModelImplCopyWith<$Res> {
  __$$StarModelImplCopyWithImpl(
      _$StarModelImpl _value, $Res Function(_$StarModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StarModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? performerId = null,
    Object? teamId = null,
  }) {
    return _then(_$StarModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      performerId: null == performerId
          ? _value.performerId
          : performerId // ignore: cast_nullable_to_non_nullable
              as int,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StarModelImpl implements _StarModel {
  const _$StarModelImpl(
      {required this.id, required this.performerId, required this.teamId});

  factory _$StarModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StarModelImplFromJson(json);

  @override
  final int id;
  @override
  final int performerId;
  @override
  final int teamId;

  @override
  String toString() {
    return 'StarModel(id: $id, performerId: $performerId, teamId: $teamId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StarModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.performerId, performerId) ||
                other.performerId == performerId) &&
            (identical(other.teamId, teamId) || other.teamId == teamId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, performerId, teamId);

  /// Create a copy of StarModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StarModelImplCopyWith<_$StarModelImpl> get copyWith =>
      __$$StarModelImplCopyWithImpl<_$StarModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StarModelImplToJson(
      this,
    );
  }
}

abstract class _StarModel implements StarModel {
  const factory _StarModel(
      {required final int id,
      required final int performerId,
      required final int teamId}) = _$StarModelImpl;

  factory _StarModel.fromJson(Map<String, dynamic> json) =
      _$StarModelImpl.fromJson;

  @override
  int get id;
  @override
  int get performerId;
  @override
  int get teamId;

  /// Create a copy of StarModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StarModelImplCopyWith<_$StarModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
