// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pacing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PacingModel _$PacingModelFromJson(Map<String, dynamic> json) {
  return _PacingModel.fromJson(json);
}

/// @nodoc
mixin _$PacingModel {
  int get id => throw _privateConstructorUsedError;
  @index
  String get name => throw _privateConstructorUsedError;
  @index
  DateTime? get createdDate => throw _privateConstructorUsedError;
  DateTime? get modifiedDate => throw _privateConstructorUsedError;
  List<ImprovisationModel> get improvisations =>
      throw _privateConstructorUsedError;
  int get defaultNumberOfTeams => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String? get integrationId => throw _privateConstructorUsedError;
  String? get integrationEntityId => throw _privateConstructorUsedError;

  /// Serializes this PacingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PacingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PacingModelCopyWith<PacingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PacingModelCopyWith<$Res> {
  factory $PacingModelCopyWith(
          PacingModel value, $Res Function(PacingModel) then) =
      _$PacingModelCopyWithImpl<$Res, PacingModel>;
  @useResult
  $Res call(
      {int id,
      @index String name,
      @index DateTime? createdDate,
      DateTime? modifiedDate,
      List<ImprovisationModel> improvisations,
      int defaultNumberOfTeams,
      List<String> tags,
      String? integrationId,
      String? integrationEntityId});
}

/// @nodoc
class _$PacingModelCopyWithImpl<$Res, $Val extends PacingModel>
    implements $PacingModelCopyWith<$Res> {
  _$PacingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PacingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
    Object? improvisations = null,
    Object? defaultNumberOfTeams = null,
    Object? tags = null,
    Object? integrationId = freezed,
    Object? integrationEntityId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      improvisations: null == improvisations
          ? _value.improvisations
          : improvisations // ignore: cast_nullable_to_non_nullable
              as List<ImprovisationModel>,
      defaultNumberOfTeams: null == defaultNumberOfTeams
          ? _value.defaultNumberOfTeams
          : defaultNumberOfTeams // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      integrationId: freezed == integrationId
          ? _value.integrationId
          : integrationId // ignore: cast_nullable_to_non_nullable
              as String?,
      integrationEntityId: freezed == integrationEntityId
          ? _value.integrationEntityId
          : integrationEntityId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PacingModelImplCopyWith<$Res>
    implements $PacingModelCopyWith<$Res> {
  factory _$$PacingModelImplCopyWith(
          _$PacingModelImpl value, $Res Function(_$PacingModelImpl) then) =
      __$$PacingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @index String name,
      @index DateTime? createdDate,
      DateTime? modifiedDate,
      List<ImprovisationModel> improvisations,
      int defaultNumberOfTeams,
      List<String> tags,
      String? integrationId,
      String? integrationEntityId});
}

/// @nodoc
class __$$PacingModelImplCopyWithImpl<$Res>
    extends _$PacingModelCopyWithImpl<$Res, _$PacingModelImpl>
    implements _$$PacingModelImplCopyWith<$Res> {
  __$$PacingModelImplCopyWithImpl(
      _$PacingModelImpl _value, $Res Function(_$PacingModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PacingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
    Object? improvisations = null,
    Object? defaultNumberOfTeams = null,
    Object? tags = null,
    Object? integrationId = freezed,
    Object? integrationEntityId = freezed,
  }) {
    return _then(_$PacingModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      improvisations: null == improvisations
          ? _value._improvisations
          : improvisations // ignore: cast_nullable_to_non_nullable
              as List<ImprovisationModel>,
      defaultNumberOfTeams: null == defaultNumberOfTeams
          ? _value.defaultNumberOfTeams
          : defaultNumberOfTeams // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      integrationId: freezed == integrationId
          ? _value.integrationId
          : integrationId // ignore: cast_nullable_to_non_nullable
              as String?,
      integrationEntityId: freezed == integrationEntityId
          ? _value.integrationEntityId
          : integrationEntityId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PacingModelImpl extends _PacingModel {
  const _$PacingModelImpl(
      {required this.id,
      @index required this.name,
      @index required this.createdDate,
      required this.modifiedDate,
      required final List<ImprovisationModel> improvisations,
      this.defaultNumberOfTeams = 2,
      final List<String> tags = const [],
      this.integrationId,
      this.integrationEntityId})
      : _improvisations = improvisations,
        _tags = tags,
        super._();

  factory _$PacingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PacingModelImplFromJson(json);

  @override
  final int id;
  @override
  @index
  final String name;
  @override
  @index
  final DateTime? createdDate;
  @override
  final DateTime? modifiedDate;
  final List<ImprovisationModel> _improvisations;
  @override
  List<ImprovisationModel> get improvisations {
    if (_improvisations is EqualUnmodifiableListView) return _improvisations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_improvisations);
  }

  @override
  @JsonKey()
  final int defaultNumberOfTeams;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String? integrationId;
  @override
  final String? integrationEntityId;

  @override
  String toString() {
    return 'PacingModel(id: $id, name: $name, createdDate: $createdDate, modifiedDate: $modifiedDate, improvisations: $improvisations, defaultNumberOfTeams: $defaultNumberOfTeams, tags: $tags, integrationId: $integrationId, integrationEntityId: $integrationEntityId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PacingModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate) &&
            const DeepCollectionEquality()
                .equals(other._improvisations, _improvisations) &&
            (identical(other.defaultNumberOfTeams, defaultNumberOfTeams) ||
                other.defaultNumberOfTeams == defaultNumberOfTeams) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.integrationId, integrationId) ||
                other.integrationId == integrationId) &&
            (identical(other.integrationEntityId, integrationEntityId) ||
                other.integrationEntityId == integrationEntityId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      createdDate,
      modifiedDate,
      const DeepCollectionEquality().hash(_improvisations),
      defaultNumberOfTeams,
      const DeepCollectionEquality().hash(_tags),
      integrationId,
      integrationEntityId);

  /// Create a copy of PacingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PacingModelImplCopyWith<_$PacingModelImpl> get copyWith =>
      __$$PacingModelImplCopyWithImpl<_$PacingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PacingModelImplToJson(
      this,
    );
  }
}

abstract class _PacingModel extends PacingModel implements BaseModel {
  const factory _PacingModel(
      {required final int id,
      @index required final String name,
      @index required final DateTime? createdDate,
      required final DateTime? modifiedDate,
      required final List<ImprovisationModel> improvisations,
      final int defaultNumberOfTeams,
      final List<String> tags,
      final String? integrationId,
      final String? integrationEntityId}) = _$PacingModelImpl;
  const _PacingModel._() : super._();

  factory _PacingModel.fromJson(Map<String, dynamic> json) =
      _$PacingModelImpl.fromJson;

  @override
  int get id;
  @override
  @index
  String get name;
  @override
  @index
  DateTime? get createdDate;
  @override
  DateTime? get modifiedDate;
  @override
  List<ImprovisationModel> get improvisations;
  @override
  int get defaultNumberOfTeams;
  @override
  List<String> get tags;
  @override
  String? get integrationId;
  @override
  String? get integrationEntityId;

  /// Create a copy of PacingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PacingModelImplCopyWith<_$PacingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
