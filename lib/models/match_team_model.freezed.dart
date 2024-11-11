// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_team_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MatchTeamModel _$MatchTeamModelFromJson(Map<String, dynamic> json) {
  return _MatchTeamModel.fromJson(json);
}

/// @nodoc
mixin _$MatchTeamModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;
  List<PerformerModel> get performers => throw _privateConstructorUsedError;
  String? get integrationEntityId => throw _privateConstructorUsedError;

  /// Serializes this MatchTeamModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MatchTeamModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchTeamModelCopyWith<MatchTeamModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchTeamModelCopyWith<$Res> {
  factory $MatchTeamModelCopyWith(
          MatchTeamModel value, $Res Function(MatchTeamModel) then) =
      _$MatchTeamModelCopyWithImpl<$Res, MatchTeamModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      int color,
      List<PerformerModel> performers,
      String? integrationEntityId});
}

/// @nodoc
class _$MatchTeamModelCopyWithImpl<$Res, $Val extends MatchTeamModel>
    implements $MatchTeamModelCopyWith<$Res> {
  _$MatchTeamModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchTeamModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? performers = null,
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
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      performers: null == performers
          ? _value.performers
          : performers // ignore: cast_nullable_to_non_nullable
              as List<PerformerModel>,
      integrationEntityId: freezed == integrationEntityId
          ? _value.integrationEntityId
          : integrationEntityId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchTeamModelImplCopyWith<$Res>
    implements $MatchTeamModelCopyWith<$Res> {
  factory _$$MatchTeamModelImplCopyWith(_$MatchTeamModelImpl value,
          $Res Function(_$MatchTeamModelImpl) then) =
      __$$MatchTeamModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int color,
      List<PerformerModel> performers,
      String? integrationEntityId});
}

/// @nodoc
class __$$MatchTeamModelImplCopyWithImpl<$Res>
    extends _$MatchTeamModelCopyWithImpl<$Res, _$MatchTeamModelImpl>
    implements _$$MatchTeamModelImplCopyWith<$Res> {
  __$$MatchTeamModelImplCopyWithImpl(
      _$MatchTeamModelImpl _value, $Res Function(_$MatchTeamModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchTeamModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? performers = null,
    Object? integrationEntityId = freezed,
  }) {
    return _then(_$MatchTeamModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      performers: null == performers
          ? _value._performers
          : performers // ignore: cast_nullable_to_non_nullable
              as List<PerformerModel>,
      integrationEntityId: freezed == integrationEntityId
          ? _value.integrationEntityId
          : integrationEntityId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchTeamModelImpl implements _MatchTeamModel {
  const _$MatchTeamModelImpl(
      {required this.id,
      required this.name,
      required this.color,
      final List<PerformerModel> performers = const [],
      this.integrationEntityId})
      : _performers = performers;

  factory _$MatchTeamModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchTeamModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int color;
  final List<PerformerModel> _performers;
  @override
  @JsonKey()
  List<PerformerModel> get performers {
    if (_performers is EqualUnmodifiableListView) return _performers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_performers);
  }

  @override
  final String? integrationEntityId;

  @override
  String toString() {
    return 'MatchTeamModel(id: $id, name: $name, color: $color, performers: $performers, integrationEntityId: $integrationEntityId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchTeamModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            const DeepCollectionEquality()
                .equals(other._performers, _performers) &&
            (identical(other.integrationEntityId, integrationEntityId) ||
                other.integrationEntityId == integrationEntityId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, color,
      const DeepCollectionEquality().hash(_performers), integrationEntityId);

  /// Create a copy of MatchTeamModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchTeamModelImplCopyWith<_$MatchTeamModelImpl> get copyWith =>
      __$$MatchTeamModelImplCopyWithImpl<_$MatchTeamModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchTeamModelImplToJson(
      this,
    );
  }
}

abstract class _MatchTeamModel implements MatchTeamModel {
  const factory _MatchTeamModel(
      {required final int id,
      required final String name,
      required final int color,
      final List<PerformerModel> performers,
      final String? integrationEntityId}) = _$MatchTeamModelImpl;

  factory _MatchTeamModel.fromJson(Map<String, dynamic> json) =
      _$MatchTeamModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get color;
  @override
  List<PerformerModel> get performers;
  @override
  String? get integrationEntityId;

  /// Create a copy of MatchTeamModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchTeamModelImplCopyWith<_$MatchTeamModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
