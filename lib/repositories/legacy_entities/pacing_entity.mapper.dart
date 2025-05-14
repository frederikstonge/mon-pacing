// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pacing_entity.dart';

class PacingEntityMapper extends ClassMapperBase<PacingEntity> {
  PacingEntityMapper._();

  static PacingEntityMapper? _instance;
  static PacingEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PacingEntityMapper._());
      ImprovisationEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PacingEntity';

  static int _$id(PacingEntity v) => v.id;
  static const Field<PacingEntity, int> _f$id = Field('id', _$id);
  static String _$name(PacingEntity v) => v.name;
  static const Field<PacingEntity, String> _f$name = Field('name', _$name);
  static DateTime? _$createdDate(PacingEntity v) => v.createdDate;
  static const Field<PacingEntity, DateTime> _f$createdDate =
      Field('createdDate', _$createdDate);
  static DateTime? _$modifiedDate(PacingEntity v) => v.modifiedDate;
  static const Field<PacingEntity, DateTime> _f$modifiedDate =
      Field('modifiedDate', _$modifiedDate);
  static List<ImprovisationEntity> _$improvisations(PacingEntity v) =>
      v.improvisations;
  static const Field<PacingEntity, List<ImprovisationEntity>>
      _f$improvisations = Field('improvisations', _$improvisations);
  static int _$defaultNumberOfTeams(PacingEntity v) => v.defaultNumberOfTeams;
  static const Field<PacingEntity, int> _f$defaultNumberOfTeams =
      Field('defaultNumberOfTeams', _$defaultNumberOfTeams, opt: true, def: 2);
  static List<String> _$tags(PacingEntity v) => v.tags;
  static const Field<PacingEntity, List<String>> _f$tags =
      Field('tags', _$tags, opt: true, def: const []);
  static String? _$integrationId(PacingEntity v) => v.integrationId;
  static const Field<PacingEntity, String> _f$integrationId =
      Field('integrationId', _$integrationId, opt: true);
  static String? _$integrationEntityId(PacingEntity v) => v.integrationEntityId;
  static const Field<PacingEntity, String> _f$integrationEntityId =
      Field('integrationEntityId', _$integrationEntityId, opt: true);
  static String? _$integrationAdditionalData(PacingEntity v) =>
      v.integrationAdditionalData;
  static const Field<PacingEntity, String> _f$integrationAdditionalData = Field(
      'integrationAdditionalData', _$integrationAdditionalData,
      opt: true);

  @override
  final MappableFields<PacingEntity> fields = const {
    #id: _f$id,
    #name: _f$name,
    #createdDate: _f$createdDate,
    #modifiedDate: _f$modifiedDate,
    #improvisations: _f$improvisations,
    #defaultNumberOfTeams: _f$defaultNumberOfTeams,
    #tags: _f$tags,
    #integrationId: _f$integrationId,
    #integrationEntityId: _f$integrationEntityId,
    #integrationAdditionalData: _f$integrationAdditionalData,
  };

  static PacingEntity _instantiate(DecodingData data) {
    return PacingEntity(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        createdDate: data.dec(_f$createdDate),
        modifiedDate: data.dec(_f$modifiedDate),
        improvisations: data.dec(_f$improvisations),
        defaultNumberOfTeams: data.dec(_f$defaultNumberOfTeams),
        tags: data.dec(_f$tags),
        integrationId: data.dec(_f$integrationId),
        integrationEntityId: data.dec(_f$integrationEntityId),
        integrationAdditionalData: data.dec(_f$integrationAdditionalData));
  }

  @override
  final Function instantiate = _instantiate;

  static PacingEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PacingEntity>(map);
  }

  static PacingEntity fromJson(String json) {
    return ensureInitialized().decodeJson<PacingEntity>(json);
  }
}

mixin PacingEntityMappable {
  String toJson() {
    return PacingEntityMapper.ensureInitialized()
        .encodeJson<PacingEntity>(this as PacingEntity);
  }

  Map<String, dynamic> toMap() {
    return PacingEntityMapper.ensureInitialized()
        .encodeMap<PacingEntity>(this as PacingEntity);
  }

  PacingEntityCopyWith<PacingEntity, PacingEntity, PacingEntity> get copyWith =>
      _PacingEntityCopyWithImpl(this as PacingEntity, $identity, $identity);
  @override
  String toString() {
    return PacingEntityMapper.ensureInitialized()
        .stringifyValue(this as PacingEntity);
  }

  @override
  bool operator ==(Object other) {
    return PacingEntityMapper.ensureInitialized()
        .equalsValue(this as PacingEntity, other);
  }

  @override
  int get hashCode {
    return PacingEntityMapper.ensureInitialized()
        .hashValue(this as PacingEntity);
  }
}

extension PacingEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PacingEntity, $Out> {
  PacingEntityCopyWith<$R, PacingEntity, $Out> get $asPacingEntity =>
      $base.as((v, t, t2) => _PacingEntityCopyWithImpl(v, t, t2));
}

abstract class PacingEntityCopyWith<$R, $In extends PacingEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      ImprovisationEntity,
      ImprovisationEntityCopyWith<$R, ImprovisationEntity,
          ImprovisationEntity>> get improvisations;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags;
  $R call(
      {int? id,
      String? name,
      DateTime? createdDate,
      DateTime? modifiedDate,
      List<ImprovisationEntity>? improvisations,
      int? defaultNumberOfTeams,
      List<String>? tags,
      String? integrationId,
      String? integrationEntityId,
      String? integrationAdditionalData});
  PacingEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PacingEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PacingEntity, $Out>
    implements PacingEntityCopyWith<$R, PacingEntity, $Out> {
  _PacingEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PacingEntity> $mapper =
      PacingEntityMapper.ensureInitialized();
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
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags =>
      ListCopyWith($value.tags, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(tags: v));
  @override
  $R call(
          {int? id,
          String? name,
          Object? createdDate = $none,
          Object? modifiedDate = $none,
          List<ImprovisationEntity>? improvisations,
          int? defaultNumberOfTeams,
          List<String>? tags,
          Object? integrationId = $none,
          Object? integrationEntityId = $none,
          Object? integrationAdditionalData = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (createdDate != $none) #createdDate: createdDate,
        if (modifiedDate != $none) #modifiedDate: modifiedDate,
        if (improvisations != null) #improvisations: improvisations,
        if (defaultNumberOfTeams != null)
          #defaultNumberOfTeams: defaultNumberOfTeams,
        if (tags != null) #tags: tags,
        if (integrationId != $none) #integrationId: integrationId,
        if (integrationEntityId != $none)
          #integrationEntityId: integrationEntityId,
        if (integrationAdditionalData != $none)
          #integrationAdditionalData: integrationAdditionalData
      }));
  @override
  PacingEntity $make(CopyWithData data) => PacingEntity(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      createdDate: data.get(#createdDate, or: $value.createdDate),
      modifiedDate: data.get(#modifiedDate, or: $value.modifiedDate),
      improvisations: data.get(#improvisations, or: $value.improvisations),
      defaultNumberOfTeams:
          data.get(#defaultNumberOfTeams, or: $value.defaultNumberOfTeams),
      tags: data.get(#tags, or: $value.tags),
      integrationId: data.get(#integrationId, or: $value.integrationId),
      integrationEntityId:
          data.get(#integrationEntityId, or: $value.integrationEntityId),
      integrationAdditionalData: data.get(#integrationAdditionalData,
          or: $value.integrationAdditionalData));

  @override
  PacingEntityCopyWith<$R2, PacingEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PacingEntityCopyWithImpl($value, $cast, t);
}
