// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'improvisation_entity.dart';

class ImprovisationEntityMapper extends ClassMapperBase<ImprovisationEntity> {
  ImprovisationEntityMapper._();

  static ImprovisationEntityMapper? _instance;
  static ImprovisationEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ImprovisationEntityMapper._());
      ImprovisationTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ImprovisationEntity';

  static int _$id(ImprovisationEntity v) => v.id;
  static const Field<ImprovisationEntity, int> _f$id = Field('id', _$id);
  static ImprovisationType _$type(ImprovisationEntity v) => v.type;
  static const Field<ImprovisationEntity, ImprovisationType> _f$type =
      Field('type', _$type);
  static String _$category(ImprovisationEntity v) => v.category;
  static const Field<ImprovisationEntity, String> _f$category =
      Field('category', _$category);
  static String _$theme(ImprovisationEntity v) => v.theme;
  static const Field<ImprovisationEntity, String> _f$theme =
      Field('theme', _$theme);
  static List<int> _$durationsInSeconds(ImprovisationEntity v) =>
      v.durationsInSeconds;
  static const Field<ImprovisationEntity, List<int>> _f$durationsInSeconds =
      Field('durationsInSeconds', _$durationsInSeconds);
  static String _$performers(ImprovisationEntity v) => v.performers;
  static const Field<ImprovisationEntity, String> _f$performers =
      Field('performers', _$performers);
  static String _$notes(ImprovisationEntity v) => v.notes;
  static const Field<ImprovisationEntity, String> _f$notes =
      Field('notes', _$notes);
  static int _$timeBufferInSeconds(ImprovisationEntity v) =>
      v.timeBufferInSeconds;
  static const Field<ImprovisationEntity, int> _f$timeBufferInSeconds =
      Field('timeBufferInSeconds', _$timeBufferInSeconds, opt: true, def: 30);
  static int _$huddleTimerInSeconds(ImprovisationEntity v) =>
      v.huddleTimerInSeconds;
  static const Field<ImprovisationEntity, int> _f$huddleTimerInSeconds =
      Field('huddleTimerInSeconds', _$huddleTimerInSeconds, opt: true, def: 30);
  static String? _$integrationEntityId(ImprovisationEntity v) =>
      v.integrationEntityId;
  static const Field<ImprovisationEntity, String> _f$integrationEntityId =
      Field('integrationEntityId', _$integrationEntityId, opt: true);
  static String? _$integrationAdditionalData(ImprovisationEntity v) =>
      v.integrationAdditionalData;
  static const Field<ImprovisationEntity, String> _f$integrationAdditionalData =
      Field('integrationAdditionalData', _$integrationAdditionalData,
          opt: true);

  @override
  final MappableFields<ImprovisationEntity> fields = const {
    #id: _f$id,
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

  static ImprovisationEntity _instantiate(DecodingData data) {
    return ImprovisationEntity(
        id: data.dec(_f$id),
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

  static ImprovisationEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ImprovisationEntity>(map);
  }

  static ImprovisationEntity fromJson(String json) {
    return ensureInitialized().decodeJson<ImprovisationEntity>(json);
  }
}

mixin ImprovisationEntityMappable {
  String toJson() {
    return ImprovisationEntityMapper.ensureInitialized()
        .encodeJson<ImprovisationEntity>(this as ImprovisationEntity);
  }

  Map<String, dynamic> toMap() {
    return ImprovisationEntityMapper.ensureInitialized()
        .encodeMap<ImprovisationEntity>(this as ImprovisationEntity);
  }

  ImprovisationEntityCopyWith<ImprovisationEntity, ImprovisationEntity,
          ImprovisationEntity>
      get copyWith => _ImprovisationEntityCopyWithImpl(
          this as ImprovisationEntity, $identity, $identity);
  @override
  String toString() {
    return ImprovisationEntityMapper.ensureInitialized()
        .stringifyValue(this as ImprovisationEntity);
  }

  @override
  bool operator ==(Object other) {
    return ImprovisationEntityMapper.ensureInitialized()
        .equalsValue(this as ImprovisationEntity, other);
  }

  @override
  int get hashCode {
    return ImprovisationEntityMapper.ensureInitialized()
        .hashValue(this as ImprovisationEntity);
  }
}

extension ImprovisationEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ImprovisationEntity, $Out> {
  ImprovisationEntityCopyWith<$R, ImprovisationEntity, $Out>
      get $asImprovisationEntity =>
          $base.as((v, t, t2) => _ImprovisationEntityCopyWithImpl(v, t, t2));
}

abstract class ImprovisationEntityCopyWith<$R, $In extends ImprovisationEntity,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get durationsInSeconds;
  $R call(
      {int? id,
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
  ImprovisationEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ImprovisationEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ImprovisationEntity, $Out>
    implements ImprovisationEntityCopyWith<$R, ImprovisationEntity, $Out> {
  _ImprovisationEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ImprovisationEntity> $mapper =
      ImprovisationEntityMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get durationsInSeconds =>
      ListCopyWith(
          $value.durationsInSeconds,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(durationsInSeconds: v));
  @override
  $R call(
          {int? id,
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
  ImprovisationEntity $make(CopyWithData data) => ImprovisationEntity(
      id: data.get(#id, or: $value.id),
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
  ImprovisationEntityCopyWith<$R2, ImprovisationEntity, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ImprovisationEntityCopyWithImpl($value, $cast, t);
}
