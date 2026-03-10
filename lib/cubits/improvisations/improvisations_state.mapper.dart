// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'improvisations_state.dart';

class ImprovisationsStateMapper extends ClassMapperBase<ImprovisationsState> {
  ImprovisationsStateMapper._();

  static ImprovisationsStateMapper? _instance;
  static ImprovisationsStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ImprovisationsStateMapper._());
      ImprovisationsStatusMapper.ensureInitialized();
      ImprovisationModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ImprovisationsState';

  static ImprovisationsStatus _$status(ImprovisationsState v) => v.status;
  static const Field<ImprovisationsState, ImprovisationsStatus> _f$status =
      Field('status', _$status);
  static String? _$error(ImprovisationsState v) => v.error;
  static const Field<ImprovisationsState, String> _f$error = Field(
    'error',
    _$error,
    opt: true,
  );
  static List<ImprovisationModel> _$improvisations(ImprovisationsState v) =>
      v.improvisations;
  static const Field<ImprovisationsState, List<ImprovisationModel>>
  _f$improvisations = Field(
    'improvisations',
    _$improvisations,
    opt: true,
    def: const [],
  );
  static bool _$hasMore(ImprovisationsState v) => v.hasMore;
  static const Field<ImprovisationsState, bool> _f$hasMore = Field(
    'hasMore',
    _$hasMore,
    opt: true,
    def: true,
  );

  @override
  final MappableFields<ImprovisationsState> fields = const {
    #status: _f$status,
    #error: _f$error,
    #improvisations: _f$improvisations,
    #hasMore: _f$hasMore,
  };

  static ImprovisationsState _instantiate(DecodingData data) {
    return ImprovisationsState(
      status: data.dec(_f$status),
      error: data.dec(_f$error),
      improvisations: data.dec(_f$improvisations),
      hasMore: data.dec(_f$hasMore),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ImprovisationsState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ImprovisationsState>(map);
  }

  static ImprovisationsState fromJson(String json) {
    return ensureInitialized().decodeJson<ImprovisationsState>(json);
  }
}

mixin ImprovisationsStateMappable {
  String toJson() {
    return ImprovisationsStateMapper.ensureInitialized()
        .encodeJson<ImprovisationsState>(this as ImprovisationsState);
  }

  Map<String, dynamic> toMap() {
    return ImprovisationsStateMapper.ensureInitialized()
        .encodeMap<ImprovisationsState>(this as ImprovisationsState);
  }

  ImprovisationsStateCopyWith<
    ImprovisationsState,
    ImprovisationsState,
    ImprovisationsState
  >
  get copyWith =>
      _ImprovisationsStateCopyWithImpl<
        ImprovisationsState,
        ImprovisationsState
      >(this as ImprovisationsState, $identity, $identity);
  @override
  String toString() {
    return ImprovisationsStateMapper.ensureInitialized().stringifyValue(
      this as ImprovisationsState,
    );
  }

  @override
  bool operator ==(Object other) {
    return ImprovisationsStateMapper.ensureInitialized().equalsValue(
      this as ImprovisationsState,
      other,
    );
  }

  @override
  int get hashCode {
    return ImprovisationsStateMapper.ensureInitialized().hashValue(
      this as ImprovisationsState,
    );
  }
}

extension ImprovisationsStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ImprovisationsState, $Out> {
  ImprovisationsStateCopyWith<$R, ImprovisationsState, $Out>
  get $asImprovisationsState => $base.as(
    (v, t, t2) => _ImprovisationsStateCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ImprovisationsStateCopyWith<
  $R,
  $In extends ImprovisationsState,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    ImprovisationModel,
    ImprovisationModelCopyWith<$R, ImprovisationModel, ImprovisationModel>
  >
  get improvisations;
  $R call({
    ImprovisationsStatus? status,
    String? error,
    List<ImprovisationModel>? improvisations,
    bool? hasMore,
  });
  ImprovisationsStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ImprovisationsStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ImprovisationsState, $Out>
    implements ImprovisationsStateCopyWith<$R, ImprovisationsState, $Out> {
  _ImprovisationsStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ImprovisationsState> $mapper =
      ImprovisationsStateMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    ImprovisationModel,
    ImprovisationModelCopyWith<$R, ImprovisationModel, ImprovisationModel>
  >
  get improvisations => ListCopyWith(
    $value.improvisations,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(improvisations: v),
  );
  @override
  $R call({
    ImprovisationsStatus? status,
    Object? error = $none,
    List<ImprovisationModel>? improvisations,
    bool? hasMore,
  }) => $apply(
    FieldCopyWithData({
      if (status != null) #status: status,
      if (error != $none) #error: error,
      if (improvisations != null) #improvisations: improvisations,
      if (hasMore != null) #hasMore: hasMore,
    }),
  );
  @override
  ImprovisationsState $make(CopyWithData data) => ImprovisationsState(
    status: data.get(#status, or: $value.status),
    error: data.get(#error, or: $value.error),
    improvisations: data.get(#improvisations, or: $value.improvisations),
    hasMore: data.get(#hasMore, or: $value.hasMore),
  );

  @override
  ImprovisationsStateCopyWith<$R2, ImprovisationsState, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ImprovisationsStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

