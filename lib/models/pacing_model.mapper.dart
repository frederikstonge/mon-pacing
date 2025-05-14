// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pacing_model.dart';

class PacingModelMapper extends ClassMapperBase<PacingModel> {
  PacingModelMapper._();

  static PacingModelMapper? _instance;
  static PacingModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PacingModelMapper._());
      ImprovisationModelMapper.ensureInitialized();
      TagModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PacingModel';

  static int _$id(PacingModel v) => v.id;
  static const Field<PacingModel, int> _f$id = Field('id', _$id);
  static String _$name(PacingModel v) => v.name;
  static const Field<PacingModel, String> _f$name = Field('name', _$name);
  static DateTime? _$createdDate(PacingModel v) => v.createdDate;
  static const Field<PacingModel, DateTime> _f$createdDate =
      Field('createdDate', _$createdDate);
  static DateTime? _$modifiedDate(PacingModel v) => v.modifiedDate;
  static const Field<PacingModel, DateTime> _f$modifiedDate =
      Field('modifiedDate', _$modifiedDate);
  static List<ImprovisationModel> _$improvisations(PacingModel v) =>
      v.improvisations;
  static const Field<PacingModel, List<ImprovisationModel>> _f$improvisations =
      Field('improvisations', _$improvisations);
  static int _$defaultNumberOfTeams(PacingModel v) => v.defaultNumberOfTeams;
  static const Field<PacingModel, int> _f$defaultNumberOfTeams =
      Field('defaultNumberOfTeams', _$defaultNumberOfTeams, opt: true, def: 2);
  static String? _$integrationId(PacingModel v) => v.integrationId;
  static const Field<PacingModel, String> _f$integrationId =
      Field('integrationId', _$integrationId, opt: true);
  static String? _$integrationEntityId(PacingModel v) => v.integrationEntityId;
  static const Field<PacingModel, String> _f$integrationEntityId =
      Field('integrationEntityId', _$integrationEntityId, opt: true);
  static String? _$integrationAdditionalData(PacingModel v) =>
      v.integrationAdditionalData;
  static const Field<PacingModel, String> _f$integrationAdditionalData = Field(
      'integrationAdditionalData', _$integrationAdditionalData,
      opt: true);
  static List<TagModel> _$tags(PacingModel v) => v.tags;
  static const Field<PacingModel, List<TagModel>> _f$tags =
      Field('tags', _$tags, opt: true, def: const []);

  @override
  final MappableFields<PacingModel> fields = const {
    #id: _f$id,
    #name: _f$name,
    #createdDate: _f$createdDate,
    #modifiedDate: _f$modifiedDate,
    #improvisations: _f$improvisations,
    #defaultNumberOfTeams: _f$defaultNumberOfTeams,
    #integrationId: _f$integrationId,
    #integrationEntityId: _f$integrationEntityId,
    #integrationAdditionalData: _f$integrationAdditionalData,
    #tags: _f$tags,
  };

  static PacingModel _instantiate(DecodingData data) {
    return PacingModel(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        createdDate: data.dec(_f$createdDate),
        modifiedDate: data.dec(_f$modifiedDate),
        improvisations: data.dec(_f$improvisations),
        defaultNumberOfTeams: data.dec(_f$defaultNumberOfTeams),
        integrationId: data.dec(_f$integrationId),
        integrationEntityId: data.dec(_f$integrationEntityId),
        integrationAdditionalData: data.dec(_f$integrationAdditionalData),
        tags: data.dec(_f$tags));
  }

  @override
  final Function instantiate = _instantiate;

  static PacingModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PacingModel>(map);
  }

  static PacingModel fromJson(String json) {
    return ensureInitialized().decodeJson<PacingModel>(json);
  }
}

