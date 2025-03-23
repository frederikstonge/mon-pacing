// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'match_team_entity.dart';

class MatchTeamEntityMapper extends ClassMapperBase<MatchTeamEntity> {
  MatchTeamEntityMapper._();

  static MatchTeamEntityMapper? _instance;
  static MatchTeamEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MatchTeamEntityMapper._());
      PerformerEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MatchTeamEntity';

  static int _$id(MatchTeamEntity v) => v.id;
  static const Field<MatchTeamEntity, int> _f$id = Field('id', _$id);
  static String _$name(MatchTeamEntity v) => v.name;
  static const Field<MatchTeamEntity, String> _f$name = Field('name', _$name);
  static int _$color(MatchTeamEntity v) => v.color;
  static const Field<MatchTeamEntity, int> _f$color = Field('color', _$color);
  static List<PerformerEntity> _$performers(MatchTeamEntity v) => v.performers;
  static const Field<MatchTeamEntity, List<PerformerEntity>> _f$performers =
      Field('performers', _$performers, opt: true, def: const []);
  static String? _$integrationEntityId(MatchTeamEntity v) =>
      v.integrationEntityId;
  static const Field<MatchTeamEntity, String> _f$integrationEntityId =
      Field('integrationEntityId', _$integrationEntityId, opt: true);
  static String? _$integrationAdditionalData(MatchTeamEntity v) =>
      v.integrationAdditionalData;
  static const Field<MatchTeamEntity, String> _f$integrationAdditionalData =
      Field('integrationAdditionalData', _$integrationAdditionalData,
          opt: true);

  @override
  final MappableFields<MatchTeamEntity> fields = const {
    #id: _f$id,
    #name: _f$name,
    #color: _f$color,
    #performers: _f$performers,
    #integrationEntityId: _f$integrationEntityId,
    #integrationAdditionalData: _f$integrationAdditionalData,
  };

  static MatchTeamEntity _instantiate(DecodingData data) {
    return MatchTeamEntity(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        color: data.dec(_f$color),
        performers: data.dec(_f$performers),
        integrationEntityId: data.dec(_f$integrationEntityId),
        integrationAdditionalData: data.dec(_f$integrationAdditionalData));
  }

  @override
  final Function instantiate = _instantiate;

  static MatchTeamEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MatchTeamEntity>(map);
  }

  static MatchTeamEntity fromJson(String json) {
    return ensureInitialized().decodeJson<MatchTeamEntity>(json);
  }
}

mixin MatchTeamEntityMappable {
  String toJson() {
    return MatchTeamEntityMapper.ensureInitialized()
        .encodeJson<MatchTeamEntity>(this as MatchTeamEntity);
  }

  Map<String, dynamic> toMap() {
    return MatchTeamEntityMapper.ensureInitialized()
        .encodeMap<MatchTeamEntity>(this as MatchTeamEntity);
  }

  MatchTeamEntityCopyWith<MatchTeamEntity, MatchTeamEntity, MatchTeamEntity>
      get copyWith => _MatchTeamEntityCopyWithImpl(
          this as MatchTeamEntity, $identity, $identity);
  @override
  String toString() {
    return MatchTeamEntityMapper.ensureInitialized()
        .stringifyValue(this as MatchTeamEntity);
  }

  @override
  bool operator ==(Object other) {
    return MatchTeamEntityMapper.ensureInitialized()
        .equalsValue(this as MatchTeamEntity, other);
  }

  @override
  int get hashCode {
    return MatchTeamEntityMapper.ensureInitialized()
        .hashValue(this as MatchTeamEntity);
  }
}

extension MatchTeamEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MatchTeamEntity, $Out> {
  MatchTeamEntityCopyWith<$R, MatchTeamEntity, $Out> get $asMatchTeamEntity =>
      $base.as((v, t, t2) => _MatchTeamEntityCopyWithImpl(v, t, t2));
}

abstract class MatchTeamEntityCopyWith<$R, $In extends MatchTeamEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, PerformerEntity,
          PerformerEntityCopyWith<$R, PerformerEntity, PerformerEntity>>
      get performers;
  $R call(
      {int? id,
      String? name,
      int? color,
      List<PerformerEntity>? performers,
      String? integrationEntityId,
      String? integrationAdditionalData});
  MatchTeamEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MatchTeamEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MatchTeamEntity, $Out>
    implements MatchTeamEntityCopyWith<$R, MatchTeamEntity, $Out> {
  _MatchTeamEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MatchTeamEntity> $mapper =
      MatchTeamEntityMapper.ensureInitialized();
  @override
  ListCopyWith<$R, PerformerEntity,
          PerformerEntityCopyWith<$R, PerformerEntity, PerformerEntity>>
      get performers => ListCopyWith($value.performers,
          (v, t) => v.copyWith.$chain(t), (v) => call(performers: v));
  @override
  $R call(
          {int? id,
          String? name,
          int? color,
          List<PerformerEntity>? performers,
          Object? integrationEntityId = $none,
          Object? integrationAdditionalData = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (color != null) #color: color,
        if (performers != null) #performers: performers,
        if (integrationEntityId != $none)
          #integrationEntityId: integrationEntityId,
        if (integrationAdditionalData != $none)
          #integrationAdditionalData: integrationAdditionalData
      }));
  @override
  MatchTeamEntity $make(CopyWithData data) => MatchTeamEntity(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      color: data.get(#color, or: $value.color),
      performers: data.get(#performers, or: $value.performers),
      integrationEntityId:
          data.get(#integrationEntityId, or: $value.integrationEntityId),
      integrationAdditionalData: data.get(#integrationAdditionalData,
          or: $value.integrationAdditionalData));

  @override
  MatchTeamEntityCopyWith<$R2, MatchTeamEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MatchTeamEntityCopyWithImpl($value, $cast, t);
}
