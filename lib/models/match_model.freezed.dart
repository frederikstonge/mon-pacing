// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MatchModel _$MatchModelFromJson(Map<String, dynamic> json) {
  return _MatchModel.fromJson(json);
}

/// @nodoc
mixin _$MatchModel {
  int get id => throw _privateConstructorUsedError;
  @index
  String get name => throw _privateConstructorUsedError;
  @index
  DateTime? get createdDate => throw _privateConstructorUsedError;
  DateTime? get modifiedDate => throw _privateConstructorUsedError;
  List<TeamModel> get teams => throw _privateConstructorUsedError;
  List<ImprovisationModel> get improvisations =>
      throw _privateConstructorUsedError;
  List<PenaltyModel> get penalties => throw _privateConstructorUsedError;
  List<PointModel> get points => throw _privateConstructorUsedError;
  bool get enablePenaltiesImpactPoints => throw _privateConstructorUsedError;
  PenaltiesImpactType get penaltiesImpactType =>
      throw _privateConstructorUsedError;
  int get penaltiesRequiredToImpactPoints => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchModelCopyWith<MatchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchModelCopyWith<$Res> {
  factory $MatchModelCopyWith(
          MatchModel value, $Res Function(MatchModel) then) =
      _$MatchModelCopyWithImpl<$Res, MatchModel>;
  @useResult
  $Res call(
      {int id,
      @index String name,
      @index DateTime? createdDate,
      DateTime? modifiedDate,
      List<TeamModel> teams,
      List<ImprovisationModel> improvisations,
      List<PenaltyModel> penalties,
      List<PointModel> points,
      bool enablePenaltiesImpactPoints,
      PenaltiesImpactType penaltiesImpactType,
      int penaltiesRequiredToImpactPoints});
}

/// @nodoc
class _$MatchModelCopyWithImpl<$Res, $Val extends MatchModel>
    implements $MatchModelCopyWith<$Res> {
  _$MatchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
    Object? teams = null,
    Object? improvisations = null,
    Object? penalties = null,
    Object? points = null,
    Object? enablePenaltiesImpactPoints = null,
    Object? penaltiesImpactType = null,
    Object? penaltiesRequiredToImpactPoints = null,
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
      teams: null == teams
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<TeamModel>,
      improvisations: null == improvisations
          ? _value.improvisations
          : improvisations // ignore: cast_nullable_to_non_nullable
              as List<ImprovisationModel>,
      penalties: null == penalties
          ? _value.penalties
          : penalties // ignore: cast_nullable_to_non_nullable
              as List<PenaltyModel>,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<PointModel>,
      enablePenaltiesImpactPoints: null == enablePenaltiesImpactPoints
          ? _value.enablePenaltiesImpactPoints
          : enablePenaltiesImpactPoints // ignore: cast_nullable_to_non_nullable
              as bool,
      penaltiesImpactType: null == penaltiesImpactType
          ? _value.penaltiesImpactType
          : penaltiesImpactType // ignore: cast_nullable_to_non_nullable
              as PenaltiesImpactType,
      penaltiesRequiredToImpactPoints: null == penaltiesRequiredToImpactPoints
          ? _value.penaltiesRequiredToImpactPoints
          : penaltiesRequiredToImpactPoints // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchModelImplCopyWith<$Res>
    implements $MatchModelCopyWith<$Res> {
  factory _$$MatchModelImplCopyWith(
          _$MatchModelImpl value, $Res Function(_$MatchModelImpl) then) =
      __$$MatchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @index String name,
      @index DateTime? createdDate,
      DateTime? modifiedDate,
      List<TeamModel> teams,
      List<ImprovisationModel> improvisations,
      List<PenaltyModel> penalties,
      List<PointModel> points,
      bool enablePenaltiesImpactPoints,
      PenaltiesImpactType penaltiesImpactType,
      int penaltiesRequiredToImpactPoints});
}

