// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'improvisation_model.dart';

class ImprovisationModelMapper extends ClassMapperBase<ImprovisationModel> {
  ImprovisationModelMapper._();

  static ImprovisationModelMapper? _instance;
  static ImprovisationModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ImprovisationModelMapper._());
      ImprovisationTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ImprovisationModel';

  static int _$id(ImprovisationModel v) => v.id;
  static const Field<ImprovisationModel, int> _f$id = Field('id', _$id);
  static int _$order(ImprovisationModel v) => v.order;
  static const Field<ImprovisationModel, int> _f$order =
      Field('order', _$order);
  static ImprovisationType _$type(ImprovisationModel v) => v.type;
  static const Field<ImprovisationModel, ImprovisationType> _f$type =
      Field('type', _$type);
  static String _$category(ImprovisationModel v) => v.category;
  static const Field<ImprovisationModel, String> _f$category =
      Field('category', _$category);
  static String _$theme(ImprovisationModel v) => v.theme;
  static const Field<ImprovisationModel, String> _f$theme =
      Field('theme', _$theme);
  static List<int> _$durationsInSeconds(ImprovisationModel v) =>
      v.durationsInSeconds;
  static const Field<ImprovisationModel, List<int>> _f$durationsInSeconds =
      Field('durationsInSeconds', _$durationsInSeconds);
  static String _$performers(ImprovisationModel v) => v.performers;
  static const Field<ImprovisationModel, String> _f$performers =
      Field('performers', _$performers);
  static String _$notes(ImprovisationModel v) => v.notes;
  static const Field<ImprovisationModel, String> _f$notes =
      Field('notes', _$notes);
  static int _$timeBufferInSeconds(ImprovisationModel v) =>
      v.timeBufferInSeconds;
  static const Field<ImprovisationModel, int> _f$timeBufferInSeconds =
      Field('timeBufferInSeconds', _$timeBufferInSeconds, opt: true, def: 30);
  static int _$huddleTimerInSeconds(ImprovisationModel v) =>
      v.huddleTimerInSeconds;
  static const Field<ImprovisationModel, int> _f$huddleTimerInSeconds =
      Field('huddleTimerInSeconds', _$huddleTimerInSeconds, opt: true, def: 30);
  static String? _$integrationEntityId(ImprovisationModel v) =>
      v.integrationEntityId;
  static const Field<ImprovisationModel, String> _f$integrationEntityId =
      Field('integrationEntityId', _$integrationEntityId, opt: true);
  static String? _$integrationAdditionalData(ImprovisationModel v) =>
      v.integrationAdditionalData;
  static const Field<ImprovisationModel, String> _f$integrationAdditionalData =
      Field('integrationAdditionalData', _$integrationAdditionalData,
          opt: true);

  @override
  final MappableFields<ImprovisationModel> fields = const {
    #id: _f$id,
    #order: _f$order,
    #type: _f$type,
    #category: _f$category,
    #theme: _f$theme,
    #durationsInSeconds: _f$durationsInSeconds,
    #performers: _f$performers,
    #notes: _f$notes,
    #timeBufferInSeconds: _f$timeBufferInSeconds,
    #huddleTimerInSeconds: _f$huddleTimerInSeconds,
    #integrationEntityId: _f$integrationEntityId,
    #integrationAdditionalData: _f$integrationAdditionalData,
  };

  static ImprovisationModel _instantiate(DecodingData data) {
    return ImprovisationModel(
        id: data.dec(_f$id),
        order: data.dec(_f$order),
        type: data.dec(_f$type),
        category: data.dec(_f$category),
        theme: data.dec(_f$theme),
        durationsInSeconds: data.dec(_f$durationsInSeconds),
        performers: data.dec(_f$performers),
        notes: data.dec(_f$notes),
        timeBufferInSeconds: data.dec(_f$timeBufferInSeconds),
        huddleTimerInSeconds: data.dec(_f$huddleTimerInSeconds),
        integrationEntityId: data.dec(_f$integrationEntityId),
        integrationAdditionalData: data.dec(_f$integrationAdditionalData));
  }

  @override
  final Function instantiate = _instantiate;

  static ImprovisationModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ImprovisationModel>(map);
  }

  static ImprovisationModel fromJson(String json) {
    return ensureInitialized().decodeJson<ImprovisationModel>(json);
  }
}

