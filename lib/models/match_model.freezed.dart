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
  List<MatchTeamModel> get teams => throw _privateConstructorUsedError;
  List<ImprovisationModel> get improvisations =>
      throw _privateConstructorUsedError;
  List<PenaltyModel> get penalties => throw _privateConstructorUsedError;
  List<PointModel> get points => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  List<StarModel> get stars => throw _privateConstructorUsedError;
  bool get enableStatistics => throw _privateConstructorUsedError;
  bool get enablePenaltiesImpactPoints => throw _privateConstructorUsedError;
  PenaltiesImpactType get penaltiesImpactType =>
      throw _privateConstructorUsedError;
  int get penaltiesRequiredToImpactPoints => throw _privateConstructorUsedError;
  bool get enableMatchExpulsion => throw _privateConstructorUsedError;
  int get penaltiesRequiredToExpel => throw _privateConstructorUsedError;
  String? get integrationId => throw _privateConstructorUsedError;
  String? get integrationExportData => throw _privateConstructorUsedError;
  String? get integrationEntityId => throw _privateConstructorUsedError;

  /// Serializes this MatchModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MatchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      List<MatchTeamModel> teams,
      List<ImprovisationModel> improvisations,
      List<PenaltyModel> penalties,
      List<PointModel> points,
      List<String> tags,
      List<StarModel> stars,
      bool enableStatistics,
      bool enablePenaltiesImpactPoints,
      PenaltiesImpactType penaltiesImpactType,
      int penaltiesRequiredToImpactPoints,
      bool enableMatchExpulsion,
      int penaltiesRequiredToExpel,
      String? integrationId,
      String? integrationExportData,
      String? integrationEntityId});
}

/// @nodoc
class _$MatchModelCopyWithImpl<$Res, $Val extends MatchModel>
    implements $MatchModelCopyWith<$Res> {
  _$MatchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchModel
  /// with the given fields replaced by the non-null parameter values.
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
    Object? tags = null,
    Object? stars = null,
    Object? enableStatistics = null,
    Object? enablePenaltiesImpactPoints = null,
    Object? penaltiesImpactType = null,
    Object? penaltiesRequiredToImpactPoints = null,
    Object? enableMatchExpulsion = null,
    Object? penaltiesRequiredToExpel = null,
    Object? integrationId = freezed,
    Object? integrationExportData = freezed,
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
      teams: null == teams
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<MatchTeamModel>,
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
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      stars: null == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as List<StarModel>,
      enableStatistics: null == enableStatistics
          ? _value.enableStatistics
          : enableStatistics // ignore: cast_nullable_to_non_nullable
              as bool,
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
      enableMatchExpulsion: null == enableMatchExpulsion
          ? _value.enableMatchExpulsion
          : enableMatchExpulsion // ignore: cast_nullable_to_non_nullable
              as bool,
      penaltiesRequiredToExpel: null == penaltiesRequiredToExpel
          ? _value.penaltiesRequiredToExpel
          : penaltiesRequiredToExpel // ignore: cast_nullable_to_non_nullable
              as int,
      integrationId: freezed == integrationId
          ? _value.integrationId
          : integrationId // ignore: cast_nullable_to_non_nullable
              as String?,
      integrationExportData: freezed == integrationExportData
          ? _value.integrationExportData
          : integrationExportData // ignore: cast_nullable_to_non_nullable
              as String?,
      integrationEntityId: freezed == integrationEntityId
          ? _value.integrationEntityId
          : integrationEntityId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      List<MatchTeamModel> teams,
      List<ImprovisationModel> improvisations,
      List<PenaltyModel> penalties,
      List<PointModel> points,
      List<String> tags,
      List<StarModel> stars,
      bool enableStatistics,
      bool enablePenaltiesImpactPoints,
      PenaltiesImpactType penaltiesImpactType,
      int penaltiesRequiredToImpactPoints,
      bool enableMatchExpulsion,
      int penaltiesRequiredToExpel,
      String? integrationId,
      String? integrationExportData,
      String? integrationEntityId});
}

