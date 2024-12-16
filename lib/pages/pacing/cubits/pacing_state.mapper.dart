// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pacing_state.dart';

class PacingStateMapper extends ClassMapperBase<PacingState> {
  PacingStateMapper._();

  static PacingStateMapper? _instance;
  static PacingStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PacingStateMapper._());
      PacingStatusMapper.ensureInitialized();
      PacingModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PacingState';

  static PacingStatus _$status(PacingState v) => v.status;
  static const Field<PacingState, PacingStatus> _f$status =
      Field('status', _$status);
  static String? _$error(PacingState v) => v.error;
  static const Field<PacingState, String> _f$error =
      Field('error', _$error, opt: true);
  static PacingModel? _$pacing(PacingState v) => v.pacing;
  static const Field<PacingState, PacingModel> _f$pacing =
      Field('pacing', _$pacing, opt: true);

  @override
  final MappableFields<PacingState> fields = const {
    #status: _f$status,
    #error: _f$error,
    #pacing: _f$pacing,
  };

  static PacingState _instantiate(DecodingData data) {
    return PacingState(
        status: data.dec(_f$status),
        error: data.dec(_f$error),
        pacing: data.dec(_f$pacing));
  }

  @override
  final Function instantiate = _instantiate;

  static PacingState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PacingState>(map);
  }

  static PacingState fromJson(String json) {
    return ensureInitialized().decodeJson<PacingState>(json);
  }
}

mixin PacingStateMappable {
  String toJson() {
    return PacingStateMapper.ensureInitialized()
        .encodeJson<PacingState>(this as PacingState);
  }

  Map<String, dynamic> toMap() {
    return PacingStateMapper.ensureInitialized()
        .encodeMap<PacingState>(this as PacingState);
  }

  PacingStateCopyWith<PacingState, PacingState, PacingState> get copyWith =>
      _PacingStateCopyWithImpl(this as PacingState, $identity, $identity);
  @override
  String toString() {
    return PacingStateMapper.ensureInitialized()
        .stringifyValue(this as PacingState);
  }

  @override
  bool operator ==(Object other) {
    return PacingStateMapper.ensureInitialized()
        .equalsValue(this as PacingState, other);
  }

  @override
  int get hashCode {
    return PacingStateMapper.ensureInitialized().hashValue(this as PacingState);
  }
}

extension PacingStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PacingState, $Out> {
  PacingStateCopyWith<$R, PacingState, $Out> get $asPacingState =>
      $base.as((v, t, t2) => _PacingStateCopyWithImpl(v, t, t2));
}

abstract class PacingStateCopyWith<$R, $In extends PacingState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  PacingModelCopyWith<$R, PacingModel, PacingModel>? get pacing;
  $R call({PacingStatus? status, String? error, PacingModel? pacing});
  PacingStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PacingStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PacingState, $Out>
    implements PacingStateCopyWith<$R, PacingState, $Out> {
  _PacingStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PacingState> $mapper =
      PacingStateMapper.ensureInitialized();
  @override
  PacingModelCopyWith<$R, PacingModel, PacingModel>? get pacing =>
      $value.pacing?.copyWith.$chain((v) => call(pacing: v));
  @override
  $R call(
          {PacingStatus? status,
          Object? error = $none,
          Object? pacing = $none}) =>
      $apply(FieldCopyWithData({
        if (status != null) #status: status,
        if (error != $none) #error: error,
        if (pacing != $none) #pacing: pacing
      }));
  @override
  PacingState $make(CopyWithData data) => PacingState(
      status: data.get(#status, or: $value.status),
      error: data.get(#error, or: $value.error),
      pacing: data.get(#pacing, or: $value.pacing));

  @override
  PacingStateCopyWith<$R2, PacingState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PacingStateCopyWithImpl($value, $cast, t);
}
