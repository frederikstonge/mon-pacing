// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'match_state.dart';

class MatchStateMapper extends ClassMapperBase<MatchState> {
  MatchStateMapper._();

  static MatchStateMapper? _instance;
  static MatchStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MatchStateMapper._());
      MatchStatusMapper.ensureInitialized();
      MatchModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MatchState';

  static MatchStatus _$status(MatchState v) => v.status;
  static const Field<MatchState, MatchStatus> _f$status =
      Field('status', _$status);
  static String? _$error(MatchState v) => v.error;
  static const Field<MatchState, String> _f$error =
      Field('error', _$error, opt: true);
  static MatchModel? _$match(MatchState v) => v.match;
  static const Field<MatchState, MatchModel> _f$match =
      Field('match', _$match, opt: true);
  static int _$selectedImprovisationIndex(MatchState v) =>
      v.selectedImprovisationIndex;
  static const Field<MatchState, int> _f$selectedImprovisationIndex = Field(
      'selectedImprovisationIndex', _$selectedImprovisationIndex,
      opt: true, def: 0);
  static int? _$selectedDurationIndex(MatchState v) => v.selectedDurationIndex;
  static const Field<MatchState, int> _f$selectedDurationIndex =
      Field('selectedDurationIndex', _$selectedDurationIndex, opt: true);

  @override
  final MappableFields<MatchState> fields = const {
    #status: _f$status,
    #error: _f$error,
    #match: _f$match,
    #selectedImprovisationIndex: _f$selectedImprovisationIndex,
    #selectedDurationIndex: _f$selectedDurationIndex,
  };

  static MatchState _instantiate(DecodingData data) {
    return MatchState(
        status: data.dec(_f$status),
        error: data.dec(_f$error),
        match: data.dec(_f$match),
        selectedImprovisationIndex: data.dec(_f$selectedImprovisationIndex),
        selectedDurationIndex: data.dec(_f$selectedDurationIndex));
  }

  @override
  final Function instantiate = _instantiate;

  static MatchState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MatchState>(map);
  }

  static MatchState fromJson(String json) {
    return ensureInitialized().decodeJson<MatchState>(json);
  }
}

mixin MatchStateMappable {
  String toJson() {
    return MatchStateMapper.ensureInitialized()
        .encodeJson<MatchState>(this as MatchState);
  }

  Map<String, dynamic> toMap() {
    return MatchStateMapper.ensureInitialized()
        .encodeMap<MatchState>(this as MatchState);
  }

  MatchStateCopyWith<MatchState, MatchState, MatchState> get copyWith =>
      _MatchStateCopyWithImpl<MatchState, MatchState>(
          this as MatchState, $identity, $identity);
  @override
  String toString() {
    return MatchStateMapper.ensureInitialized()
        .stringifyValue(this as MatchState);
  }

  @override
  bool operator ==(Object other) {
    return MatchStateMapper.ensureInitialized()
        .equalsValue(this as MatchState, other);
  }

  @override
  int get hashCode {
    return MatchStateMapper.ensureInitialized().hashValue(this as MatchState);
  }
}

extension MatchStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MatchState, $Out> {
  MatchStateCopyWith<$R, MatchState, $Out> get $asMatchState =>
      $base.as((v, t, t2) => _MatchStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MatchStateCopyWith<$R, $In extends MatchState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MatchModelCopyWith<$R, MatchModel, MatchModel>? get match;
  $R call(
      {MatchStatus? status,
      String? error,
      MatchModel? match,
      int? selectedImprovisationIndex,
      int? selectedDurationIndex});
  MatchStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MatchStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MatchState, $Out>
    implements MatchStateCopyWith<$R, MatchState, $Out> {
  _MatchStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MatchState> $mapper =
      MatchStateMapper.ensureInitialized();
  @override
  MatchModelCopyWith<$R, MatchModel, MatchModel>? get match =>
      $value.match?.copyWith.$chain((v) => call(match: v));
  @override
  $R call(
          {MatchStatus? status,
          Object? error = $none,
          Object? match = $none,
          int? selectedImprovisationIndex,
          Object? selectedDurationIndex = $none}) =>
      $apply(FieldCopyWithData({
        if (status != null) #status: status,
        if (error != $none) #error: error,
        if (match != $none) #match: match,
        if (selectedImprovisationIndex != null)
          #selectedImprovisationIndex: selectedImprovisationIndex,
        if (selectedDurationIndex != $none)
          #selectedDurationIndex: selectedDurationIndex
      }));
  @override
  MatchState $make(CopyWithData data) => MatchState(
      status: data.get(#status, or: $value.status),
      error: data.get(#error, or: $value.error),
      match: data.get(#match, or: $value.match),
      selectedImprovisationIndex: data.get(#selectedImprovisationIndex,
          or: $value.selectedImprovisationIndex),
      selectedDurationIndex:
          data.get(#selectedDurationIndex, or: $value.selectedDurationIndex));

  @override
  MatchStateCopyWith<$R2, MatchState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MatchStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
