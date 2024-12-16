// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pacings_state.dart';

class PacingsStateMapper extends ClassMapperBase<PacingsState> {
  PacingsStateMapper._();

  static PacingsStateMapper? _instance;
  static PacingsStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PacingsStateMapper._());
      PacingsStatusMapper.ensureInitialized();
      PacingModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PacingsState';

  static PacingsStatus _$status(PacingsState v) => v.status;
  static const Field<PacingsState, PacingsStatus> _f$status =
      Field('status', _$status);
  static String? _$error(PacingsState v) => v.error;
  static const Field<PacingsState, String> _f$error =
      Field('error', _$error, opt: true);
  static List<PacingModel> _$pacings(PacingsState v) => v.pacings;
  static const Field<PacingsState, List<PacingModel>> _f$pacings =
      Field('pacings', _$pacings, opt: true, def: const []);
  static bool _$hasMore(PacingsState v) => v.hasMore;
  static const Field<PacingsState, bool> _f$hasMore =
      Field('hasMore', _$hasMore, opt: true, def: false);

  @override
  final MappableFields<PacingsState> fields = const {
    #status: _f$status,
    #error: _f$error,
    #pacings: _f$pacings,
    #hasMore: _f$hasMore,
  };

  static PacingsState _instantiate(DecodingData data) {
    return PacingsState(
        status: data.dec(_f$status),
        error: data.dec(_f$error),
        pacings: data.dec(_f$pacings),
        hasMore: data.dec(_f$hasMore));
  }

  @override
  final Function instantiate = _instantiate;

  static PacingsState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PacingsState>(map);
  }

  static PacingsState fromJson(String json) {
    return ensureInitialized().decodeJson<PacingsState>(json);
  }
}

mixin PacingsStateMappable {
  String toJson() {
    return PacingsStateMapper.ensureInitialized()
        .encodeJson<PacingsState>(this as PacingsState);
  }

  Map<String, dynamic> toMap() {
    return PacingsStateMapper.ensureInitialized()
        .encodeMap<PacingsState>(this as PacingsState);
  }

  PacingsStateCopyWith<PacingsState, PacingsState, PacingsState> get copyWith =>
      _PacingsStateCopyWithImpl(this as PacingsState, $identity, $identity);
  @override
  String toString() {
    return PacingsStateMapper.ensureInitialized()
        .stringifyValue(this as PacingsState);
  }

  @override
  bool operator ==(Object other) {
    return PacingsStateMapper.ensureInitialized()
        .equalsValue(this as PacingsState, other);
  }

  @override
  int get hashCode {
    return PacingsStateMapper.ensureInitialized()
        .hashValue(this as PacingsState);
  }
}

extension PacingsStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PacingsState, $Out> {
  PacingsStateCopyWith<$R, PacingsState, $Out> get $asPacingsState =>
      $base.as((v, t, t2) => _PacingsStateCopyWithImpl(v, t, t2));
}

abstract class PacingsStateCopyWith<$R, $In extends PacingsState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, PacingModel,
      PacingModelCopyWith<$R, PacingModel, PacingModel>> get pacings;
  $R call(
      {PacingsStatus? status,
      String? error,
      List<PacingModel>? pacings,
      bool? hasMore});
  PacingsStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PacingsStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PacingsState, $Out>
    implements PacingsStateCopyWith<$R, PacingsState, $Out> {
  _PacingsStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PacingsState> $mapper =
      PacingsStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, PacingModel,
          PacingModelCopyWith<$R, PacingModel, PacingModel>>
      get pacings => ListCopyWith($value.pacings,
          (v, t) => v.copyWith.$chain(t), (v) => call(pacings: v));
  @override
  $R call(
          {PacingsStatus? status,
          Object? error = $none,
          List<PacingModel>? pacings,
          bool? hasMore}) =>
      $apply(FieldCopyWithData({
        if (status != null) #status: status,
        if (error != $none) #error: error,
        if (pacings != null) #pacings: pacings,
        if (hasMore != null) #hasMore: hasMore
      }));
  @override
  PacingsState $make(CopyWithData data) => PacingsState(
      status: data.get(#status, or: $value.status),
      error: data.get(#error, or: $value.error),
      pacings: data.get(#pacings, or: $value.pacings),
      hasMore: data.get(#hasMore, or: $value.hasMore));

  @override
  PacingsStateCopyWith<$R2, PacingsState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PacingsStateCopyWithImpl($value, $cast, t);
}
