// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'match_entity.dart';

class MatchEntityMapper extends ClassMapperBase<MatchEntity> {
  MatchEntityMapper._();

  static MatchEntityMapper? _instance;
  static MatchEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MatchEntityMapper._());
      MatchTeamEntityMapper.ensureInitialized();
      ImprovisationEntityMapper.ensureInitialized();
      PenaltyEntityMapper.ensureInitialized();
      PointEntityMapper.ensureInitialized();
      StarEntityMapper.ensureInitialized();
      PenaltiesImpactTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MatchEntity';

  static int _$id(MatchEntity v) => v.id;
  static const Field<MatchEntity, int> _f$id = Field('id', _$id);
  static String _$name(MatchEntity v) => v.name;
  static const Field<MatchEntity, String> _f$name = Field('name', _$name);
  static DateTime? _$createdDate(MatchEntity v) => v.createdDate;
  static const Field<MatchEntity, DateTime> _f$createdDate =
      Field('createdDate', _$createdDate);
  static DateTime? _$modifiedDate(MatchEntity v) => v.modifiedDate;
  static const Field<MatchEntity, DateTime> _f$modifiedDate =
      Field('modifiedDate', _$modifiedDate);
  static List<MatchTeamEntity> _$teams(MatchEntity v) => v.teams;
  static const Field<MatchEntity, List<MatchTeamEntity>> _f$teams =
      Field('teams', _$teams);
  static List<ImprovisationEntity> _$improvisations(MatchEntity v) =>
      v.improvisations;
  static const Field<MatchEntity, List<ImprovisationEntity>> _f$improvisations =
      Field('improvisations', _$improvisations);
  static List<PenaltyEntity> _$penalties(MatchEntity v) => v.penalties;
  static const Field<MatchEntity, List<PenaltyEntity>> _f$penalties =
      Field('penalties', _$penalties);
  static List<PointEntity> _$points(MatchEntity v) => v.points;
  static const Field<MatchEntity, List<PointEntity>> _f$points =
      Field('points', _$points);
  static List<String> _$tags(MatchEntity v) => v.tags;
  static const Field<MatchEntity, List<String>> _f$tags =
      Field('tags', _$tags, opt: true, def: const []);
  static List<StarEntity> _$stars(MatchEntity v) => v.stars;
  static const Field<MatchEntity, List<StarEntity>> _f$stars =
      Field('stars', _$stars, opt: true, def: const []);
  static bool _$enableStatistics(MatchEntity v) => v.enableStatistics;
  static const Field<MatchEntity, bool> _f$enableStatistics =
      Field('enableStatistics', _$enableStatistics, opt: true, def: true);
  static bool _$enablePenaltiesImpactPoints(MatchEntity v) =>
      v.enablePenaltiesImpactPoints;
  static const Field<MatchEntity, bool> _f$enablePenaltiesImpactPoints = Field(
      'enablePenaltiesImpactPoints', _$enablePenaltiesImpactPoints,
      opt: true, def: true);
  static PenaltiesImpactType _$penaltiesImpactType(MatchEntity v) =>
      v.penaltiesImpactType;
  static const Field<MatchEntity, PenaltiesImpactType> _f$penaltiesImpactType =
      Field('penaltiesImpactType', _$penaltiesImpactType,
          opt: true, def: PenaltiesImpactType.addPoints);
  static int _$penaltiesRequiredToImpactPoints(MatchEntity v) =>
      v.penaltiesRequiredToImpactPoints;
  static const Field<MatchEntity, int> _f$penaltiesRequiredToImpactPoints =
      Field(
          'penaltiesRequiredToImpactPoints', _$penaltiesRequiredToImpactPoints,
          opt: true, def: 3);
  static bool _$enableMatchExpulsion(MatchEntity v) => v.enableMatchExpulsion;
  static const Field<MatchEntity, bool> _f$enableMatchExpulsion = Field(
      'enableMatchExpulsion', _$enableMatchExpulsion,
      opt: true, def: true);
  static int _$penaltiesRequiredToExpel(MatchEntity v) =>
      v.penaltiesRequiredToExpel;
  static const Field<MatchEntity, int> _f$penaltiesRequiredToExpel = Field(
      'penaltiesRequiredToExpel', _$penaltiesRequiredToExpel,
      opt: true, def: 3);
  static String? _$integrationId(MatchEntity v) => v.integrationId;
  static const Field<MatchEntity, String> _f$integrationId =
      Field('integrationId', _$integrationId, opt: true);
  static String? _$integrationEntityId(MatchEntity v) => v.integrationEntityId;
  static const Field<MatchEntity, String> _f$integrationEntityId =
      Field('integrationEntityId', _$integrationEntityId, opt: true);
  static String? _$integrationAdditionalData(MatchEntity v) =>
      v.integrationAdditionalData;
  static const Field<MatchEntity, String> _f$integrationAdditionalData = Field(
      'integrationAdditionalData', _$integrationAdditionalData,
      opt: true);
  static int? _$integrationRestrictMaximumPointPerImprovisation(
          MatchEntity v) =>
      v.integrationRestrictMaximumPointPerImprovisation;
  static const Field<MatchEntity, int>
      _f$integrationRestrictMaximumPointPerImprovisation = Field(
          'integrationRestrictMaximumPointPerImprovisation',
          _$integrationRestrictMaximumPointPerImprovisation,
          opt: true);
  static int? _$integrationMinNumberOfImprovisations(MatchEntity v) =>
      v.integrationMinNumberOfImprovisations;
  static const Field<MatchEntity, int> _f$integrationMinNumberOfImprovisations =
      Field('integrationMinNumberOfImprovisations',
          _$integrationMinNumberOfImprovisations,
          opt: true);
  static int? _$integrationMaxNumberOfImprovisations(MatchEntity v) =>
      v.integrationMaxNumberOfImprovisations;
  static const Field<MatchEntity, int> _f$integrationMaxNumberOfImprovisations =
      Field('integrationMaxNumberOfImprovisations',
          _$integrationMaxNumberOfImprovisations,
          opt: true);
  static List<String>? _$integrationPenaltyTypes(MatchEntity v) =>
      v.integrationPenaltyTypes;
  static const Field<MatchEntity, List<String>> _f$integrationPenaltyTypes =
      Field('integrationPenaltyTypes', _$integrationPenaltyTypes, opt: true);

  @override
  final MappableFields<MatchEntity> fields = const {
    #id: _f$id,
    #name: _f$name,
    #createdDate: _f$createdDate,
    #modifiedDate: _f$modifiedDate,
    #teams: _f$teams,
    #improvisations: _f$improvisations,
    #penalties: _f$penalties,
    #points: _f$points,
    #tags: _f$tags,
    #stars: _f$stars,
    #enableStatistics: _f$enableStatistics,
    #enablePenaltiesImpactPoints: _f$enablePenaltiesImpactPoints,
    #penaltiesImpactType: _f$penaltiesImpactType,
    #penaltiesRequiredToImpactPoints: _f$penaltiesRequiredToImpactPoints,
    #enableMatchExpulsion: _f$enableMatchExpulsion,
    #penaltiesRequiredToExpel: _f$penaltiesRequiredToExpel,
    #integrationId: _f$integrationId,
    #integrationEntityId: _f$integrationEntityId,
    #integrationAdditionalData: _f$integrationAdditionalData,
    #integrationRestrictMaximumPointPerImprovisation:
        _f$integrationRestrictMaximumPointPerImprovisation,
    #integrationMinNumberOfImprovisations:
        _f$integrationMinNumberOfImprovisations,
    #integrationMaxNumberOfImprovisations:
        _f$integrationMaxNumberOfImprovisations,
    #integrationPenaltyTypes: _f$integrationPenaltyTypes,
  };

  static MatchEntity _instantiate(DecodingData data) {
    return MatchEntity(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        createdDate: data.dec(_f$createdDate),
        modifiedDate: data.dec(_f$modifiedDate),
        teams: data.dec(_f$teams),
        improvisations: data.dec(_f$improvisations),
        penalties: data.dec(_f$penalties),
        points: data.dec(_f$points),
        tags: data.dec(_f$tags),
        stars: data.dec(_f$stars),
        enableStatistics: data.dec(_f$enableStatistics),
        enablePenaltiesImpactPoints: data.dec(_f$enablePenaltiesImpactPoints),
        penaltiesImpactType: data.dec(_f$penaltiesImpactType),
        penaltiesRequiredToImpactPoints:
            data.dec(_f$penaltiesRequiredToImpactPoints),
        enableMatchExpulsion: data.dec(_f$enableMatchExpulsion),
        penaltiesRequiredToExpel: data.dec(_f$penaltiesRequiredToExpel),
        integrationId: data.dec(_f$integrationId),
        integrationEntityId: data.dec(_f$integrationEntityId),
        integrationAdditionalData: data.dec(_f$integrationAdditionalData),
        integrationRestrictMaximumPointPerImprovisation:
            data.dec(_f$integrationRestrictMaximumPointPerImprovisation),
        integrationMinNumberOfImprovisations:
            data.dec(_f$integrationMinNumberOfImprovisations),
        integrationMaxNumberOfImprovisations:
            data.dec(_f$integrationMaxNumberOfImprovisations),
        integrationPenaltyTypes: data.dec(_f$integrationPenaltyTypes));
  }

  @override
  final Function instantiate = _instantiate;

  static MatchEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MatchEntity>(map);
  }

  static MatchEntity fromJson(String json) {
    return ensureInitialized().decodeJson<MatchEntity>(json);
  }
}

