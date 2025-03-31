// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'performer_entity.dart';

class PerformerEntityMapper extends ClassMapperBase<PerformerEntity> {
  PerformerEntityMapper._();

  static PerformerEntityMapper? _instance;
  static PerformerEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PerformerEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PerformerEntity';

  static int _$id(PerformerEntity v) => v.id;
  static const Field<PerformerEntity, int> _f$id = Field('id', _$id);
  static String _$name(PerformerEntity v) => v.name;
  static const Field<PerformerEntity, String> _f$name = Field('name', _$name);
  static String? _$integrationEntityId(PerformerEntity v) =>
      v.integrationEntityId;
  static const Field<PerformerEntity, String> _f$integrationEntityId =
      Field('integrationEntityId', _$integrationEntityId, opt: true);
  static String? _$integrationAdditionalData(PerformerEntity v) =>
      v.integrationAdditionalData;
  static const Field<PerformerEntity, String> _f$integrationAdditionalData =
      Field('integrationAdditionalData', _$integrationAdditionalData,
          opt: true);

  @override
  final MappableFields<PerformerEntity> fields = const {
    #id: _f$id,
    #name: _f$name,
    #integrationEntityId: _f$integrationEntityId,
    #integrationAdditionalData: _f$integrationAdditionalData,
  };

  static PerformerEntity _instantiate(DecodingData data) {
    return PerformerEntity(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        integrationEntityId: data.dec(_f$integrationEntityId),
        integrationAdditionalData: data.dec(_f$integrationAdditionalData));
  }

  @override
  final Function instantiate = _instantiate;

  static PerformerEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PerformerEntity>(map);
  }

  static PerformerEntity fromJson(String json) {
    return ensureInitialized().decodeJson<PerformerEntity>(json);
  }
}

mixin PerformerEntityMappable {
  String toJson() {
    return PerformerEntityMapper.ensureInitialized()
        .encodeJson<PerformerEntity>(this as PerformerEntity);
  }

  Map<String, dynamic> toMap() {
    return PerformerEntityMapper.ensureInitialized()
        .encodeMap<PerformerEntity>(this as PerformerEntity);
  }

  PerformerEntityCopyWith<PerformerEntity, PerformerEntity, PerformerEntity>
      get copyWith => _PerformerEntityCopyWithImpl(
          this as PerformerEntity, $identity, $identity);
  @override
  String toString() {
    return PerformerEntityMapper.ensureInitialized()
        .stringifyValue(this as PerformerEntity);
  }

  @override
  bool operator ==(Object other) {
    return PerformerEntityMapper.ensureInitialized()
        .equalsValue(this as PerformerEntity, other);
  }

  @override
  int get hashCode {
    return PerformerEntityMapper.ensureInitialized()
        .hashValue(this as PerformerEntity);
  }
}

extension PerformerEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PerformerEntity, $Out> {
  PerformerEntityCopyWith<$R, PerformerEntity, $Out> get $asPerformerEntity =>
      $base.as((v, t, t2) => _PerformerEntityCopyWithImpl(v, t, t2));
}

abstract class PerformerEntityCopyWith<$R, $In extends PerformerEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      String? name,
      String? integrationEntityId,
      String? integrationAdditionalData});
  PerformerEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PerformerEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PerformerEntity, $Out>
    implements PerformerEntityCopyWith<$R, PerformerEntity, $Out> {
  _PerformerEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PerformerEntity> $mapper =
      PerformerEntityMapper.ensureInitialized();
  @override
  $R call(
          {int? id,
          String? name,
          Object? integrationEntityId = $none,
          Object? integrationAdditionalData = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (integrationEntityId != $none)
          #integrationEntityId: integrationEntityId,
        if (integrationAdditionalData != $none)
          #integrationAdditionalData: integrationAdditionalData
      }));
  @override
  PerformerEntity $make(CopyWithData data) => PerformerEntity(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      integrationEntityId:
          data.get(#integrationEntityId, or: $value.integrationEntityId),
      integrationAdditionalData: data.get(#integrationAdditionalData,
          or: $value.integrationAdditionalData));

  @override
  PerformerEntityCopyWith<$R2, PerformerEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PerformerEntityCopyWithImpl($value, $cast, t);
}
