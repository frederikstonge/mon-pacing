// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'point_entity.dart';

class PointEntityMapper extends ClassMapperBase<PointEntity> {
  PointEntityMapper._();

  static PointEntityMapper? _instance;
  static PointEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PointEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PointEntity';

  static int _$id(PointEntity v) => v.id;
  static const Field<PointEntity, int> _f$id = Field('id', _$id);
  static int _$teamId(PointEntity v) => v.teamId;
  static const Field<PointEntity, int> _f$teamId = Field('teamId', _$teamId);
  static int _$improvisationId(PointEntity v) => v.improvisationId;
  static const Field<PointEntity, int> _f$improvisationId = Field('improvisationId', _$improvisationId);
  static int _$value(PointEntity v) => v.value;
  static const Field<PointEntity, int> _f$value = Field('value', _$value);

  @override
  final MappableFields<PointEntity> fields = const {
    #id: _f$id,
    #teamId: _f$teamId,
    #improvisationId: _f$improvisationId,
    #value: _f$value,
  };

  static PointEntity _instantiate(DecodingData data) {
    return PointEntity(
      id: data.dec(_f$id),
      teamId: data.dec(_f$teamId),
      improvisationId: data.dec(_f$improvisationId),
      value: data.dec(_f$value),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static PointEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PointEntity>(map);
  }

  static PointEntity fromJson(String json) {
    return ensureInitialized().decodeJson<PointEntity>(json);
  }
}

mixin PointEntityMappable {
  String toJson() {
    return PointEntityMapper.ensureInitialized().encodeJson<PointEntity>(this as PointEntity);
  }

  Map<String, dynamic> toMap() {
    return PointEntityMapper.ensureInitialized().encodeMap<PointEntity>(this as PointEntity);
  }

  PointEntityCopyWith<PointEntity, PointEntity, PointEntity> get copyWith =>
      _PointEntityCopyWithImpl(this as PointEntity, $identity, $identity);
  @override
  String toString() {
    return PointEntityMapper.ensureInitialized().stringifyValue(this as PointEntity);
  }

  @override
  bool operator ==(Object other) {
    return PointEntityMapper.ensureInitialized().equalsValue(this as PointEntity, other);
  }

  @override
  int get hashCode {
    return PointEntityMapper.ensureInitialized().hashValue(this as PointEntity);
  }
}

extension PointEntityValueCopy<$R, $Out> on ObjectCopyWith<$R, PointEntity, $Out> {
  PointEntityCopyWith<$R, PointEntity, $Out> get $asPointEntity =>
      $base.as((v, t, t2) => _PointEntityCopyWithImpl(v, t, t2));
}

abstract class PointEntityCopyWith<$R, $In extends PointEntity, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, int? teamId, int? improvisationId, int? value});
  PointEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PointEntityCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, PointEntity, $Out>
    implements PointEntityCopyWith<$R, PointEntity, $Out> {
  _PointEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PointEntity> $mapper = PointEntityMapper.ensureInitialized();
  @override
  $R call({int? id, int? teamId, int? improvisationId, int? value}) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (teamId != null) #teamId: teamId,
      if (improvisationId != null) #improvisationId: improvisationId,
      if (value != null) #value: value,
    }),
  );
  @override
  PointEntity $make(CopyWithData data) => PointEntity(
    id: data.get(#id, or: $value.id),
    teamId: data.get(#teamId, or: $value.teamId),
    improvisationId: data.get(#improvisationId, or: $value.improvisationId),
    value: data.get(#value, or: $value.value),
  );

  @override
  PointEntityCopyWith<$R2, PointEntity, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PointEntityCopyWithImpl($value, $cast, t);
}
