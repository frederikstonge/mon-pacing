// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'star_entity.dart';

class StarEntityMapper extends ClassMapperBase<StarEntity> {
  StarEntityMapper._();

  static StarEntityMapper? _instance;
  static StarEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StarEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StarEntity';

  static int _$id(StarEntity v) => v.id;
  static const Field<StarEntity, int> _f$id = Field('id', _$id);
  static int _$performerId(StarEntity v) => v.performerId;
  static const Field<StarEntity, int> _f$performerId =
      Field('performerId', _$performerId);
  static int _$teamId(StarEntity v) => v.teamId;
  static const Field<StarEntity, int> _f$teamId = Field('teamId', _$teamId);

  @override
  final MappableFields<StarEntity> fields = const {
    #id: _f$id,
    #performerId: _f$performerId,
    #teamId: _f$teamId,
  };

  static StarEntity _instantiate(DecodingData data) {
    return StarEntity(
        id: data.dec(_f$id),
        performerId: data.dec(_f$performerId),
        teamId: data.dec(_f$teamId));
  }

  @override
  final Function instantiate = _instantiate;

  static StarEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StarEntity>(map);
  }

  static StarEntity fromJson(String json) {
    return ensureInitialized().decodeJson<StarEntity>(json);
  }
}

mixin StarEntityMappable {
  String toJson() {
    return StarEntityMapper.ensureInitialized()
        .encodeJson<StarEntity>(this as StarEntity);
  }

  Map<String, dynamic> toMap() {
    return StarEntityMapper.ensureInitialized()
        .encodeMap<StarEntity>(this as StarEntity);
  }

  StarEntityCopyWith<StarEntity, StarEntity, StarEntity> get copyWith =>
      _StarEntityCopyWithImpl(this as StarEntity, $identity, $identity);
  @override
  String toString() {
    return StarEntityMapper.ensureInitialized()
        .stringifyValue(this as StarEntity);
  }

  @override
  bool operator ==(Object other) {
    return StarEntityMapper.ensureInitialized()
        .equalsValue(this as StarEntity, other);
  }

  @override
  int get hashCode {
    return StarEntityMapper.ensureInitialized().hashValue(this as StarEntity);
  }
}

extension StarEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StarEntity, $Out> {
  StarEntityCopyWith<$R, StarEntity, $Out> get $asStarEntity =>
      $base.as((v, t, t2) => _StarEntityCopyWithImpl(v, t, t2));
}

abstract class StarEntityCopyWith<$R, $In extends StarEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, int? performerId, int? teamId});
  StarEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StarEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StarEntity, $Out>
    implements StarEntityCopyWith<$R, StarEntity, $Out> {
  _StarEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StarEntity> $mapper =
      StarEntityMapper.ensureInitialized();
  @override
  $R call({int? id, int? performerId, int? teamId}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (performerId != null) #performerId: performerId,
        if (teamId != null) #teamId: teamId
      }));
  @override
  StarEntity $make(CopyWithData data) => StarEntity(
      id: data.get(#id, or: $value.id),
      performerId: data.get(#performerId, or: $value.performerId),
      teamId: data.get(#teamId, or: $value.teamId));

  @override
  StarEntityCopyWith<$R2, StarEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _StarEntityCopyWithImpl($value, $cast, t);
}