mixin PacingModelMappable {
  String toJson() {
    return PacingModelMapper.ensureInitialized()
        .encodeJson<PacingModel>(this as PacingModel);
  }

  Map<String, dynamic> toMap() {
    return PacingModelMapper.ensureInitialized()
        .encodeMap<PacingModel>(this as PacingModel);
  }

  PacingModelCopyWith<PacingModel, PacingModel, PacingModel> get copyWith =>
      _PacingModelCopyWithImpl(this as PacingModel, $identity, $identity);
  @override
  String toString() {
    return PacingModelMapper.ensureInitialized()
        .stringifyValue(this as PacingModel);
  }

  @override
  bool operator ==(Object other) {
    return PacingModelMapper.ensureInitialized()
        .equalsValue(this as PacingModel, other);
  }

  @override
  int get hashCode {
    return PacingModelMapper.ensureInitialized().hashValue(this as PacingModel);
  }
}

extension PacingModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PacingModel, $Out> {
  PacingModelCopyWith<$R, PacingModel, $Out> get $asPacingModel =>
      $base.as((v, t, t2) => _PacingModelCopyWithImpl(v, t, t2));
}

abstract class PacingModelCopyWith<$R, $In extends PacingModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      ImprovisationModel,
      ImprovisationModelCopyWith<$R, ImprovisationModel,
          ImprovisationModel>> get improvisations;
  ListCopyWith<$R, TagModel, TagModelCopyWith<$R, TagModel, TagModel>> get tags;
  $R call(
      {int? id,
      String? name,
      DateTime? createdDate,
      DateTime? modifiedDate,
      List<ImprovisationModel>? improvisations,
      int? defaultNumberOfTeams,
      String? integrationId,
      String? integrationEntityId,
      String? integrationAdditionalData,
      List<TagModel>? tags});
  PacingModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PacingModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PacingModel, $Out>
    implements PacingModelCopyWith<$R, PacingModel, $Out> {
  _PacingModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PacingModel> $mapper =
      PacingModelMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      ImprovisationModel,
      ImprovisationModelCopyWith<$R, ImprovisationModel,
          ImprovisationModel>> get improvisations => ListCopyWith(
      $value.improvisations,
      (v, t) => v.copyWith.$chain(t),
      (v) => call(improvisations: v));
  @override
  ListCopyWith<$R, TagModel, TagModelCopyWith<$R, TagModel, TagModel>>
      get tags => ListCopyWith(
          $value.tags, (v, t) => v.copyWith.$chain(t), (v) => call(tags: v));
  @override
  $R call(
          {int? id,
          String? name,
          Object? createdDate = $none,
          Object? modifiedDate = $none,
          List<ImprovisationModel>? improvisations,
          int? defaultNumberOfTeams,
          Object? integrationId = $none,
          Object? integrationEntityId = $none,
          Object? integrationAdditionalData = $none,
          List<TagModel>? tags}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (createdDate != $none) #createdDate: createdDate,
        if (modifiedDate != $none) #modifiedDate: modifiedDate,
        if (improvisations != null) #improvisations: improvisations,
        if (defaultNumberOfTeams != null)
          #defaultNumberOfTeams: defaultNumberOfTeams,
        if (integrationId != $none) #integrationId: integrationId,
        if (integrationEntityId != $none)
          #integrationEntityId: integrationEntityId,
        if (integrationAdditionalData != $none)
          #integrationAdditionalData: integrationAdditionalData,
        if (tags != null) #tags: tags
      }));
  @override
  PacingModel $make(CopyWithData data) => PacingModel(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      createdDate: data.get(#createdDate, or: $value.createdDate),
      modifiedDate: data.get(#modifiedDate, or: $value.modifiedDate),
      improvisations: data.get(#improvisations, or: $value.improvisations),
      defaultNumberOfTeams:
          data.get(#defaultNumberOfTeams, or: $value.defaultNumberOfTeams),
      integrationId: data.get(#integrationId, or: $value.integrationId),
      integrationEntityId:
          data.get(#integrationEntityId, or: $value.integrationEntityId),
      integrationAdditionalData: data.get(#integrationAdditionalData,
          or: $value.integrationAdditionalData),
      tags: data.get(#tags, or: $value.tags));

  @override
  PacingModelCopyWith<$R2, PacingModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PacingModelCopyWithImpl($value, $cast, t);
}
