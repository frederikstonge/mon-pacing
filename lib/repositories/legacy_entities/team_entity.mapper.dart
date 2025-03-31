// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'team_entity.dart';

class TeamEntityMapper extends ClassMapperBase<TeamEntity> {
  TeamEntityMapper._();

  static TeamEntityMapper? _instance;
  static TeamEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TeamEntityMapper._());
      PerformerEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TeamEntity';

  static int _$id(TeamEntity v) => v.id;
  static const Field<TeamEntity, int> _f$id = Field('id', _$id);
  static DateTime? _$createdDate(TeamEntity v) => v.createdDate;
  static const Field<TeamEntity, DateTime> _f$createdDate =
      Field('createdDate', _$createdDate);
  static DateTime? _$modifiedDate(TeamEntity v) => v.modifiedDate;
  static const Field<TeamEntity, DateTime> _f$modifiedDate =
      Field('modifiedDate', _$modifiedDate);
  static String _$name(TeamEntity v) => v.name;
  static const Field<TeamEntity, String> _f$name = Field('name', _$name);
  static int _$color(TeamEntity v) => v.color;
  static const Field<TeamEntity, int> _f$color = Field('color', _$color);
  static List<PerformerEntity> _$performers(TeamEntity v) => v.performers;
  static const Field<TeamEntity, List<PerformerEntity>> _f$performers =
      Field('performers', _$performers, opt: true, def: const []);
  static List<String> _$tags(TeamEntity v) => v.tags;
  static const Field<TeamEntity, List<String>> _f$tags =
      Field('tags', _$tags, opt: true, def: const []);

  @override
  final MappableFields<TeamEntity> fields = const {
    #id: _f$id,
    #createdDate: _f$createdDate,
    #modifiedDate: _f$modifiedDate,
    #name: _f$name,
    #color: _f$color,
    #performers: _f$performers,
    #tags: _f$tags,
  };

  static TeamEntity _instantiate(DecodingData data) {
    return TeamEntity(
        id: data.dec(_f$id),
        createdDate: data.dec(_f$createdDate),
        modifiedDate: data.dec(_f$modifiedDate),
        name: data.dec(_f$name),
        color: data.dec(_f$color),
        performers: data.dec(_f$performers),
        tags: data.dec(_f$tags));
  }

  @override
  final Function instantiate = _instantiate;

  static TeamEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TeamEntity>(map);
  }

  static TeamEntity fromJson(String json) {
    return ensureInitialized().decodeJson<TeamEntity>(json);
  }
}

mixin TeamEntityMappable {
  String toJson() {
    return TeamEntityMapper.ensureInitialized()
        .encodeJson<TeamEntity>(this as TeamEntity);
  }

  Map<String, dynamic> toMap() {
    return TeamEntityMapper.ensureInitialized()
        .encodeMap<TeamEntity>(this as TeamEntity);
  }

  TeamEntityCopyWith<TeamEntity, TeamEntity, TeamEntity> get copyWith =>
      _TeamEntityCopyWithImpl(this as TeamEntity, $identity, $identity);
  @override
  String toString() {
    return TeamEntityMapper.ensureInitialized()
        .stringifyValue(this as TeamEntity);
  }

  @override
  bool operator ==(Object other) {
    return TeamEntityMapper.ensureInitialized()
        .equalsValue(this as TeamEntity, other);
  }

  @override
  int get hashCode {
    return TeamEntityMapper.ensureInitialized().hashValue(this as TeamEntity);
  }
}

extension TeamEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TeamEntity, $Out> {
  TeamEntityCopyWith<$R, TeamEntity, $Out> get $asTeamEntity =>
      $base.as((v, t, t2) => _TeamEntityCopyWithImpl(v, t, t2));
}

abstract class TeamEntityCopyWith<$R, $In extends TeamEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, PerformerEntity,
          PerformerEntityCopyWith<$R, PerformerEntity, PerformerEntity>>
      get performers;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags;
  $R call(
      {int? id,
      DateTime? createdDate,
      DateTime? modifiedDate,
      String? name,
      int? color,
      List<PerformerEntity>? performers,
      List<String>? tags});
  TeamEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TeamEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TeamEntity, $Out>
    implements TeamEntityCopyWith<$R, TeamEntity, $Out> {
  _TeamEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TeamEntity> $mapper =
      TeamEntityMapper.ensureInitialized();
  @override
  ListCopyWith<$R, PerformerEntity,
          PerformerEntityCopyWith<$R, PerformerEntity, PerformerEntity>>
      get performers => ListCopyWith($value.performers,
          (v, t) => v.copyWith.$chain(t), (v) => call(performers: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags =>
      ListCopyWith($value.tags, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(tags: v));
  @override
  $R call(
          {int? id,
          Object? createdDate = $none,
          Object? modifiedDate = $none,
          String? name,
          int? color,
          List<PerformerEntity>? performers,
          List<String>? tags}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (createdDate != $none) #createdDate: createdDate,
        if (modifiedDate != $none) #modifiedDate: modifiedDate,
        if (name != null) #name: name,
        if (color != null) #color: color,
        if (performers != null) #performers: performers,
        if (tags != null) #tags: tags
      }));
  @override
  TeamEntity $make(CopyWithData data) => TeamEntity(
      id: data.get(#id, or: $value.id),
      createdDate: data.get(#createdDate, or: $value.createdDate),
      modifiedDate: data.get(#modifiedDate, or: $value.modifiedDate),
      name: data.get(#name, or: $value.name),
      color: data.get(#color, or: $value.color),
      performers: data.get(#performers, or: $value.performers),
      tags: data.get(#tags, or: $value.tags));

  @override
  TeamEntityCopyWith<$R2, TeamEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TeamEntityCopyWithImpl($value, $cast, t);
}
