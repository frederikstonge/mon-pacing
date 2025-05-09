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
      TagModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TeamModel';

  static int _$id(TeamModel v) => v.id;
  static const Field<TeamModel, int> _f$id = Field('id', _$id);
  static DateTime? _$createdDate(TeamModel v) => v.createdDate;
  static const Field<TeamModel, DateTime> _f$createdDate =
      Field('createdDate', _$createdDate);
  static DateTime? _$modifiedDate(TeamModel v) => v.modifiedDate;
  static const Field<TeamModel, DateTime> _f$modifiedDate =
      Field('modifiedDate', _$modifiedDate);
  static String _$name(TeamModel v) => v.name;
  static const Field<TeamModel, String> _f$name = Field('name', _$name);
  static int _$color(TeamModel v) => v.color;
  static const Field<TeamModel, int> _f$color = Field('color', _$color);
  static List<PerformerModel> _$performers(TeamModel v) => v.performers;
  static const Field<TeamModel, List<PerformerModel>> _f$performers =
      Field('performers', _$performers, opt: true, def: const []);
  static List<TagModel> _$tags(TeamModel v) => v.tags;
  static const Field<TeamModel, List<TagModel>> _f$tags =
      Field('tags', _$tags, opt: true, def: const []);
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
    #createdDate: _f$createdDate,
    #modifiedDate: _f$modifiedDate,
    #name: _f$name,
    #color: _f$color,
    #performers: _f$performers,
    #tags: _f$tags,
    #integrationEntityId: _f$integrationEntityId,
    #integrationAdditionalData: _f$integrationAdditionalData,
  };

  static TeamModel _instantiate(DecodingData data) {
    return TeamModel(
        id: data.dec(_f$id),
        createdDate: data.dec(_f$createdDate),
        modifiedDate: data.dec(_f$modifiedDate),
        name: data.dec(_f$name),
        color: data.dec(_f$color),
        performers: data.dec(_f$performers),
        tags: data.dec(_f$tags),
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
  ListCopyWith<$R, TagModel, TagModelCopyWith<$R, TagModel, TagModel>> get tags;
  $R call(
      {int? id,
      DateTime? createdDate,
      DateTime? modifiedDate,
      String? name,
      int? color,
      List<PerformerModel>? performers,
      List<TagModel>? tags,
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
  ListCopyWith<$R, TagModel, TagModelCopyWith<$R, TagModel, TagModel>>
      get tags => ListCopyWith(
          $value.tags, (v, t) => v.copyWith.$chain(t), (v) => call(tags: v));
  @override
  $R call(
          {int? id,
          Object? createdDate = $none,
          Object? modifiedDate = $none,
          String? name,
          int? color,
          List<PerformerModel>? performers,
          List<TagModel>? tags,
          Object? integrationEntityId = $none,
          Object? integrationAdditionalData = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (createdDate != $none) #createdDate: createdDate,
        if (modifiedDate != $none) #modifiedDate: modifiedDate,
        if (name != null) #name: name,
        if (color != null) #color: color,
        if (performers != null) #performers: performers,
        if (tags != null) #tags: tags,
        if (integrationEntityId != $none)
          #integrationEntityId: integrationEntityId,
        if (integrationAdditionalData != $none)
          #integrationAdditionalData: integrationAdditionalData
      }));
  @override
  TeamModel $make(CopyWithData data) => TeamModel(
      id: data.get(#id, or: $value.id),
      createdDate: data.get(#createdDate, or: $value.createdDate),
      modifiedDate: data.get(#modifiedDate, or: $value.modifiedDate),
      name: data.get(#name, or: $value.name),
      color: data.get(#color, or: $value.color),
      performers: data.get(#performers, or: $value.performers),
      tags: data.get(#tags, or: $value.tags),
      integrationEntityId:
          data.get(#integrationEntityId, or: $value.integrationEntityId),
      integrationAdditionalData: data.get(#integrationAdditionalData,
          or: $value.integrationAdditionalData));

  @override
  TeamModelCopyWith<$R2, TeamModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TeamModelCopyWithImpl($value, $cast, t);
}
