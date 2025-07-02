// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'star_model.dart';

class StarModelMapper extends ClassMapperBase<StarModel> {
  StarModelMapper._();

  static StarModelMapper? _instance;
  static StarModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StarModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StarModel';

  static int _$id(StarModel v) => v.id;
  static const Field<StarModel, int> _f$id = Field('id', _$id);
  static int _$performerId(StarModel v) => v.performerId;
  static const Field<StarModel, int> _f$performerId =
      Field('performerId', _$performerId);
  static int _$teamId(StarModel v) => v.teamId;
  static const Field<StarModel, int> _f$teamId = Field('teamId', _$teamId);

  @override
  final MappableFields<StarModel> fields = const {
    #id: _f$id,
    #performerId: _f$performerId,
    #teamId: _f$teamId,
  };

  static StarModel _instantiate(DecodingData data) {
    return StarModel(
        id: data.dec(_f$id),
        performerId: data.dec(_f$performerId),
        teamId: data.dec(_f$teamId));
  }

  @override
  final Function instantiate = _instantiate;

  static StarModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StarModel>(map);
  }

  static StarModel fromJson(String json) {
    return ensureInitialized().decodeJson<StarModel>(json);
  }
}

mixin StarModelMappable {
  String toJson() {
    return StarModelMapper.ensureInitialized()
        .encodeJson<StarModel>(this as StarModel);
  }

  Map<String, dynamic> toMap() {
    return StarModelMapper.ensureInitialized()
        .encodeMap<StarModel>(this as StarModel);
  }

  StarModelCopyWith<StarModel, StarModel, StarModel> get copyWith =>
      _StarModelCopyWithImpl<StarModel, StarModel>(
          this as StarModel, $identity, $identity);
  @override
  String toString() {
    return StarModelMapper.ensureInitialized()
        .stringifyValue(this as StarModel);
  }

  @override
  bool operator ==(Object other) {
    return StarModelMapper.ensureInitialized()
        .equalsValue(this as StarModel, other);
  }

  @override
  int get hashCode {
    return StarModelMapper.ensureInitialized().hashValue(this as StarModel);
  }
}

extension StarModelValueCopy<$R, $Out> on ObjectCopyWith<$R, StarModel, $Out> {
  StarModelCopyWith<$R, StarModel, $Out> get $asStarModel =>
      $base.as((v, t, t2) => _StarModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StarModelCopyWith<$R, $In extends StarModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, int? performerId, int? teamId});
  StarModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StarModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StarModel, $Out>
    implements StarModelCopyWith<$R, StarModel, $Out> {
  _StarModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StarModel> $mapper =
      StarModelMapper.ensureInitialized();
  @override
  $R call({int? id, int? performerId, int? teamId}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (performerId != null) #performerId: performerId,
        if (teamId != null) #teamId: teamId
      }));
  @override
  StarModel $make(CopyWithData data) => StarModel(
      id: data.get(#id, or: $value.id),
      performerId: data.get(#performerId, or: $value.performerId),
      teamId: data.get(#teamId, or: $value.teamId));

  @override
  StarModelCopyWith<$R2, StarModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _StarModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
