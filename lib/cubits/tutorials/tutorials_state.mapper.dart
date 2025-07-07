// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tutorials_state.dart';

class TutorialsStateMapper extends ClassMapperBase<TutorialsState> {
  TutorialsStateMapper._();

  static TutorialsStateMapper? _instance;
  static TutorialsStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TutorialsStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TutorialsState';

  static bool _$addPacingFinished(TutorialsState v) => v.addPacingFinished;
  static const Field<TutorialsState, bool> _f$addPacingFinished =
      Field('addPacingFinished', _$addPacingFinished, opt: true, def: false);
  static bool _$startMatchFinished(TutorialsState v) => v.startMatchFinished;
  static const Field<TutorialsState, bool> _f$startMatchFinished =
      Field('startMatchFinished', _$startMatchFinished, opt: true, def: false);
  static bool _$addImprovisationFinished(TutorialsState v) =>
      v.addImprovisationFinished;
  static const Field<TutorialsState, bool> _f$addImprovisationFinished = Field(
      'addImprovisationFinished', _$addImprovisationFinished,
      opt: true, def: false);
  static bool _$improvisationDetailsFinished(TutorialsState v) =>
      v.improvisationDetailsFinished;
  static const Field<TutorialsState, bool> _f$improvisationDetailsFinished =
      Field('improvisationDetailsFinished', _$improvisationDetailsFinished,
          opt: true, def: false);
  static bool _$improvisationDragFinished(TutorialsState v) =>
      v.improvisationDragFinished;
  static const Field<TutorialsState, bool> _f$improvisationDragFinished = Field(
      'improvisationDragFinished', _$improvisationDragFinished,
      opt: true, def: false);

  @override
  final MappableFields<TutorialsState> fields = const {
    #addPacingFinished: _f$addPacingFinished,
    #startMatchFinished: _f$startMatchFinished,
    #addImprovisationFinished: _f$addImprovisationFinished,
    #improvisationDetailsFinished: _f$improvisationDetailsFinished,
    #improvisationDragFinished: _f$improvisationDragFinished,
  };

  static TutorialsState _instantiate(DecodingData data) {
    return TutorialsState(
        addPacingFinished: data.dec(_f$addPacingFinished),
        startMatchFinished: data.dec(_f$startMatchFinished),
        addImprovisationFinished: data.dec(_f$addImprovisationFinished),
        improvisationDetailsFinished: data.dec(_f$improvisationDetailsFinished),
        improvisationDragFinished: data.dec(_f$improvisationDragFinished));
  }

  @override
  final Function instantiate = _instantiate;

  static TutorialsState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TutorialsState>(map);
  }

  static TutorialsState fromJson(String json) {
    return ensureInitialized().decodeJson<TutorialsState>(json);
  }
}

mixin TutorialsStateMappable {
  String toJson() {
    return TutorialsStateMapper.ensureInitialized()
        .encodeJson<TutorialsState>(this as TutorialsState);
  }

  Map<String, dynamic> toMap() {
    return TutorialsStateMapper.ensureInitialized()
        .encodeMap<TutorialsState>(this as TutorialsState);
  }

  TutorialsStateCopyWith<TutorialsState, TutorialsState, TutorialsState>
      get copyWith =>
          _TutorialsStateCopyWithImpl<TutorialsState, TutorialsState>(
              this as TutorialsState, $identity, $identity);
  @override
  String toString() {
    return TutorialsStateMapper.ensureInitialized()
        .stringifyValue(this as TutorialsState);
  }

  @override
  bool operator ==(Object other) {
    return TutorialsStateMapper.ensureInitialized()
        .equalsValue(this as TutorialsState, other);
  }

  @override
  int get hashCode {
    return TutorialsStateMapper.ensureInitialized()
        .hashValue(this as TutorialsState);
  }
}

extension TutorialsStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TutorialsState, $Out> {
  TutorialsStateCopyWith<$R, TutorialsState, $Out> get $asTutorialsState =>
      $base.as((v, t, t2) => _TutorialsStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TutorialsStateCopyWith<$R, $In extends TutorialsState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {bool? addPacingFinished,
      bool? startMatchFinished,
      bool? addImprovisationFinished,
      bool? improvisationDetailsFinished,
      bool? improvisationDragFinished});
  TutorialsStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TutorialsStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TutorialsState, $Out>
    implements TutorialsStateCopyWith<$R, TutorialsState, $Out> {
  _TutorialsStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TutorialsState> $mapper =
      TutorialsStateMapper.ensureInitialized();
  @override
  $R call(
          {bool? addPacingFinished,
          bool? startMatchFinished,
          bool? addImprovisationFinished,
          bool? improvisationDetailsFinished,
          bool? improvisationDragFinished}) =>
      $apply(FieldCopyWithData({
        if (addPacingFinished != null) #addPacingFinished: addPacingFinished,
        if (startMatchFinished != null) #startMatchFinished: startMatchFinished,
        if (addImprovisationFinished != null)
          #addImprovisationFinished: addImprovisationFinished,
        if (improvisationDetailsFinished != null)
          #improvisationDetailsFinished: improvisationDetailsFinished,
        if (improvisationDragFinished != null)
          #improvisationDragFinished: improvisationDragFinished
      }));
  @override
  TutorialsState $make(CopyWithData data) => TutorialsState(
      addPacingFinished:
          data.get(#addPacingFinished, or: $value.addPacingFinished),
      startMatchFinished:
          data.get(#startMatchFinished, or: $value.startMatchFinished),
      addImprovisationFinished: data.get(#addImprovisationFinished,
          or: $value.addImprovisationFinished),
      improvisationDetailsFinished: data.get(#improvisationDetailsFinished,
          or: $value.improvisationDetailsFinished),
      improvisationDragFinished: data.get(#improvisationDragFinished,
          or: $value.improvisationDragFinished));

  @override
  TutorialsStateCopyWith<$R2, TutorialsState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TutorialsStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
