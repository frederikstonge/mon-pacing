// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'match_team_model.dart';

class MatchTeamModelMapper extends ClassMapperBase<MatchTeamModel> {
  MatchTeamModelMapper._();

  static MatchTeamModelMapper? _instance;
  static MatchTeamModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MatchTeamModelMapper._());
      PerformerModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MatchTeamModel';

  static int _$id(MatchTeamModel v) => v.id;
  static const Field<MatchTeamModel, int> _f$id = Field('id', _$id);
  static String _$name(MatchTeamModel v) => v.name;
  static const Field<MatchTeamModel, String> _f$name = Field('name', _$name);
  static int _$color(MatchTeamModel v) => v.color;
  static const Field<MatchTeamModel, int> _f$color = Field('color', _$color);
  static List<PerformerModel> _$performers(MatchTeamModel v) => v.performers;
  static const Field<MatchTeamModel, List<PerformerModel>> _f$performers =
      Field('performers', _$performers, opt: true, def: const []);
  static List<String> _$tags(MatchTeamModel v) => v.tags;
  static const Field<MatchTeamModel, List<String>> _f$tags =
      Field('tags', _$tags, opt: true, def: const []);
  static String? _$integrationEntityId(MatchTeamModel v) =>
      v.integrationEntityId;
  static const Field<MatchTeamModel, String> _f$integrationEntityId =
      Field('integrationEntityId', _$integrationEntityId, opt: true);
  static String? _$integrationAdditionalData(MatchTeamModel v) =>
      v.integrationAdditionalData;
  static const Field<MatchTeamModel, String> _f$integrationAdditionalData =
      Field('integrationAdditionalData', _$integrationAdditionalData,
          opt: true);

  @override
  final MappableFields<MatchTeamModel> fields = const {
    #id: _f$id,
    #name: _f$name,
    #color: _f$color,
    #performers: _f$performers,
    #tags: _f$tags,
    #integrationEntityId: _f$integrationEntityId,
    #integrationAdditionalData: _f$integrationAdditionalData,
  };

  static MatchTeamModel _instantiate(DecodingData data) {
    return MatchTeamModel(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        color: data.dec(_f$color),
        performers: data.dec(_f$performers),
        tags: data.dec(_f$tags),
        integrationEntityId: data.dec(_f$integrationEntityId),
        integrationAdditionalData: data.dec(_f$integrationAdditionalData));
  }

  @override
  final Function instantiate = _instantiate;

  static MatchTeamModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MatchTeamModel>(map);
  }

  static MatchTeamModel fromJson(String json) {
    return ensureInitialized().decodeJson<MatchTeamModel>(json);
  }
}

mixin MatchTeamModelMappable {
  String toJson() {
    return MatchTeamModelMapper.ensureInitialized()
        .encodeJson<MatchTeamModel>(this as MatchTeamModel);
  }

  Map<String, dynamic> toMap() {
    return MatchTeamModelMapper.ensureInitialized()
        .encodeMap<MatchTeamModel>(this as MatchTeamModel);
  }

  MatchTeamModelCopyWith<MatchTeamModel, MatchTeamModel, MatchTeamModel>
      get copyWith => _MatchTeamModelCopyWithImpl(
          this as MatchTeamModel, $identity, $identity);
  @override
  String toString() {
    return MatchTeamModelMapper.ensureInitialized()
        .stringifyValue(this as MatchTeamModel);
  }

  @override
  bool operator ==(Object other) {
    return MatchTeamModelMapper.ensureInitialized()
        .equalsValue(this as MatchTeamModel, other);
  }

  @override
  int get hashCode {
    return MatchTeamModelMapper.ensureInitialized()
        .hashValue(this as MatchTeamModel);
  }
}

extension MatchTeamModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MatchTeamModel, $Out> {
  MatchTeamModelCopyWith<$R, MatchTeamModel, $Out> get $asMatchTeamModel =>
      $base.as((v, t, t2) => _MatchTeamModelCopyWithImpl(v, t, t2));
}

abstract class MatchTeamModelCopyWith<$R, $In extends MatchTeamModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, PerformerModel,
          PerformerModelCopyWith<$R, PerformerModel, PerformerModel>>
      get performers;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags;
  $R call(
      {int? id,
      String? name,
      int? color,
      List<PerformerModel>? performers,
      List<String>? tags,
      String? integrationEntityId,
      String? integrationAdditionalData});
  MatchTeamModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MatchTeamModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MatchTeamModel, $Out>
    implements MatchTeamModelCopyWith<$R, MatchTeamModel, $Out> {
  _MatchTeamModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MatchTeamModel> $mapper =
      MatchTeamModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, PerformerModel,
          PerformerModelCopyWith<$R, PerformerModel, PerformerModel>>
      get performers => ListCopyWith($value.performers,
          (v, t) => v.copyWith.$chain(t), (v) => call(performers: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags =>
      ListCopyWith($value.tags, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(tags: v));
  @override
  $R call(
          {int? id,
          String? name,
          int? color,
          List<PerformerModel>? performers,
          List<String>? tags,
          Object? integrationEntityId = $none,
          Object? integrationAdditionalData = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (color != null) #color: color,
        if (performers != null) #performers: performers,
        if (tags != null) #tags: tags,
        if (integrationEntityId != $none)
          #integrationEntityId: integrationEntityId,
        if (integrationAdditionalData != $none)
          #integrationAdditionalData: integrationAdditionalData
      }));
  @override
  MatchTeamModel $make(CopyWithData data) => MatchTeamModel(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      color: data.get(#color, or: $value.color),
      performers: data.get(#performers, or: $value.performers),
      tags: data.get(#tags, or: $value.tags),
      integrationEntityId:
          data.get(#integrationEntityId, or: $value.integrationEntityId),
      integrationAdditionalData: data.get(#integrationAdditionalData,
          or: $value.integrationAdditionalData));

  @override
  MatchTeamModelCopyWith<$R2, MatchTeamModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MatchTeamModelCopyWithImpl($value, $cast, t);
}