mixin ImprovisationModelMappable {
  String toJson() {
    return ImprovisationModelMapper.ensureInitialized()
        .encodeJson<ImprovisationModel>(this as ImprovisationModel);
  }

  Map<String, dynamic> toMap() {
    return ImprovisationModelMapper.ensureInitialized()
        .encodeMap<ImprovisationModel>(this as ImprovisationModel);
  }

  ImprovisationModelCopyWith<ImprovisationModel, ImprovisationModel,
          ImprovisationModel>
      get copyWith => _ImprovisationModelCopyWithImpl(
          this as ImprovisationModel, $identity, $identity);
  @override
  String toString() {
    return ImprovisationModelMapper.ensureInitialized()
        .stringifyValue(this as ImprovisationModel);
  }

  @override
  bool operator ==(Object other) {
    return ImprovisationModelMapper.ensureInitialized()
        .equalsValue(this as ImprovisationModel, other);
  }

  @override
  int get hashCode {
    return ImprovisationModelMapper.ensureInitialized()
        .hashValue(this as ImprovisationModel);
  }
}

extension ImprovisationModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ImprovisationModel, $Out> {
  ImprovisationModelCopyWith<$R, ImprovisationModel, $Out>
      get $asImprovisationModel =>
          $base.as((v, t, t2) => _ImprovisationModelCopyWithImpl(v, t, t2));
}

abstract class ImprovisationModelCopyWith<$R, $In extends ImprovisationModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get durationsInSeconds;
  $R call(
      {int? id,
      int? order,
      ImprovisationType? type,
      String? category,
      String? theme,
      List<int>? durationsInSeconds,
      String? performers,
      String? notes,
      int? timeBufferInSeconds,
      int? huddleTimerInSeconds,
      String? integrationEntityId,
      String? integrationAdditionalData});
  ImprovisationModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ImprovisationModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ImprovisationModel, $Out>
    implements ImprovisationModelCopyWith<$R, ImprovisationModel, $Out> {
  _ImprovisationModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ImprovisationModel> $mapper =
      ImprovisationModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get durationsInSeconds =>
      ListCopyWith(
          $value.durationsInSeconds,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(durationsInSeconds: v));
  @override
  $R call(
          {int? id,
          int? order,
          ImprovisationType? type,
          String? category,
          String? theme,
          List<int>? durationsInSeconds,
          String? performers,
          String? notes,
          int? timeBufferInSeconds,
          int? huddleTimerInSeconds,
          Object? integrationEntityId = $none,
          Object? integrationAdditionalData = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (order != null) #order: order,
        if (type != null) #type: type,
        if (category != null) #category: category,
        if (theme != null) #theme: theme,
        if (durationsInSeconds != null) #durationsInSeconds: durationsInSeconds,
        if (performers != null) #performers: performers,
        if (notes != null) #notes: notes,
        if (timeBufferInSeconds != null)
          #timeBufferInSeconds: timeBufferInSeconds,
        if (huddleTimerInSeconds != null)
          #huddleTimerInSeconds: huddleTimerInSeconds,
        if (integrationEntityId != $none)
          #integrationEntityId: integrationEntityId,
        if (integrationAdditionalData != $none)
          #integrationAdditionalData: integrationAdditionalData
      }));
  @override
  ImprovisationModel $make(CopyWithData data) => ImprovisationModel(
      id: data.get(#id, or: $value.id),
      order: data.get(#order, or: $value.order),
      type: data.get(#type, or: $value.type),
      category: data.get(#category, or: $value.category),
      theme: data.get(#theme, or: $value.theme),
      durationsInSeconds:
          data.get(#durationsInSeconds, or: $value.durationsInSeconds),
      performers: data.get(#performers, or: $value.performers),
      notes: data.get(#notes, or: $value.notes),
      timeBufferInSeconds:
          data.get(#timeBufferInSeconds, or: $value.timeBufferInSeconds),
      huddleTimerInSeconds:
          data.get(#huddleTimerInSeconds, or: $value.huddleTimerInSeconds),
      integrationEntityId:
          data.get(#integrationEntityId, or: $value.integrationEntityId),
      integrationAdditionalData: data.get(#integrationAdditionalData,
          or: $value.integrationAdditionalData));

  @override
  ImprovisationModelCopyWith<$R2, ImprovisationModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ImprovisationModelCopyWithImpl($value, $cast, t);
}
