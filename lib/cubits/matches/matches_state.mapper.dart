// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'matches_state.dart';

class MatchesStateMapper extends ClassMapperBase<MatchesState> {
  MatchesStateMapper._();

  static MatchesStateMapper? _instance;
  static MatchesStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MatchesStateMapper._());
      MatchModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MatchesState';

  static MatchesStatus _$status(MatchesState v) => v.status;
  static const Field<MatchesState, MatchesStatus> _f$status =
      Field('status', _$status);
  static String? _$error(MatchesState v) => v.error;
  static const Field<MatchesState, String> _f$error =
      Field('error', _$error, opt: true);
  static List<MatchModel> _$matches(MatchesState v) => v.matches;
  static const Field<MatchesState, List<MatchModel>> _f$matches =
      Field('matches', _$matches, opt: true, def: const []);
  static bool _$hasMore(MatchesState v) => v.hasMore;
  static const Field<MatchesState, bool> _f$hasMore =
      Field('hasMore', _$hasMore, opt: true, def: false);

  @override
  final MappableFields<MatchesState> fields = const {
    #status: _f$status,
    #error: _f$error,
    #matches: _f$matches,
    #hasMore: _f$hasMore,
  };

  static MatchesState _instantiate(DecodingData data) {
    return MatchesState(
        status: data.dec(_f$status),
        error: data.dec(_f$error),
        matches: data.dec(_f$matches),
        hasMore: data.dec(_f$hasMore));
  }

  @override
  final Function instantiate = _instantiate;

  static MatchesState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MatchesState>(map);
  }

  static MatchesState fromJson(String json) {
    return ensureInitialized().decodeJson<MatchesState>(json);
  }
}

mixin MatchesStateMappable {
  String toJson() {
    return MatchesStateMapper.ensureInitialized()
        .encodeJson<MatchesState>(this as MatchesState);
  }

  Map<String, dynamic> toMap() {
    return MatchesStateMapper.ensureInitialized()
        .encodeMap<MatchesState>(this as MatchesState);
  }

  MatchesStateCopyWith<MatchesState, MatchesState, MatchesState> get copyWith =>
      _MatchesStateCopyWithImpl(this as MatchesState, $identity, $identity);
  @override
  String toString() {
    return MatchesStateMapper.ensureInitialized()
        .stringifyValue(this as MatchesState);
  }

  @override
  bool operator ==(Object other) {
    return MatchesStateMapper.ensureInitialized()
        .equalsValue(this as MatchesState, other);
  }

  @override
  int get hashCode {
    return MatchesStateMapper.ensureInitialized()
        .hashValue(this as MatchesState);
  }
}

extension MatchesStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MatchesState, $Out> {
  MatchesStateCopyWith<$R, MatchesState, $Out> get $asMatchesState =>
      $base.as((v, t, t2) => _MatchesStateCopyWithImpl(v, t, t2));
}

abstract class MatchesStateCopyWith<$R, $In extends MatchesState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, MatchModel, MatchModelCopyWith<$R, MatchModel, MatchModel>>
      get matches;
  $R call(
      {MatchesStatus? status,
      String? error,
      List<MatchModel>? matches,
      bool? hasMore});
  MatchesStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MatchesStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MatchesState, $Out>
    implements MatchesStateCopyWith<$R, MatchesState, $Out> {
  _MatchesStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MatchesState> $mapper =
      MatchesStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, MatchModel, MatchModelCopyWith<$R, MatchModel, MatchModel>>
      get matches => ListCopyWith($value.matches,
          (v, t) => v.copyWith.$chain(t), (v) => call(matches: v));
  @override
  $R call(
          {MatchesStatus? status,
          Object? error = $none,
          List<MatchModel>? matches,
          bool? hasMore}) =>
      $apply(FieldCopyWithData({
        if (status != null) #status: status,
        if (error != $none) #error: error,
        if (matches != null) #matches: matches,
        if (hasMore != null) #hasMore: hasMore
      }));
  @override
  MatchesState $make(CopyWithData data) => MatchesState(
      status: data.get(#status, or: $value.status),
      error: data.get(#error, or: $value.error),
      matches: data.get(#matches, or: $value.matches),
      hasMore: data.get(#hasMore, or: $value.hasMore));

  @override
  MatchesStateCopyWith<$R2, MatchesState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MatchesStateCopyWithImpl($value, $cast, t);
}