/// @nodoc
class __$$MatchModelImplCopyWithImpl<$Res>
    extends _$MatchModelCopyWithImpl<$Res, _$MatchModelImpl>
    implements _$$MatchModelImplCopyWith<$Res> {
  __$$MatchModelImplCopyWithImpl(
      _$MatchModelImpl _value, $Res Function(_$MatchModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchModel
  /// with the given fields replaced by the non-null parameter values.
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
    Object? tags = null,
    Object? stars = null,
    Object? enableStatistics = null,
    Object? enablePenaltiesImpactPoints = null,
    Object? penaltiesImpactType = null,
    Object? penaltiesRequiredToImpactPoints = null,
    Object? enableMatchExpulsion = null,
    Object? penaltiesRequiredToExpel = null,
    Object? integrationId = freezed,
    Object? integrationExportData = freezed,
    Object? integrationEntityId = freezed,
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
              as List<MatchTeamModel>,
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
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      stars: null == stars
          ? _value._stars
          : stars // ignore: cast_nullable_to_non_nullable
              as List<StarModel>,
      enableStatistics: null == enableStatistics
          ? _value.enableStatistics
          : enableStatistics // ignore: cast_nullable_to_non_nullable
              as bool,
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
      enableMatchExpulsion: null == enableMatchExpulsion
          ? _value.enableMatchExpulsion
          : enableMatchExpulsion // ignore: cast_nullable_to_non_nullable
              as bool,
      penaltiesRequiredToExpel: null == penaltiesRequiredToExpel
          ? _value.penaltiesRequiredToExpel
          : penaltiesRequiredToExpel // ignore: cast_nullable_to_non_nullable
              as int,
      integrationId: freezed == integrationId
          ? _value.integrationId
          : integrationId // ignore: cast_nullable_to_non_nullable
              as String?,
      integrationExportData: freezed == integrationExportData
          ? _value.integrationExportData
          : integrationExportData // ignore: cast_nullable_to_non_nullable
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
class _$MatchModelImpl extends _MatchModel {
  const _$MatchModelImpl(
      {required this.id,
      @index required this.name,
      @index required this.createdDate,
      required this.modifiedDate,
      required final List<MatchTeamModel> teams,
      required final List<ImprovisationModel> improvisations,
      required final List<PenaltyModel> penalties,
      required final List<PointModel> points,
      final List<String> tags = const [],
      final List<StarModel> stars = const [],
      this.enableStatistics = true,
      this.enablePenaltiesImpactPoints = true,
      this.penaltiesImpactType = PenaltiesImpactType.addPoints,
      this.penaltiesRequiredToImpactPoints = 3,
      this.enableMatchExpulsion = true,
      this.penaltiesRequiredToExpel = 3,
      this.integrationId,
      this.integrationExportData,
      this.integrationEntityId})
      : _teams = teams,
        _improvisations = improvisations,
        _penalties = penalties,
        _points = points,
        _tags = tags,
        _stars = stars,
        super._();

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
  final List<MatchTeamModel> _teams;
  @override
  List<MatchTeamModel> get teams {
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

  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<StarModel> _stars;
  @override
  @JsonKey()
  List<StarModel> get stars {
    if (_stars is EqualUnmodifiableListView) return _stars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stars);
  }

  @override
  @JsonKey()
  final bool enableStatistics;
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
  @JsonKey()
  final bool enableMatchExpulsion;
  @override
  @JsonKey()
  final int penaltiesRequiredToExpel;
  @override
  final String? integrationId;
  @override
  final String? integrationExportData;
  @override
  final String? integrationEntityId;

  @override
  String toString() {
    return 'MatchModel(id: $id, name: $name, createdDate: $createdDate, modifiedDate: $modifiedDate, teams: $teams, improvisations: $improvisations, penalties: $penalties, points: $points, tags: $tags, stars: $stars, enableStatistics: $enableStatistics, enablePenaltiesImpactPoints: $enablePenaltiesImpactPoints, penaltiesImpactType: $penaltiesImpactType, penaltiesRequiredToImpactPoints: $penaltiesRequiredToImpactPoints, enableMatchExpulsion: $enableMatchExpulsion, penaltiesRequiredToExpel: $penaltiesRequiredToExpel, integrationId: $integrationId, integrationExportData: $integrationExportData, integrationEntityId: $integrationEntityId)';
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
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._stars, _stars) &&
            (identical(other.enableStatistics, enableStatistics) ||
                other.enableStatistics == enableStatistics) &&
            (identical(other.enablePenaltiesImpactPoints,
                    enablePenaltiesImpactPoints) ||
                other.enablePenaltiesImpactPoints ==
                    enablePenaltiesImpactPoints) &&
            (identical(other.penaltiesImpactType, penaltiesImpactType) ||
                other.penaltiesImpactType == penaltiesImpactType) &&
            (identical(other.penaltiesRequiredToImpactPoints,
                    penaltiesRequiredToImpactPoints) ||
                other.penaltiesRequiredToImpactPoints ==
                    penaltiesRequiredToImpactPoints) &&
            (identical(other.enableMatchExpulsion, enableMatchExpulsion) ||
                other.enableMatchExpulsion == enableMatchExpulsion) &&
            (identical(
                    other.penaltiesRequiredToExpel, penaltiesRequiredToExpel) ||
                other.penaltiesRequiredToExpel == penaltiesRequiredToExpel) &&
            (identical(other.integrationId, integrationId) ||
                other.integrationId == integrationId) &&
            (identical(other.integrationExportData, integrationExportData) ||
                other.integrationExportData == integrationExportData) &&
            (identical(other.integrationEntityId, integrationEntityId) ||
                other.integrationEntityId == integrationEntityId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        createdDate,
        modifiedDate,
        const DeepCollectionEquality().hash(_teams),
        const DeepCollectionEquality().hash(_improvisations),
        const DeepCollectionEquality().hash(_penalties),
        const DeepCollectionEquality().hash(_points),
        const DeepCollectionEquality().hash(_tags),
        const DeepCollectionEquality().hash(_stars),
        enableStatistics,
        enablePenaltiesImpactPoints,
        penaltiesImpactType,
        penaltiesRequiredToImpactPoints,
        enableMatchExpulsion,
        penaltiesRequiredToExpel,
        integrationId,
        integrationExportData,
        integrationEntityId
      ]);

  /// Create a copy of MatchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

abstract class _MatchModel extends MatchModel implements BaseModel {
  const factory _MatchModel(
      {required final int id,
      @index required final String name,
      @index required final DateTime? createdDate,
      required final DateTime? modifiedDate,
      required final List<MatchTeamModel> teams,
      required final List<ImprovisationModel> improvisations,
      required final List<PenaltyModel> penalties,
      required final List<PointModel> points,
      final List<String> tags,
      final List<StarModel> stars,
      final bool enableStatistics,
      final bool enablePenaltiesImpactPoints,
      final PenaltiesImpactType penaltiesImpactType,
      final int penaltiesRequiredToImpactPoints,
      final bool enableMatchExpulsion,
      final int penaltiesRequiredToExpel,
      final String? integrationId,
      final String? integrationExportData,
      final String? integrationEntityId}) = _$MatchModelImpl;
  const _MatchModel._() : super._();

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
  List<MatchTeamModel> get teams;
  @override
  List<ImprovisationModel> get improvisations;
  @override
  List<PenaltyModel> get penalties;
  @override
  List<PointModel> get points;
  @override
  List<String> get tags;
  @override
  List<StarModel> get stars;
  @override
  bool get enableStatistics;
  @override
  bool get enablePenaltiesImpactPoints;
  @override
  PenaltiesImpactType get penaltiesImpactType;
  @override
  int get penaltiesRequiredToImpactPoints;
  @override
  bool get enableMatchExpulsion;
  @override
  int get penaltiesRequiredToExpel;
  @override
  String? get integrationId;
  @override
  String? get integrationExportData;
  @override
  String? get integrationEntityId;

  /// Create a copy of MatchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchModelImplCopyWith<_$MatchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
