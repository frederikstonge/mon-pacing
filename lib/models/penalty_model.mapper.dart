// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'penalty_model.dart';

class PenaltyModelMapper extends ClassMapperBase<PenaltyModel> {
  PenaltyModelMapper._();

  static PenaltyModelMapper? _instance;
  static PenaltyModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PenaltyModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PenaltyModel';

  static int? _$id(PenaltyModel v) => v.id;
  static const Field<PenaltyModel, int> _f$id = Field('id', _$id);
  static bool _$major(PenaltyModel v) => v.major;
  static const Field<PenaltyModel, bool> _f$major = Field('major', _$major);
  static String _$type(PenaltyModel v) => v.type;
  static const Field<PenaltyModel, String> _f$type = Field('type', _$type);
  static int? _$performerId(PenaltyModel v) => v.performerId;
  static const Field<PenaltyModel, int> _f$performerId =
      Field('performerId', _$performerId);
  static int? _$improvisationId(PenaltyModel v) => v.improvisationId;
  static const Field<PenaltyModel, int> _f$improvisationId =
      Field('improvisationId', _$improvisationId);
  static int? _$teamId(PenaltyModel v) => v.teamId;
  static const Field<PenaltyModel, int> _f$teamId = Field('teamId', _$teamId);
  static int? _$matchId(PenaltyModel v) => v.matchId;
  static const Field<PenaltyModel, int> _f$matchId =
      Field('matchId', _$matchId);
  static DateTime? _$createdDate(PenaltyModel v) => v.createdDate;
  static const Field<PenaltyModel, DateTime> _f$createdDate =
      Field('createdDate', _$createdDate, opt: true);
  static DateTime? _$modifiedDate(PenaltyModel v) => v.modifiedDate;
  static const Field<PenaltyModel, DateTime> _f$modifiedDate =
      Field('modifiedDate', _$modifiedDate, opt: true);

  @override
  final MappableFields<PenaltyModel> fields = const {
    #id: _f$id,
    #major: _f$major,
    #type: _f$type,
    #performerId: _f$performerId,
    #improvisationId: _f$improvisationId,
    #teamId: _f$teamId,
    #matchId: _f$matchId,
    #createdDate: _f$createdDate,
    #modifiedDate: _f$modifiedDate,
  };

  static PenaltyModel _instantiate(DecodingData data) {
    return PenaltyModel(
        id: data.dec(_f$id),
        major: data.dec(_f$major),
        type: data.dec(_f$type),
        performerId: data.dec(_f$performerId),
        improvisationId: data.dec(_f$improvisationId),
        teamId: data.dec(_f$teamId),
        matchId: data.dec(_f$matchId),
        createdDate: data.dec(_f$createdDate),
        modifiedDate: data.dec(_f$modifiedDate));
  }

  @override
  final Function instantiate = _instantiate;

  static PenaltyModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PenaltyModel>(map);
  }

  static PenaltyModel fromJson(String json) {
    return ensureInitialized().decodeJson<PenaltyModel>(json);
  }
}

mixin PenaltyModelMappable {
  String toJson() {
    return PenaltyModelMapper.ensureInitialized()
        .encodeJson<PenaltyModel>(this as PenaltyModel);
  }

  Map<String, dynamic> toMap() {
    return PenaltyModelMapper.ensureInitialized()
        .encodeMap<PenaltyModel>(this as PenaltyModel);
  }

  PenaltyModelCopyWith<PenaltyModel, PenaltyModel, PenaltyModel> get copyWith =>
      _PenaltyModelCopyWithImpl(this as PenaltyModel, $identity, $identity);
  @override
  String toString() {
    return PenaltyModelMapper.ensureInitialized()
        .stringifyValue(this as PenaltyModel);
  }

  @override
  bool operator ==(Object other) {
    return PenaltyModelMapper.ensureInitialized()
        .equalsValue(this as PenaltyModel, other);
  }

  @override
  int get hashCode {
    return PenaltyModelMapper.ensureInitialized()
        .hashValue(this as PenaltyModel);
  }
}

extension PenaltyModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PenaltyModel, $Out> {
  PenaltyModelCopyWith<$R, PenaltyModel, $Out> get $asPenaltyModel =>
      $base.as((v, t, t2) => _PenaltyModelCopyWithImpl(v, t, t2));
}

abstract class PenaltyModelCopyWith<$R, $In extends PenaltyModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      bool? major,
      String? type,
      int? performerId,
      int? improvisationId,
      int? teamId,
      int? matchId,
      DateTime? createdDate,
      DateTime? modifiedDate});
  PenaltyModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PenaltyModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PenaltyModel, $Out>
    implements PenaltyModelCopyWith<$R, PenaltyModel, $Out> {
  _PenaltyModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PenaltyModel> $mapper =
      PenaltyModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          bool? major,
          String? type,
          Object? performerId = $none,
          Object? improvisationId = $none,
          Object? teamId = $none,
          Object? matchId = $none,
          Object? createdDate = $none,
          Object? modifiedDate = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (major != null) #major: major,
        if (type != null) #type: type,
        if (performerId != $none) #performerId: performerId,
        if (improvisationId != $none) #improvisationId: improvisationId,
        if (teamId != $none) #teamId: teamId,
        if (matchId != $none) #matchId: matchId,
        if (createdDate != $none) #createdDate: createdDate,
        if (modifiedDate != $none) #modifiedDate: modifiedDate
      }));
  @override
  PenaltyModel $make(CopyWithData data) => PenaltyModel(
      id: data.get(#id, or: $value.id),
      major: data.get(#major, or: $value.major),
      type: data.get(#type, or: $value.type),
      performerId: data.get(#performerId, or: $value.performerId),
      improvisationId: data.get(#improvisationId, or: $value.improvisationId),
      teamId: data.get(#teamId, or: $value.teamId),
      matchId: data.get(#matchId, or: $value.matchId),
      createdDate: data.get(#createdDate, or: $value.createdDate),
      modifiedDate: data.get(#modifiedDate, or: $value.modifiedDate));

  @override
  PenaltyModelCopyWith<$R2, PenaltyModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PenaltyModelCopyWithImpl($value, $cast, t);
}