/// @nodoc
class __$$MatchModelImplCopyWithImpl<$Res>
    extends _$MatchModelCopyWithImpl<$Res, _$MatchModelImpl>
    implements _$$MatchModelImplCopyWith<$Res> {
  __$$MatchModelImplCopyWithImpl(
      _$MatchModelImpl _value, $Res Function(_$MatchModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
    Object? teams = null,
    Object? improvisations = null,
    Object? penalties = null,
    Object? points = null,
    Object? enablePenaltiesImpactPoints = null,
    Object? penaltiesImpactType = null,
    Object? penaltiesRequiredToImpactPoints = null,
  }) {
    return _then(_$MatchModelImpl(
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
      teams: null == teams
          ? _value._teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<TeamModel>,
      improvisations: null == improvisations
          ? _value._improvisations
          : improvisations // ignore: cast_nullable_to_non_nullable
              as List<ImprovisationModel>,
      penalties: null == penalties
          ? _value._penalties
          : penalties // ignore: cast_nullable_to_non_nullable
              as List<PenaltyModel>,
      points: null == points
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<PointModel>,
      enablePenaltiesImpactPoints: null == enablePenaltiesImpactPoints
          ? _value.enablePenaltiesImpactPoints
          : enablePenaltiesImpactPoints // ignore: cast_nullable_to_non_nullable
              as bool,
      penaltiesImpactType: null == penaltiesImpactType
          ? _value.penaltiesImpactType
          : penaltiesImpactType // ignore: cast_nullable_to_non_nullable
              as PenaltiesImpactType,
      penaltiesRequiredToImpactPoints: null == penaltiesRequiredToImpactPoints
          ? _value.penaltiesRequiredToImpactPoints
          : penaltiesRequiredToImpactPoints // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchModelImpl implements _MatchModel {
  const _$MatchModelImpl(
      {required this.id,
      @index required this.name,
      @index required this.createdDate,
      required this.modifiedDate,
      required final List<TeamModel> teams,
      required final List<ImprovisationModel> improvisations,
      required final List<PenaltyModel> penalties,
      required final List<PointModel> points,
      this.enablePenaltiesImpactPoints = true,
      this.penaltiesImpactType = PenaltiesImpactType.addPoints,
      this.penaltiesRequiredToImpactPoints = 3})
      : _teams = teams,
        _improvisations = improvisations,
        _penalties = penalties,
        _points = points;

  factory _$MatchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchModelImplFromJson(json);

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
  final List<TeamModel> _teams;
  @override
  List<TeamModel> get teams {
    if (_teams is EqualUnmodifiableListView) return _teams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teams);
  }

  final List<ImprovisationModel> _improvisations;
  @override
  List<ImprovisationModel> get improvisations {
    if (_improvisations is EqualUnmodifiableListView) return _improvisations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_improvisations);
  }

  final List<PenaltyModel> _penalties;
  @override
  List<PenaltyModel> get penalties {
    if (_penalties is EqualUnmodifiableListView) return _penalties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_penalties);
  }

  final List<PointModel> _points;
  @override
  List<PointModel> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  @JsonKey()
  final bool enablePenaltiesImpactPoints;
  @override
  @JsonKey()
  final PenaltiesImpactType penaltiesImpactType;
  @override
  @JsonKey()
  final int penaltiesRequiredToImpactPoints;

  @override
  String toString() {
    return 'MatchModel(id: $id, name: $name, createdDate: $createdDate, modifiedDate: $modifiedDate, teams: $teams, improvisations: $improvisations, penalties: $penalties, points: $points, enablePenaltiesImpactPoints: $enablePenaltiesImpactPoints, penaltiesImpactType: $penaltiesImpactType, penaltiesRequiredToImpactPoints: $penaltiesRequiredToImpactPoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate) &&
            const DeepCollectionEquality().equals(other._teams, _teams) &&
            const DeepCollectionEquality()
                .equals(other._improvisations, _improvisations) &&
            const DeepCollectionEquality()
                .equals(other._penalties, _penalties) &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            (identical(other.enablePenaltiesImpactPoints,
                    enablePenaltiesImpactPoints) ||
                other.enablePenaltiesImpactPoints ==
                    enablePenaltiesImpactPoints) &&
            (identical(other.penaltiesImpactType, penaltiesImpactType) ||
                other.penaltiesImpactType == penaltiesImpactType) &&
            (identical(other.penaltiesRequiredToImpactPoints,
                    penaltiesRequiredToImpactPoints) ||
                other.penaltiesRequiredToImpactPoints ==
                    penaltiesRequiredToImpactPoints));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      createdDate,
      modifiedDate,
      const DeepCollectionEquality().hash(_teams),
      const DeepCollectionEquality().hash(_improvisations),
      const DeepCollectionEquality().hash(_penalties),
      const DeepCollectionEquality().hash(_points),
      enablePenaltiesImpactPoints,
      penaltiesImpactType,
      penaltiesRequiredToImpactPoints);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchModelImplCopyWith<_$MatchModelImpl> get copyWith =>
      __$$MatchModelImplCopyWithImpl<_$MatchModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchModelImplToJson(
      this,
    );
  }
}

abstract class _MatchModel implements MatchModel, BaseModel {
  const factory _MatchModel(
      {required final int id,
      @index required final String name,
      @index required final DateTime? createdDate,
      required final DateTime? modifiedDate,
      required final List<TeamModel> teams,
      required final List<ImprovisationModel> improvisations,
      required final List<PenaltyModel> penalties,
      required final List<PointModel> points,
      final bool enablePenaltiesImpactPoints,
      final PenaltiesImpactType penaltiesImpactType,
      final int penaltiesRequiredToImpactPoints}) = _$MatchModelImpl;

  factory _MatchModel.fromJson(Map<String, dynamic> json) =
      _$MatchModelImpl.fromJson;

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
  List<TeamModel> get teams;
  @override
  List<ImprovisationModel> get improvisations;
  @override
  List<PenaltyModel> get penalties;
  @override
  List<PointModel> get points;
  @override
  bool get enablePenaltiesImpactPoints;
  @override
  PenaltiesImpactType get penaltiesImpactType;
  @override
  int get penaltiesRequiredToImpactPoints;
  @override
  @JsonKey(ignore: true)
  _$$MatchModelImplCopyWith<_$MatchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
