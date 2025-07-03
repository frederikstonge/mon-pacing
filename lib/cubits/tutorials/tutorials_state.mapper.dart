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

  static bool _$pacingsFinished(TutorialsState v) => v.pacingsFinished;
  static const Field<TutorialsState, bool> _f$pacingsFinished =
      Field('pacingsFinished', _$pacingsFinished, opt: true, def: false);

  @override
  final MappableFields<TutorialsState> fields = const {
    #pacingsFinished: _f$pacingsFinished,
  };

  static TutorialsState _instantiate(DecodingData data) {
    return TutorialsState(pacingsFinished: data.dec(_f$pacingsFinished));
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
  $R call({bool? pacingsFinished});
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
  $R call({bool? pacingsFinished}) => $apply(FieldCopyWithData(
      {if (pacingsFinished != null) #pacingsFinished: pacingsFinished}));
  @override
  TutorialsState $make(CopyWithData data) => TutorialsState(
      pacingsFinished: data.get(#pacingsFinished, or: $value.pacingsFinished));

  @override
  TutorialsStateCopyWith<$R2, TutorialsState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TutorialsStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
