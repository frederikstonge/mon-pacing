// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'feature_flags_state.dart';

class FeatureFlagsStateMapper extends ClassMapperBase<FeatureFlagsState> {
  FeatureFlagsStateMapper._();

  static FeatureFlagsStateMapper? _instance;
  static FeatureFlagsStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FeatureFlagsStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FeatureFlagsState';

  static FeatureFlagsStatus _$status(FeatureFlagsState v) => v.status;
  static const Field<FeatureFlagsState, FeatureFlagsStatus> _f$status =
      Field('status', _$status);
  static bool _$enableIntegrations(FeatureFlagsState v) => v.enableIntegrations;
  static const Field<FeatureFlagsState, bool> _f$enableIntegrations =
      Field('enableIntegrations', _$enableIntegrations, opt: true, def: false);

  @override
  final MappableFields<FeatureFlagsState> fields = const {
    #status: _f$status,
    #enableIntegrations: _f$enableIntegrations,
  };

  static FeatureFlagsState _instantiate(DecodingData data) {
    return FeatureFlagsState(
        status: data.dec(_f$status),
        enableIntegrations: data.dec(_f$enableIntegrations));
  }

  @override
  final Function instantiate = _instantiate;

  static FeatureFlagsState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FeatureFlagsState>(map);
  }

  static FeatureFlagsState fromJson(String json) {
    return ensureInitialized().decodeJson<FeatureFlagsState>(json);
  }
}

mixin FeatureFlagsStateMappable {
  String toJson() {
    return FeatureFlagsStateMapper.ensureInitialized()
        .encodeJson<FeatureFlagsState>(this as FeatureFlagsState);
  }

  Map<String, dynamic> toMap() {
    return FeatureFlagsStateMapper.ensureInitialized()
        .encodeMap<FeatureFlagsState>(this as FeatureFlagsState);
  }

  FeatureFlagsStateCopyWith<FeatureFlagsState, FeatureFlagsState,
          FeatureFlagsState>
      get copyWith => _FeatureFlagsStateCopyWithImpl(
          this as FeatureFlagsState, $identity, $identity);
  @override
  String toString() {
    return FeatureFlagsStateMapper.ensureInitialized()
        .stringifyValue(this as FeatureFlagsState);
  }

  @override
  bool operator ==(Object other) {
    return FeatureFlagsStateMapper.ensureInitialized()
        .equalsValue(this as FeatureFlagsState, other);
  }

  @override
  int get hashCode {
    return FeatureFlagsStateMapper.ensureInitialized()
        .hashValue(this as FeatureFlagsState);
  }
}

extension FeatureFlagsStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FeatureFlagsState, $Out> {
  FeatureFlagsStateCopyWith<$R, FeatureFlagsState, $Out>
      get $asFeatureFlagsState =>
          $base.as((v, t, t2) => _FeatureFlagsStateCopyWithImpl(v, t, t2));
}

abstract class FeatureFlagsStateCopyWith<$R, $In extends FeatureFlagsState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({FeatureFlagsStatus? status, bool? enableIntegrations});
  FeatureFlagsStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FeatureFlagsStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FeatureFlagsState, $Out>
    implements FeatureFlagsStateCopyWith<$R, FeatureFlagsState, $Out> {
  _FeatureFlagsStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FeatureFlagsState> $mapper =
      FeatureFlagsStateMapper.ensureInitialized();
  @override
  $R call({FeatureFlagsStatus? status, bool? enableIntegrations}) =>
      $apply(FieldCopyWithData({
        if (status != null) #status: status,
        if (enableIntegrations != null) #enableIntegrations: enableIntegrations
      }));
  @override
  FeatureFlagsState $make(CopyWithData data) => FeatureFlagsState(
      status: data.get(#status, or: $value.status),
      enableIntegrations:
          data.get(#enableIntegrations, or: $value.enableIntegrations));

  @override
  FeatureFlagsStateCopyWith<$R2, FeatureFlagsState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FeatureFlagsStateCopyWithImpl($value, $cast, t);
}
