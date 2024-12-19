// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'point_model.dart';

class PointModelMapper extends ClassMapperBase<PointModel> {
  PointModelMapper._();

  static PointModelMapper? _instance;
  static PointModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PointModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PointModel';

  static int? _$id(PointModel v) => v.id;
  static const Field<PointModel, int> _f$id = Field('id', _$id);
  static int? _$teamId(PointModel v) => v.teamId;
  static const Field<PointModel, int> _f$teamId = Field('teamId', _$teamId);
  static int? _$improvisationId(PointModel v) => v.improvisationId;
  static const Field<PointModel, int> _f$improvisationId =
      Field('improvisationId', _$improvisationId);
  static int _$value(PointModel v) => v.value;
  static const Field<PointModel, int> _f$value = Field('value', _$value);
  static int? _$matchId(PointModel v) => v.matchId;
  static const Field<PointModel, int> _f$matchId = Field('matchId', _$matchId);
  static DateTime? _$createdDate(PointModel v) => v.createdDate;
  static const Field<PointModel, DateTime> _f$createdDate =
      Field('createdDate', _$createdDate, opt: true);
  static DateTime? _$modifiedDate(PointModel v) => v.modifiedDate;
  static const Field<PointModel, DateTime> _f$modifiedDate =
      Field('modifiedDate', _$modifiedDate, opt: true);

  @override
  final MappableFields<PointModel> fields = const {
    #id: _f$id,
    #teamId: _f$teamId,
    #improvisationId: _f$improvisationId,
    #value: _f$value,
    #matchId: _f$matchId,
    #createdDate: _f$createdDate,
    #modifiedDate: _f$modifiedDate,
  };

  static PointModel _instantiate(DecodingData data) {
    return PointModel(
        id: data.dec(_f$id),
        teamId: data.dec(_f$teamId),
        improvisationId: data.dec(_f$improvisationId),
        value: data.dec(_f$value),
        matchId: data.dec(_f$matchId),
        createdDate: data.dec(_f$createdDate),
        modifiedDate: data.dec(_f$modifiedDate));
  }

  @override
  final Function instantiate = _instantiate;

  static PointModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PointModel>(map);
  }

  static PointModel fromJson(String json) {
    return ensureInitialized().decodeJson<PointModel>(json);
  }
}

mixin PointModelMappable {
  String toJson() {
    return PointModelMapper.ensureInitialized()
        .encodeJson<PointModel>(this as PointModel);
  }

  Map<String, dynamic> toMap() {
    return PointModelMapper.ensureInitialized()
        .encodeMap<PointModel>(this as PointModel);
  }

  PointModelCopyWith<PointModel, PointModel, PointModel> get copyWith =>
      _PointModelCopyWithImpl(this as PointModel, $identity, $identity);
  @override
  String toString() {
    return PointModelMapper.ensureInitialized()
        .stringifyValue(this as PointModel);
  }

  @override
  bool operator ==(Object other) {
    return PointModelMapper.ensureInitialized()
        .equalsValue(this as PointModel, other);
  }

  @override
  int get hashCode {
    return PointModelMapper.ensureInitialized().hashValue(this as PointModel);
  }
}

extension PointModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PointModel, $Out> {
  PointModelCopyWith<$R, PointModel, $Out> get $asPointModel =>
      $base.as((v, t, t2) => _PointModelCopyWithImpl(v, t, t2));
}

abstract class PointModelCopyWith<$R, $In extends PointModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      int? teamId,
      int? improvisationId,
      int? value,
      int? matchId,
      DateTime? createdDate,
      DateTime? modifiedDate});
  PointModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PointModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PointModel, $Out>
    implements PointModelCopyWith<$R, PointModel, $Out> {
  _PointModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PointModel> $mapper =
      PointModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? teamId = $none,
          Object? improvisationId = $none,
          int? value,
          Object? matchId = $none,
          Object? createdDate = $none,
          Object? modifiedDate = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (teamId != $none) #teamId: teamId,
        if (improvisationId != $none) #improvisationId: improvisationId,
        if (value != null) #value: value,
        if (matchId != $none) #matchId: matchId,
        if (createdDate != $none) #createdDate: createdDate,
        if (modifiedDate != $none) #modifiedDate: modifiedDate
      }));
  @override
  PointModel $make(CopyWithData data) => PointModel(
      id: data.get(#id, or: $value.id),
      teamId: data.get(#teamId, or: $value.teamId),
      improvisationId: data.get(#improvisationId, or: $value.improvisationId),
      value: data.get(#value, or: $value.value),
      matchId: data.get(#matchId, or: $value.matchId),
      createdDate: data.get(#createdDate, or: $value.createdDate),
      modifiedDate: data.get(#modifiedDate, or: $value.modifiedDate));

  @override
  PointModelCopyWith<$R2, PointModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PointModelCopyWithImpl($value, $cast, t);
}