mixin MatchEntityMappable {
  String toJson() {
    return MatchEntityMapper.ensureInitialized()
        .encodeJson<MatchEntity>(this as MatchEntity);
  }

  Map<String, dynamic> toMap() {
    return MatchEntityMapper.ensureInitialized()
        .encodeMap<MatchEntity>(this as MatchEntity);
  }

  MatchEntityCopyWith<MatchEntity, MatchEntity, MatchEntity> get copyWith =>
      _MatchEntityCopyWithImpl(this as MatchEntity, $identity, $identity);
  @override
  String toString() {
    return MatchEntityMapper.ensureInitialized()
        .stringifyValue(this as MatchEntity);
  }

  @override
  bool operator ==(Object other) {
    return MatchEntityMapper.ensureInitialized()
        .equalsValue(this as MatchEntity, other);
  }

  @override
  int get hashCode {
    return MatchEntityMapper.ensureInitialized().hashValue(this as MatchEntity);
  }
}

extension MatchEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MatchEntity, $Out> {
  MatchEntityCopyWith<$R, MatchEntity, $Out> get $asMatchEntity =>
      $base.as((v, t, t2) => _MatchEntityCopyWithImpl(v, t, t2));
}

abstract class MatchEntityCopyWith<$R, $In extends MatchEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, MatchTeamEntity,
      MatchTeamEntityCopyWith<$R, MatchTeamEntity, MatchTeamEntity>> get teams;
  ListCopyWith<
      $R,
      ImprovisationEntity,
      ImprovisationEntityCopyWith<$R, ImprovisationEntity,
          ImprovisationEntity>> get improvisations;
  ListCopyWith<$R, PenaltyEntity,
      PenaltyEntityCopyWith<$R, PenaltyEntity, PenaltyEntity>> get penalties;
  ListCopyWith<$R, PointEntity,
      PointEntityCopyWith<$R, PointEntity, PointEntity>> get points;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags;
  ListCopyWith<$R, StarEntity, StarEntityCopyWith<$R, StarEntity, StarEntity>>
      get stars;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get integrationPenaltyTypes;
  $R call(
      {int? id,
      String? name,
      DateTime? createdDate,
      DateTime? modifiedDate,
      List<MatchTeamEntity>? teams,
      List<ImprovisationEntity>? improvisations,
      List<PenaltyEntity>? penalties,
      List<PointEntity>? points,
      List<String>? tags,
      List<StarEntity>? stars,
      bool? enableStatistics,
      bool? enablePenaltiesImpactPoints,
      PenaltiesImpactType? penaltiesImpactType,
      int? penaltiesRequiredToImpactPoints,
      bool? enableMatchExpulsion,
      int? penaltiesRequiredToExpel,
      String? integrationId,
      String? integrationEntityId,
      String? integrationAdditionalData,
      int? integrationRestrictMaximumPointPerImprovisation,
      int? integrationMinNumberOfImprovisations,
      int? integrationMaxNumberOfImprovisations,
      List<String>? integrationPenaltyTypes});
  MatchEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MatchEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MatchEntity, $Out>
    implements MatchEntityCopyWith<$R, MatchEntity, $Out> {
  _MatchEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MatchEntity> $mapper =
      MatchEntityMapper.ensureInitialized();
  @override
  ListCopyWith<$R, MatchTeamEntity,
          MatchTeamEntityCopyWith<$R, MatchTeamEntity, MatchTeamEntity>>
      get teams => ListCopyWith(
          $value.teams, (v, t) => v.copyWith.$chain(t), (v) => call(teams: v));
  @override
  ListCopyWith<
      $R,
      ImprovisationEntity,
      ImprovisationEntityCopyWith<$R, ImprovisationEntity,
          ImprovisationEntity>> get improvisations => ListCopyWith(
      $value.improvisations,
      (v, t) => v.copyWith.$chain(t),
      (v) => call(improvisations: v));
  @override
  ListCopyWith<$R, PenaltyEntity,
          PenaltyEntityCopyWith<$R, PenaltyEntity, PenaltyEntity>>
      get penalties => ListCopyWith($value.penalties,
          (v, t) => v.copyWith.$chain(t), (v) => call(penalties: v));
  @override
  ListCopyWith<$R, PointEntity,
          PointEntityCopyWith<$R, PointEntity, PointEntity>>
      get points => ListCopyWith($value.points, (v, t) => v.copyWith.$chain(t),
          (v) => call(points: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags =>
      ListCopyWith($value.tags, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(tags: v));
  @override
  ListCopyWith<$R, StarEntity, StarEntityCopyWith<$R, StarEntity, StarEntity>>
      get stars => ListCopyWith(
          $value.stars, (v, t) => v.copyWith.$chain(t), (v) => call(stars: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get integrationPenaltyTypes => $value.integrationPenaltyTypes != null
          ? ListCopyWith(
              $value.integrationPenaltyTypes!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(integrationPenaltyTypes: v))
          : null;
  @override
  $R call(
          {int? id,
          String? name,
          Object? createdDate = $none,
          Object? modifiedDate = $none,
          List<MatchTeamEntity>? teams,
          List<ImprovisationEntity>? improvisations,
          List<PenaltyEntity>? penalties,
          List<PointEntity>? points,
          List<String>? tags,
          List<StarEntity>? stars,
          bool? enableStatistics,
          bool? enablePenaltiesImpactPoints,
          PenaltiesImpactType? penaltiesImpactType,
          int? penaltiesRequiredToImpactPoints,
          bool? enableMatchExpulsion,
          int? penaltiesRequiredToExpel,
          Object? integrationId = $none,
          Object? integrationEntityId = $none,
          Object? integrationAdditionalData = $none,
          Object? integrationRestrictMaximumPointPerImprovisation = $none,
          Object? integrationMinNumberOfImprovisations = $none,
          Object? integrationMaxNumberOfImprovisations = $none,
          Object? integrationPenaltyTypes = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (createdDate != $none) #createdDate: createdDate,
        if (modifiedDate != $none) #modifiedDate: modifiedDate,
        if (teams != null) #teams: teams,
        if (improvisations != null) #improvisations: improvisations,
        if (penalties != null) #penalties: penalties,
        if (points != null) #points: points,
        if (tags != null) #tags: tags,
        if (stars != null) #stars: stars,
        if (enableStatistics != null) #enableStatistics: enableStatistics,
        if (enablePenaltiesImpactPoints != null)
          #enablePenaltiesImpactPoints: enablePenaltiesImpactPoints,
        if (penaltiesImpactType != null)
          #penaltiesImpactType: penaltiesImpactType,
        if (penaltiesRequiredToImpactPoints != null)
          #penaltiesRequiredToImpactPoints: penaltiesRequiredToImpactPoints,
        if (enableMatchExpulsion != null)
          #enableMatchExpulsion: enableMatchExpulsion,
        if (penaltiesRequiredToExpel != null)
          #penaltiesRequiredToExpel: penaltiesRequiredToExpel,
        if (integrationId != $none) #integrationId: integrationId,
        if (integrationEntityId != $none)
          #integrationEntityId: integrationEntityId,
        if (integrationAdditionalData != $none)
          #integrationAdditionalData: integrationAdditionalData,
        if (integrationRestrictMaximumPointPerImprovisation != $none)
          #integrationRestrictMaximumPointPerImprovisation:
              integrationRestrictMaximumPointPerImprovisation,
        if (integrationMinNumberOfImprovisations != $none)
          #integrationMinNumberOfImprovisations:
              integrationMinNumberOfImprovisations,
        if (integrationMaxNumberOfImprovisations != $none)
          #integrationMaxNumberOfImprovisations:
              integrationMaxNumberOfImprovisations,
        if (integrationPenaltyTypes != $none)
          #integrationPenaltyTypes: integrationPenaltyTypes
      }));
  @override
  MatchEntity $make(CopyWithData data) => MatchEntity(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      createdDate: data.get(#createdDate, or: $value.createdDate),
      modifiedDate: data.get(#modifiedDate, or: $value.modifiedDate),
      teams: data.get(#teams, or: $value.teams),
      improvisations: data.get(#improvisations, or: $value.improvisations),
      penalties: data.get(#penalties, or: $value.penalties),
      points: data.get(#points, or: $value.points),
      tags: data.get(#tags, or: $value.tags),
      stars: data.get(#stars, or: $value.stars),
      enableStatistics:
          data.get(#enableStatistics, or: $value.enableStatistics),
      enablePenaltiesImpactPoints: data.get(#enablePenaltiesImpactPoints,
          or: $value.enablePenaltiesImpactPoints),
      penaltiesImpactType:
          data.get(#penaltiesImpactType, or: $value.penaltiesImpactType),
      penaltiesRequiredToImpactPoints: data.get(
          #penaltiesRequiredToImpactPoints,
          or: $value.penaltiesRequiredToImpactPoints),
      enableMatchExpulsion:
          data.get(#enableMatchExpulsion, or: $value.enableMatchExpulsion),
      penaltiesRequiredToExpel: data.get(#penaltiesRequiredToExpel,
          or: $value.penaltiesRequiredToExpel),
      integrationId: data.get(#integrationId, or: $value.integrationId),
      integrationEntityId:
          data.get(#integrationEntityId, or: $value.integrationEntityId),
      integrationAdditionalData: data.get(#integrationAdditionalData,
          or: $value.integrationAdditionalData),
      integrationRestrictMaximumPointPerImprovisation: data.get(
          #integrationRestrictMaximumPointPerImprovisation,
          or: $value.integrationRestrictMaximumPointPerImprovisation),
      integrationMinNumberOfImprovisations: data.get(
          #integrationMinNumberOfImprovisations,
          or: $value.integrationMinNumberOfImprovisations),
      integrationMaxNumberOfImprovisations: data.get(
          #integrationMaxNumberOfImprovisations,
          or: $value.integrationMaxNumberOfImprovisations),
      integrationPenaltyTypes: data.get(#integrationPenaltyTypes,
          or: $value.integrationPenaltyTypes));

  @override
  MatchEntityCopyWith<$R2, MatchEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MatchEntityCopyWithImpl($value, $cast, t);
}
