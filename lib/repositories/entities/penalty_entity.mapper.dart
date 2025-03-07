// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'penalty_entity.dart';

class PenaltyEntityMapper extends ClassMapperBase<PenaltyEntity> {
  PenaltyEntityMapper._();

  static PenaltyEntityMapper? _instance;
  static PenaltyEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PenaltyEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PenaltyEntity';

  static int _$id(PenaltyEntity v) => v.id;
  static const Field<PenaltyEntity, int> _f$id = Field('id', _$id);
  static bool _$major(PenaltyEntity v) => v.major;
  static const Field<PenaltyEntity, bool> _f$major = Field('major', _$major);
  static String _$type(PenaltyEntity v) => v.type;
  static const Field<PenaltyEntity, String> _f$type = Field('type', _$type);
  static int? _$performerId(PenaltyEntity v) => v.performerId;
  static const Field<PenaltyEntity, int> _f$performerId = Field('performerId', _$performerId);
  static int _$teamId(PenaltyEntity v) => v.teamId;
  static const Field<PenaltyEntity, int> _f$teamId = Field('teamId', _$teamId);
  static int _$improvisationId(PenaltyEntity v) => v.improvisationId;
  static const Field<PenaltyEntity, int> _f$improvisationId = Field('improvisationId', _$improvisationId);

  @override
  final MappableFields<PenaltyEntity> fields = const {
    #id: _f$id,
    #major: _f$major,
    #type: _f$type,
    #performerId: _f$performerId,
    #teamId: _f$teamId,
    #improvisationId: _f$improvisationId,
  };

  static PenaltyEntity _instantiate(DecodingData data) {
    return PenaltyEntity(
      id: data.dec(_f$id),
      major: data.dec(_f$major),
      type: data.dec(_f$type),
      performerId: data.dec(_f$performerId),
      teamId: data.dec(_f$teamId),
      improvisationId: data.dec(_f$improvisationId),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static PenaltyEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PenaltyEntity>(map);
  }

  static PenaltyEntity fromJson(String json) {
    return ensureInitialized().decodeJson<PenaltyEntity>(json);
  }
}

mixin PenaltyEntityMappable {
  String toJson() {
    return PenaltyEntityMapper.ensureInitialized().encodeJson<PenaltyEntity>(this as PenaltyEntity);
  }

  Map<String, dynamic> toMap() {
    return PenaltyEntityMapper.ensureInitialized().encodeMap<PenaltyEntity>(this as PenaltyEntity);
  }

  PenaltyEntityCopyWith<PenaltyEntity, PenaltyEntity, PenaltyEntity> get copyWith =>
      _PenaltyEntityCopyWithImpl(this as PenaltyEntity, $identity, $identity);
  @override
  String toString() {
    return PenaltyEntityMapper.ensureInitialized().stringifyValue(this as PenaltyEntity);
  }

  @override
  bool operator ==(Object other) {
    return PenaltyEntityMapper.ensureInitialized().equalsValue(this as PenaltyEntity, other);
  }

  @override
  int get hashCode {
    return PenaltyEntityMapper.ensureInitialized().hashValue(this as PenaltyEntity);
  }
}

extension PenaltyEntityValueCopy<$R, $Out> on ObjectCopyWith<$R, PenaltyEntity, $Out> {
  PenaltyEntityCopyWith<$R, PenaltyEntity, $Out> get $asPenaltyEntity =>
      $base.as((v, t, t2) => _PenaltyEntityCopyWithImpl(v, t, t2));
}

abstract class PenaltyEntityCopyWith<$R, $In extends PenaltyEntity, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, bool? major, String? type, int? performerId, int? teamId, int? improvisationId});
  PenaltyEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PenaltyEntityCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, PenaltyEntity, $Out>
    implements PenaltyEntityCopyWith<$R, PenaltyEntity, $Out> {
  _PenaltyEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PenaltyEntity> $mapper = PenaltyEntityMapper.ensureInitialized();
  @override
  $R call({int? id, bool? major, String? type, Object? performerId = $none, int? teamId, int? improvisationId}) =>
      $apply(
        FieldCopyWithData({
          if (id != null) #id: id,
          if (major != null) #major: major,
          if (type != null) #type: type,
          if (performerId != $none) #performerId: performerId,
          if (teamId != null) #teamId: teamId,
          if (improvisationId != null) #improvisationId: improvisationId,
        }),
      );
  @override
  PenaltyEntity $make(CopyWithData data) => PenaltyEntity(
    id: data.get(#id, or: $value.id),
    major: data.get(#major, or: $value.major),
    type: data.get(#type, or: $value.type),
    performerId: data.get(#performerId, or: $value.performerId),
    teamId: data.get(#teamId, or: $value.teamId),
    improvisationId: data.get(#improvisationId, or: $value.improvisationId),
  );

  @override
  PenaltyEntityCopyWith<$R2, PenaltyEntity, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PenaltyEntityCopyWithImpl($value, $cast, t);
}
