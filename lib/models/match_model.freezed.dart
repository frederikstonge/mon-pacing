// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'match_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatchModel _$MatchModelFromJson(Map<String, dynamic> json) {
  return _MatchModel.fromJson(json);
}

/// @nodoc
mixin _$MatchModel {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime? get createdDate => throw _privateConstructorUsedError;
  DateTime? get modifiedDate => throw _privateConstructorUsedError;
  List<TeamModel> get teams => throw _privateConstructorUsedError;
  List<ImprovisationModel> get improvisations =>
      throw _privateConstructorUsedError;
  List<PenaltyModel> get penalties => throw _privateConstructorUsedError;
  List<PointModel> get points => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchModelCopyWith<MatchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchModelCopyWith<$Res> {
  factory $MatchModelCopyWith(
          MatchModel value, $Res Function(MatchModel) then) =
      _$MatchModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String name,
      DateTime? createdDate,
      DateTime? modifiedDate,
      List<TeamModel> teams,
      List<ImprovisationModel> improvisations,
      List<PenaltyModel> penalties,
      List<PointModel> points});
}

/// @nodoc
class _$MatchModelCopyWithImpl<$Res> implements $MatchModelCopyWith<$Res> {
  _$MatchModelCopyWithImpl(this._value, this._then);

  final MatchModel _value;
  // ignore: unused_field
  final $Res Function(MatchModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
    Object? teams = freezed,
    Object? improvisations = freezed,
    Object? penalties = freezed,
    Object? points = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedDate: modifiedDate == freezed
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      teams: teams == freezed
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<TeamModel>,
      improvisations: improvisations == freezed
          ? _value.improvisations
          : improvisations // ignore: cast_nullable_to_non_nullable
              as List<ImprovisationModel>,
      penalties: penalties == freezed
          ? _value.penalties
          : penalties // ignore: cast_nullable_to_non_nullable
              as List<PenaltyModel>,
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<PointModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_MatchModelCopyWith<$Res>
    implements $MatchModelCopyWith<$Res> {
  factory _$$_MatchModelCopyWith(
          _$_MatchModel value, $Res Function(_$_MatchModel) then) =
      __$$_MatchModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String name,
      DateTime? createdDate,
      DateTime? modifiedDate,
      List<TeamModel> teams,
      List<ImprovisationModel> improvisations,
      List<PenaltyModel> penalties,
      List<PointModel> points});
}

/// @nodoc
class __$$_MatchModelCopyWithImpl<$Res> extends _$MatchModelCopyWithImpl<$Res>
    implements _$$_MatchModelCopyWith<$Res> {
  __$$_MatchModelCopyWithImpl(
      _$_MatchModel _value, $Res Function(_$_MatchModel) _then)
      : super(_value, (v) => _then(v as _$_MatchModel));

  @override
  _$_MatchModel get _value => super._value as _$_MatchModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
    Object? teams = freezed,
    Object? improvisations = freezed,
    Object? penalties = freezed,
    Object? points = freezed,
  }) {
    return _then(_$_MatchModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedDate: modifiedDate == freezed
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      teams: teams == freezed
          ? _value._teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<TeamModel>,
      improvisations: improvisations == freezed
          ? _value._improvisations
          : improvisations // ignore: cast_nullable_to_non_nullable
              as List<ImprovisationModel>,
      penalties: penalties == freezed
          ? _value._penalties
          : penalties // ignore: cast_nullable_to_non_nullable
              as List<PenaltyModel>,
      points: points == freezed
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<PointModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MatchModel implements _MatchModel {
  const _$_MatchModel(
      {required this.id,
      required this.name,
      required this.createdDate,
      required this.modifiedDate,
      required final List<TeamModel> teams,
      required final List<ImprovisationModel> improvisations,
      required final List<PenaltyModel> penalties,
      required final List<PointModel> points})
      : _teams = teams,
        _improvisations = improvisations,
        _penalties = penalties,
        _points = points;

  factory _$_MatchModel.fromJson(Map<String, dynamic> json) =>
      _$$_MatchModelFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final DateTime? createdDate;
  @override
  final DateTime? modifiedDate;
  final List<TeamModel> _teams;
  @override
  List<TeamModel> get teams {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teams);
  }

  final List<ImprovisationModel> _improvisations;
  @override
  List<ImprovisationModel> get improvisations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_improvisations);
  }

  final List<PenaltyModel> _penalties;
  @override
  List<PenaltyModel> get penalties {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_penalties);
  }

  final List<PointModel> _points;
  @override
  List<PointModel> get points {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  String toString() {
    return 'MatchModel(id: $id, name: $name, createdDate: $createdDate, modifiedDate: $modifiedDate, teams: $teams, improvisations: $improvisations, penalties: $penalties, points: $points)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MatchModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate) &&
            const DeepCollectionEquality()
                .equals(other.modifiedDate, modifiedDate) &&
            const DeepCollectionEquality().equals(other._teams, _teams) &&
            const DeepCollectionEquality()
                .equals(other._improvisations, _improvisations) &&
            const DeepCollectionEquality()
                .equals(other._penalties, _penalties) &&
            const DeepCollectionEquality().equals(other._points, _points));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(createdDate),
      const DeepCollectionEquality().hash(modifiedDate),
      const DeepCollectionEquality().hash(_teams),
      const DeepCollectionEquality().hash(_improvisations),
      const DeepCollectionEquality().hash(_penalties),
      const DeepCollectionEquality().hash(_points));

  @JsonKey(ignore: true)
  @override
  _$$_MatchModelCopyWith<_$_MatchModel> get copyWith =>
      __$$_MatchModelCopyWithImpl<_$_MatchModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MatchModelToJson(
      this,
    );
  }
}

abstract class _MatchModel implements MatchModel, BaseModel {
  const factory _MatchModel(
      {required final int? id,
      required final String name,
      required final DateTime? createdDate,
      required final DateTime? modifiedDate,
      required final List<TeamModel> teams,
      required final List<ImprovisationModel> improvisations,
      required final List<PenaltyModel> penalties,
      required final List<PointModel> points}) = _$_MatchModel;

  factory _MatchModel.fromJson(Map<String, dynamic> json) =
      _$_MatchModel.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  DateTime? get createdDate;
  @override
  DateTime? get modifiedDate;
  @override
  List<TeamModel> get teams;
  @override
  List<ImprovisationModel> get improvisations;
  @override
  List<PenaltyModel> get penalties;
  @override
  List<PointModel> get points;
  @override
  @JsonKey(ignore: true)
  _$$_MatchModelCopyWith<_$_MatchModel> get copyWith =>
      throw _privateConstructorUsedError;
}
