// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'match_model.dart';

class MatchModelMapper extends ClassMapperBase<MatchModel> {
  MatchModelMapper._();

  static MatchModelMapper? _instance;
  static MatchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MatchModelMapper._());
      TeamModelMapper.ensureInitialized();
      ImprovisationModelMapper.ensureInitialized();
      PenaltyModelMapper.ensureInitialized();
      PointModelMapper.ensureInitialized();
      TagModelMapper.ensureInitialized();
      StarModelMapper.ensureInitialized();
      PenaltiesImpactTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MatchModel';

  static int _$id(MatchModel v) => v.id;
  static const Field<MatchModel, int> _f$id = Field('id', _$id);
  static String _$name(MatchModel v) => v.name;
  static const Field<MatchModel, String> _f$name = Field('name', _$name);
  static DateTime? _$createdDate(MatchModel v) => v.createdDate;
  static const Field<MatchModel, DateTime> _f$createdDate =
      Field('createdDate', _$createdDate);
  static DateTime? _$modifiedDate(MatchModel v) => v.modifiedDate;
  static const Field<MatchModel, DateTime> _f$modifiedDate =
      Field('modifiedDate', _$modifiedDate);
  static List<TeamModel> _$teams(MatchModel v) => v.teams;
  static const Field<MatchModel, List<TeamModel>> _f$teams =
      Field('teams', _$teams);
  static List<ImprovisationModel> _$improvisations(MatchModel v) =>
      v.improvisations;
  static const Field<MatchModel, List<ImprovisationModel>> _f$improvisations =
      Field('improvisations', _$improvisations);
  static List<PenaltyModel> _$penalties(MatchModel v) => v.penalties;
  static const Field<MatchModel, List<PenaltyModel>> _f$penalties =
      Field('penalties', _$penalties);
  static List<PointModel> _$points(MatchModel v) => v.points;
  static const Field<MatchModel, List<PointModel>> _f$points =
      Field('points', _$points);
  static List<TagModel> _$tags(MatchModel v) => v.tags;
  static const Field<MatchModel, List<TagModel>> _f$tags =
      Field('tags', _$tags, opt: true, def: const []);
  static List<StarModel> _$stars(MatchModel v) => v.stars;
  static const Field<MatchModel, List<StarModel>> _f$stars =
      Field('stars', _$stars, opt: true, def: const []);
  static bool _$enableStatistics(MatchModel v) => v.enableStatistics;
  static const Field<MatchModel, bool> _f$enableStatistics =
      Field('enableStatistics', _$enableStatistics, opt: true, def: true);
  static bool _$enablePenaltiesImpactPoints(MatchModel v) =>
      v.enablePenaltiesImpactPoints;
  static const Field<MatchModel, bool> _f$enablePenaltiesImpactPoints = Field(
      'enablePenaltiesImpactPoints', _$enablePenaltiesImpactPoints,
      opt: true, def: true);
  static PenaltiesImpactType _$penaltiesImpactType(MatchModel v) =>
      v.penaltiesImpactType;
  static const Field<MatchModel, PenaltiesImpactType> _f$penaltiesImpactType =
      Field('penaltiesImpactType', _$penaltiesImpactType,
          opt: true, def: PenaltiesImpactType.addPoints);
  static int _$penaltiesRequiredToImpactPoints(MatchModel v) =>
      v.penaltiesRequiredToImpactPoints;
  static const Field<MatchModel, int> _f$penaltiesRequiredToImpactPoints =
      Field(
          'penaltiesRequiredToImpactPoints', _$penaltiesRequiredToImpactPoints,
          opt: true, def: 3);
  static bool _$enableMatchExpulsion(MatchModel v) => v.enableMatchExpulsion;
  static const Field<MatchModel, bool> _f$enableMatchExpulsion = Field(
      'enableMatchExpulsion', _$enableMatchExpulsion,
      opt: true, def: true);
  static int _$penaltiesRequiredToExpel(MatchModel v) =>
      v.penaltiesRequiredToExpel;
  static const Field<MatchModel, int> _f$penaltiesRequiredToExpel = Field(
      'penaltiesRequiredToExpel', _$penaltiesRequiredToExpel,
      opt: true, def: 3);
  static String? _$integrationId(MatchModel v) => v.integrationId;
  static const Field<MatchModel, String> _f$integrationId =
      Field('integrationId', _$integrationId, opt: true);
  static String? _$integrationEntityId(MatchModel v) => v.integrationEntityId;
  static const Field<MatchModel, String> _f$integrationEntityId =
      Field('integrationEntityId', _$integrationEntityId, opt: true);
  static String? _$integrationAdditionalData(MatchModel v) =>
      v.integrationAdditionalData;
  static const Field<MatchModel, String> _f$integrationAdditionalData = Field(
      'integrationAdditionalData', _$integrationAdditionalData,
      opt: true);
  static int? _$integrationRestrictMaximumPointPerImprovisation(MatchModel v) =>
      v.integrationRestrictMaximumPointPerImprovisation;
  static const Field<MatchModel, int>
      _f$integrationRestrictMaximumPointPerImprovisation = Field(
          'integrationRestrictMaximumPointPerImprovisation',
          _$integrationRestrictMaximumPointPerImprovisation,
          opt: true);
  static int? _$integrationMinNumberOfImprovisations(MatchModel v) =>
      v.integrationMinNumberOfImprovisations;
  static const Field<MatchModel, int> _f$integrationMinNumberOfImprovisations =
      Field('integrationMinNumberOfImprovisations',
          _$integrationMinNumberOfImprovisations,
          opt: true);
  static int? _$integrationMaxNumberOfImprovisations(MatchModel v) =>
      v.integrationMaxNumberOfImprovisations;
  static const Field<MatchModel, int> _f$integrationMaxNumberOfImprovisations =
      Field('integrationMaxNumberOfImprovisations',
          _$integrationMaxNumberOfImprovisations,
          opt: true);
  static List<String>? _$integrationPenaltyTypes(MatchModel v) =>
      v.integrationPenaltyTypes;
  static const Field<MatchModel, List<String>> _f$integrationPenaltyTypes =
      Field('integrationPenaltyTypes', _$integrationPenaltyTypes, opt: true);

  @override
  final MappableFields<MatchModel> fields = const {
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

  static MatchModel _instantiate(DecodingData data) {
    return MatchModel(
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

  static MatchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MatchModel>(map);
  }

  static MatchModel fromJson(String json) {
    return ensureInitialized().decodeJson<MatchModel>(json);
  }
}

mixin MatchModelMappable {
  String toJson() {
    return MatchModelMapper.ensureInitialized()
        .encodeJson<MatchModel>(this as MatchModel);
  }

  Map<String, dynamic> toMap() {
    return MatchModelMapper.ensureInitialized()
        .encodeMap<MatchModel>(this as MatchModel);
  }

  MatchModelCopyWith<MatchModel, MatchModel, MatchModel> get copyWith =>
      _MatchModelCopyWithImpl(this as MatchModel, $identity, $identity);
  @override
  String toString() {
    return MatchModelMapper.ensureInitialized()
        .stringifyValue(this as MatchModel);
  }

  @override
  bool operator ==(Object other) {
    return MatchModelMapper.ensureInitialized()
        .equalsValue(this as MatchModel, other);
  }

  @override
  int get hashCode {
    return MatchModelMapper.ensureInitialized().hashValue(this as MatchModel);
  }
}

extension MatchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MatchModel, $Out> {
  MatchModelCopyWith<$R, MatchModel, $Out> get $asMatchModel =>
      $base.as((v, t, t2) => _MatchModelCopyWithImpl(v, t, t2));
}

abstract class MatchModelCopyWith<$R, $In extends MatchModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, TeamModel, TeamModelCopyWith<$R, TeamModel, TeamModel>>
      get teams;
  ListCopyWith<
      $R,
      ImprovisationModel,
      ImprovisationModelCopyWith<$R, ImprovisationModel,
          ImprovisationModel>> get improvisations;
  ListCopyWith<$R, PenaltyModel,
      PenaltyModelCopyWith<$R, PenaltyModel, PenaltyModel>> get penalties;
  ListCopyWith<$R, PointModel, PointModelCopyWith<$R, PointModel, PointModel>>
      get points;
  ListCopyWith<$R, TagModel, TagModelCopyWith<$R, TagModel, TagModel>> get tags;
  ListCopyWith<$R, StarModel, StarModelCopyWith<$R, StarModel, StarModel>>
      get stars;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get integrationPenaltyTypes;
  $R call(
      {int? id,
      String? name,
      DateTime? createdDate,
      DateTime? modifiedDate,
      List<TeamModel>? teams,
      List<ImprovisationModel>? improvisations,
      List<PenaltyModel>? penalties,
      List<PointModel>? points,
      List<TagModel>? tags,
      List<StarModel>? stars,
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
  MatchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MatchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MatchModel, $Out>
    implements MatchModelCopyWith<$R, MatchModel, $Out> {
  _MatchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MatchModel> $mapper =
      MatchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, TeamModel, TeamModelCopyWith<$R, TeamModel, TeamModel>>
      get teams => ListCopyWith(
          $value.teams, (v, t) => v.copyWith.$chain(t), (v) => call(teams: v));
  @override
  ListCopyWith<
      $R,
      ImprovisationModel,
      ImprovisationModelCopyWith<$R, ImprovisationModel,
          ImprovisationModel>> get improvisations => ListCopyWith(
      $value.improvisations,
      (v, t) => v.copyWith.$chain(t),
      (v) => call(improvisations: v));
  @override
  ListCopyWith<$R, PenaltyModel,
          PenaltyModelCopyWith<$R, PenaltyModel, PenaltyModel>>
      get penalties => ListCopyWith($value.penalties,
          (v, t) => v.copyWith.$chain(t), (v) => call(penalties: v));
  @override
  ListCopyWith<$R, PointModel, PointModelCopyWith<$R, PointModel, PointModel>>
      get points => ListCopyWith($value.points, (v, t) => v.copyWith.$chain(t),
          (v) => call(points: v));
  @override
  ListCopyWith<$R, TagModel, TagModelCopyWith<$R, TagModel, TagModel>>
      get tags => ListCopyWith(
          $value.tags, (v, t) => v.copyWith.$chain(t), (v) => call(tags: v));
  @override
  ListCopyWith<$R, StarModel, StarModelCopyWith<$R, StarModel, StarModel>>
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
          List<TeamModel>? teams,
          List<ImprovisationModel>? improvisations,
          List<PenaltyModel>? penalties,
          List<PointModel>? points,
          List<TagModel>? tags,
          List<StarModel>? stars,
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
  MatchModel $make(CopyWithData data) => MatchModel(
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
  MatchModelCopyWith<$R2, MatchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MatchModelCopyWithImpl($value, $cast, t);
}
