// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'team_model.dart';

class TeamModelMapper extends ClassMapperBase<TeamModel> {
  TeamModelMapper._();

  static TeamModelMapper? _instance;
  static TeamModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TeamModelMapper._());
      PerformerModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TeamModel';

  static int? _$id(TeamModel v) => v.id;
  static const Field<TeamModel, int> _f$id = Field('id', _$id);
  static String _$name(TeamModel v) => v.name;
  static const Field<TeamModel, String> _f$name = Field('name', _$name);
  static int _$color(TeamModel v) => v.color;
  static const Field<TeamModel, int> _f$color = Field('color', _$color);
  static int? _$matchId(TeamModel v) => v.matchId;
  static const Field<TeamModel, int> _f$matchId = Field('matchId', _$matchId);
  static List<PerformerModel> _$performers(TeamModel v) => v.performers;
  static const Field<TeamModel, List<PerformerModel>> _f$performers =
      Field('performers', _$performers);
  static List<String>? _$tags(TeamModel v) => v.tags;
  static const Field<TeamModel, List<String>> _f$tags =
      Field('tags', _$tags, opt: true, def: const []);
  static DateTime? _$modifiedDate(TeamModel v) => v.modifiedDate;
  static const Field<TeamModel, DateTime> _f$modifiedDate =
      Field('modifiedDate', _$modifiedDate, opt: true);
  static DateTime? _$createdDate(TeamModel v) => v.createdDate;
  static const Field<TeamModel, DateTime> _f$createdDate =
      Field('createdDate', _$createdDate, opt: true);
  static String? _$integrationId(TeamModel v) => v.integrationId;
  static const Field<TeamModel, String> _f$integrationId =
      Field('integrationId', _$integrationId, opt: true);
  static String? _$integrationEntityId(TeamModel v) => v.integrationEntityId;
  static const Field<TeamModel, String> _f$integrationEntityId =
      Field('integrationEntityId', _$integrationEntityId, opt: true);
  static String? _$integrationAdditionalData(TeamModel v) =>
      v.integrationAdditionalData;
  static const Field<TeamModel, String> _f$integrationAdditionalData = Field(
      'integrationAdditionalData', _$integrationAdditionalData,
      opt: true);

  @override
  final MappableFields<TeamModel> fields = const {
    #id: _f$id,
    #name: _f$name,
    #color: _f$color,
    #matchId: _f$matchId,
    #performers: _f$performers,
    #tags: _f$tags,
    #modifiedDate: _f$modifiedDate,
    #createdDate: _f$createdDate,
    #integrationId: _f$integrationId,
    #integrationEntityId: _f$integrationEntityId,
    #integrationAdditionalData: _f$integrationAdditionalData,
  };

  static TeamModel _instantiate(DecodingData data) {
    return TeamModel(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        color: data.dec(_f$color),
        matchId: data.dec(_f$matchId),
        performers: data.dec(_f$performers),
        tags: data.dec(_f$tags),
        modifiedDate: data.dec(_f$modifiedDate),
        createdDate: data.dec(_f$createdDate),
        integrationId: data.dec(_f$integrationId),
        integrationEntityId: data.dec(_f$integrationEntityId),
        integrationAdditionalData: data.dec(_f$integrationAdditionalData));
  }

  @override
  final Function instantiate = _instantiate;

  static TeamModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TeamModel>(map);
  }

  static TeamModel fromJson(String json) {
    return ensureInitialized().decodeJson<TeamModel>(json);
  }
}

mixin TeamModelMappable {
  String toJson() {
    return TeamModelMapper.ensureInitialized()
        .encodeJson<TeamModel>(this as TeamModel);
  }

  Map<String, dynamic> toMap() {
    return TeamModelMapper.ensureInitialized()
        .encodeMap<TeamModel>(this as TeamModel);
  }

  TeamModelCopyWith<TeamModel, TeamModel, TeamModel> get copyWith =>
      _TeamModelCopyWithImpl(this as TeamModel, $identity, $identity);
  @override
  String toString() {
    return TeamModelMapper.ensureInitialized()
        .stringifyValue(this as TeamModel);
  }

  @override
  bool operator ==(Object other) {
    return TeamModelMapper.ensureInitialized()
        .equalsValue(this as TeamModel, other);
  }

  @override
  int get hashCode {
    return TeamModelMapper.ensureInitialized().hashValue(this as TeamModel);
  }
}

extension TeamModelValueCopy<$R, $Out> on ObjectCopyWith<$R, TeamModel, $Out> {
  TeamModelCopyWith<$R, TeamModel, $Out> get $asTeamModel =>
      $base.as((v, t, t2) => _TeamModelCopyWithImpl(v, t, t2));
}

abstract class TeamModelCopyWith<$R, $In extends TeamModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, PerformerModel,
          PerformerModelCopyWith<$R, PerformerModel, PerformerModel>>
      get performers;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get tags;
  $R call(
      {int? id,
      String? name,
      int? color,
      int? matchId,
      List<PerformerModel>? performers,
      List<String>? tags,
      DateTime? modifiedDate,
      DateTime? createdDate,
      String? integrationId,
      String? integrationEntityId,
      String? integrationAdditionalData});
  TeamModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TeamModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TeamModel, $Out>
    implements TeamModelCopyWith<$R, TeamModel, $Out> {
  _TeamModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TeamModel> $mapper =
      TeamModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, PerformerModel,
          PerformerModelCopyWith<$R, PerformerModel, PerformerModel>>
      get performers => ListCopyWith($value.performers,
          (v, t) => v.copyWith.$chain(t), (v) => call(performers: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get tags =>
      $value.tags != null
          ? ListCopyWith($value.tags!,
              (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(tags: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          String? name,
          int? color,
          Object? matchId = $none,
          List<PerformerModel>? performers,
          Object? tags = $none,
          Object? modifiedDate = $none,
          Object? createdDate = $none,
          Object? integrationId = $none,
          Object? integrationEntityId = $none,
          Object? integrationAdditionalData = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (name != null) #name: name,
        if (color != null) #color: color,
        if (matchId != $none) #matchId: matchId,
        if (performers != null) #performers: performers,
        if (tags != $none) #tags: tags,
        if (modifiedDate != $none) #modifiedDate: modifiedDate,
        if (createdDate != $none) #createdDate: createdDate,
        if (integrationId != $none) #integrationId: integrationId,
        if (integrationEntityId != $none)
          #integrationEntityId: integrationEntityId,
        if (integrationAdditionalData != $none)
          #integrationAdditionalData: integrationAdditionalData
      }));
  @override
  TeamModel $make(CopyWithData data) => TeamModel(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      color: data.get(#color, or: $value.color),
      matchId: data.get(#matchId, or: $value.matchId),
      performers: data.get(#performers, or: $value.performers),
      tags: data.get(#tags, or: $value.tags),
      modifiedDate: data.get(#modifiedDate, or: $value.modifiedDate),
      createdDate: data.get(#createdDate, or: $value.createdDate),
      integrationId: data.get(#integrationId, or: $value.integrationId),
      integrationEntityId:
          data.get(#integrationEntityId, or: $value.integrationEntityId),
      integrationAdditionalData: data.get(#integrationAdditionalData,
          or: $value.integrationAdditionalData));

  @override
  TeamModelCopyWith<$R2, TeamModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TeamModelCopyWithImpl($value, $cast, t);
}
