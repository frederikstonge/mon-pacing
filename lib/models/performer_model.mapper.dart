// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'performer_model.dart';

class PerformerModelMapper extends ClassMapperBase<PerformerModel> {
  PerformerModelMapper._();

  static PerformerModelMapper? _instance;
  static PerformerModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PerformerModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PerformerModel';

  static int? _$id(PerformerModel v) => v.id;
  static const Field<PerformerModel, int> _f$id = Field('id', _$id);
  static String _$name(PerformerModel v) => v.name;
  static const Field<PerformerModel, String> _f$name = Field('name', _$name);
  static int? _$teamId(PerformerModel v) => v.teamId;
  static const Field<PerformerModel, int> _f$teamId = Field('teamId', _$teamId);
  static DateTime? _$createdDate(PerformerModel v) => v.createdDate;
  static const Field<PerformerModel, DateTime> _f$createdDate =
      Field('createdDate', _$createdDate, opt: true);
  static DateTime? _$modifiedDate(PerformerModel v) => v.modifiedDate;
  static const Field<PerformerModel, DateTime> _f$modifiedDate =
      Field('modifiedDate', _$modifiedDate, opt: true);
  static String? _$integrationEntityId(PerformerModel v) =>
      v.integrationEntityId;
  static const Field<PerformerModel, String> _f$integrationEntityId =
      Field('integrationEntityId', _$integrationEntityId, opt: true);
  static String? _$integrationAdditionalData(PerformerModel v) =>
      v.integrationAdditionalData;
  static const Field<PerformerModel, String> _f$integrationAdditionalData =
      Field('integrationAdditionalData', _$integrationAdditionalData,
          opt: true);

  @override
  final MappableFields<PerformerModel> fields = const {
    #id: _f$id,
    #name: _f$name,
    #teamId: _f$teamId,
    #createdDate: _f$createdDate,
    #modifiedDate: _f$modifiedDate,
    #integrationEntityId: _f$integrationEntityId,
    #integrationAdditionalData: _f$integrationAdditionalData,
  };

  static PerformerModel _instantiate(DecodingData data) {
    return PerformerModel(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        teamId: data.dec(_f$teamId),
        createdDate: data.dec(_f$createdDate),
        modifiedDate: data.dec(_f$modifiedDate),
        integrationEntityId: data.dec(_f$integrationEntityId),
        integrationAdditionalData: data.dec(_f$integrationAdditionalData));
  }

  @override
  final Function instantiate = _instantiate;

  static PerformerModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PerformerModel>(map);
  }

  static PerformerModel fromJson(String json) {
    return ensureInitialized().decodeJson<PerformerModel>(json);
  }
}

mixin PerformerModelMappable {
  String toJson() {
    return PerformerModelMapper.ensureInitialized()
        .encodeJson<PerformerModel>(this as PerformerModel);
  }

  Map<String, dynamic> toMap() {
    return PerformerModelMapper.ensureInitialized()
        .encodeMap<PerformerModel>(this as PerformerModel);
  }

  PerformerModelCopyWith<PerformerModel, PerformerModel, PerformerModel>
      get copyWith => _PerformerModelCopyWithImpl(
          this as PerformerModel, $identity, $identity);
  @override
  String toString() {
    return PerformerModelMapper.ensureInitialized()
        .stringifyValue(this as PerformerModel);
  }

  @override
  bool operator ==(Object other) {
    return PerformerModelMapper.ensureInitialized()
        .equalsValue(this as PerformerModel, other);
  }

  @override
  int get hashCode {
    return PerformerModelMapper.ensureInitialized()
        .hashValue(this as PerformerModel);
  }
}

extension PerformerModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PerformerModel, $Out> {
  PerformerModelCopyWith<$R, PerformerModel, $Out> get $asPerformerModel =>
      $base.as((v, t, t2) => _PerformerModelCopyWithImpl(v, t, t2));
}

abstract class PerformerModelCopyWith<$R, $In extends PerformerModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      String? name,
      int? teamId,
      DateTime? createdDate,
      DateTime? modifiedDate,
      String? integrationEntityId,
      String? integrationAdditionalData});
  PerformerModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PerformerModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PerformerModel, $Out>
    implements PerformerModelCopyWith<$R, PerformerModel, $Out> {
  _PerformerModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PerformerModel> $mapper =
      PerformerModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          String? name,
          Object? teamId = $none,
          Object? createdDate = $none,
          Object? modifiedDate = $none,
          Object? integrationEntityId = $none,
          Object? integrationAdditionalData = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (name != null) #name: name,
        if (teamId != $none) #teamId: teamId,
        if (createdDate != $none) #createdDate: createdDate,
        if (modifiedDate != $none) #modifiedDate: modifiedDate,
        if (integrationEntityId != $none)
          #integrationEntityId: integrationEntityId,
        if (integrationAdditionalData != $none)
          #integrationAdditionalData: integrationAdditionalData
      }));
  @override
  PerformerModel $make(CopyWithData data) => PerformerModel(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      teamId: data.get(#teamId, or: $value.teamId),
      createdDate: data.get(#createdDate, or: $value.createdDate),
      modifiedDate: data.get(#modifiedDate, or: $value.modifiedDate),
      integrationEntityId:
          data.get(#integrationEntityId, or: $value.integrationEntityId),
      integrationAdditionalData: data.get(#integrationAdditionalData,
          or: $value.integrationAdditionalData));

  @override
  PerformerModelCopyWith<$R2, PerformerModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PerformerModelCopyWithImpl($value, $cast, t);
}
