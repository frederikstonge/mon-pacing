// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'integrations_state.dart';

class IntegrationsStateMapper extends ClassMapperBase<IntegrationsState> {
  IntegrationsStateMapper._();

  static IntegrationsStateMapper? _instance;
  static IntegrationsStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IntegrationsStateMapper._());
      IntegrationsStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'IntegrationsState';

  static IntegrationsStatus _$status(IntegrationsState v) => v.status;
  static const Field<IntegrationsState, IntegrationsStatus> _f$status = Field(
    'status',
    _$status,
  );
  static List<IntegrationBase> _$integrations(IntegrationsState v) =>
      v.integrations;
  static const Field<IntegrationsState, List<IntegrationBase>> _f$integrations =
      Field('integrations', _$integrations, opt: true, def: const []);

  @override
  final MappableFields<IntegrationsState> fields = const {
    #status: _f$status,
    #integrations: _f$integrations,
  };

  static IntegrationsState _instantiate(DecodingData data) {
    return IntegrationsState(
      status: data.dec(_f$status),
      integrations: data.dec(_f$integrations),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static IntegrationsState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IntegrationsState>(map);
  }

  static IntegrationsState fromJson(String json) {
    return ensureInitialized().decodeJson<IntegrationsState>(json);
  }
}

mixin IntegrationsStateMappable {
  String toJson() {
    return IntegrationsStateMapper.ensureInitialized()
        .encodeJson<IntegrationsState>(this as IntegrationsState);
  }

  Map<String, dynamic> toMap() {
    return IntegrationsStateMapper.ensureInitialized()
        .encodeMap<IntegrationsState>(this as IntegrationsState);
  }

  IntegrationsStateCopyWith<
    IntegrationsState,
    IntegrationsState,
    IntegrationsState
  >
  get copyWith =>
      _IntegrationsStateCopyWithImpl<IntegrationsState, IntegrationsState>(
        this as IntegrationsState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return IntegrationsStateMapper.ensureInitialized().stringifyValue(
      this as IntegrationsState,
    );
  }

  @override
  bool operator ==(Object other) {
    return IntegrationsStateMapper.ensureInitialized().equalsValue(
      this as IntegrationsState,
      other,
    );
  }

  @override
  int get hashCode {
    return IntegrationsStateMapper.ensureInitialized().hashValue(
      this as IntegrationsState,
    );
  }
}

extension IntegrationsStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IntegrationsState, $Out> {
  IntegrationsStateCopyWith<$R, IntegrationsState, $Out>
  get $asIntegrationsState => $base.as(
    (v, t, t2) => _IntegrationsStateCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class IntegrationsStateCopyWith<
  $R,
  $In extends IntegrationsState,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    IntegrationBase,
    ObjectCopyWith<$R, IntegrationBase, IntegrationBase>
  >
  get integrations;
  $R call({IntegrationsStatus? status, List<IntegrationBase>? integrations});
  IntegrationsStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _IntegrationsStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IntegrationsState, $Out>
    implements IntegrationsStateCopyWith<$R, IntegrationsState, $Out> {
  _IntegrationsStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IntegrationsState> $mapper =
      IntegrationsStateMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    IntegrationBase,
    ObjectCopyWith<$R, IntegrationBase, IntegrationBase>
  >
  get integrations => ListCopyWith(
    $value.integrations,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(integrations: v),
  );
  @override
  $R call({IntegrationsStatus? status, List<IntegrationBase>? integrations}) =>
      $apply(
        FieldCopyWithData({
          if (status != null) #status: status,
          if (integrations != null) #integrations: integrations,
        }),
      );
  @override
  IntegrationsState $make(CopyWithData data) => IntegrationsState(
    status: data.get(#status, or: $value.status),
    integrations: data.get(#integrations, or: $value.integrations),
  );

  @override
  IntegrationsStateCopyWith<$R2, IntegrationsState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _IntegrationsStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

