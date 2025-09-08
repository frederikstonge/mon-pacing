// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'match_improvisation_state.dart';

class MatchImprovisationStateMapper
    extends ClassMapperBase<MatchImprovisationState> {
  MatchImprovisationStateMapper._();

  static MatchImprovisationStateMapper? _instance;
  static MatchImprovisationStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = MatchImprovisationStateMapper._(),
      );
      ImprovisationModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MatchImprovisationState';

  static ImprovisationModel _$improvisation(MatchImprovisationState v) =>
      v.improvisation;
  static const Field<MatchImprovisationState, ImprovisationModel>
  _f$improvisation = Field('improvisation', _$improvisation);
  static bool _$editMode(MatchImprovisationState v) => v.editMode;
  static const Field<MatchImprovisationState, bool> _f$editMode = Field(
    'editMode',
    _$editMode,
  );
  static int _$index(MatchImprovisationState v) => v.index;
  static const Field<MatchImprovisationState, int> _f$index = Field(
    'index',
    _$index,
  );

  @override
  final MappableFields<MatchImprovisationState> fields = const {
    #improvisation: _f$improvisation,
    #editMode: _f$editMode,
    #index: _f$index,
  };

  static MatchImprovisationState _instantiate(DecodingData data) {
    return MatchImprovisationState(
      improvisation: data.dec(_f$improvisation),
      editMode: data.dec(_f$editMode),
      index: data.dec(_f$index),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MatchImprovisationState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MatchImprovisationState>(map);
  }

  static MatchImprovisationState fromJson(String json) {
    return ensureInitialized().decodeJson<MatchImprovisationState>(json);
  }
}

mixin MatchImprovisationStateMappable {
  String toJson() {
    return MatchImprovisationStateMapper.ensureInitialized()
        .encodeJson<MatchImprovisationState>(this as MatchImprovisationState);
  }

  Map<String, dynamic> toMap() {
    return MatchImprovisationStateMapper.ensureInitialized()
        .encodeMap<MatchImprovisationState>(this as MatchImprovisationState);
  }

  MatchImprovisationStateCopyWith<
    MatchImprovisationState,
    MatchImprovisationState,
    MatchImprovisationState
  >
  get copyWith =>
      _MatchImprovisationStateCopyWithImpl<
        MatchImprovisationState,
        MatchImprovisationState
      >(this as MatchImprovisationState, $identity, $identity);
  @override
  String toString() {
    return MatchImprovisationStateMapper.ensureInitialized().stringifyValue(
      this as MatchImprovisationState,
    );
  }

  @override
  bool operator ==(Object other) {
    return MatchImprovisationStateMapper.ensureInitialized().equalsValue(
      this as MatchImprovisationState,
      other,
    );
  }

  @override
  int get hashCode {
    return MatchImprovisationStateMapper.ensureInitialized().hashValue(
      this as MatchImprovisationState,
    );
  }
}

extension MatchImprovisationStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MatchImprovisationState, $Out> {
  MatchImprovisationStateCopyWith<$R, MatchImprovisationState, $Out>
  get $asMatchImprovisationState => $base.as(
    (v, t, t2) => _MatchImprovisationStateCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class MatchImprovisationStateCopyWith<
  $R,
  $In extends MatchImprovisationState,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ImprovisationModelCopyWith<$R, ImprovisationModel, ImprovisationModel>
  get improvisation;
  $R call({ImprovisationModel? improvisation, bool? editMode, int? index});
  MatchImprovisationStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _MatchImprovisationStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MatchImprovisationState, $Out>
    implements
        MatchImprovisationStateCopyWith<$R, MatchImprovisationState, $Out> {
  _MatchImprovisationStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MatchImprovisationState> $mapper =
      MatchImprovisationStateMapper.ensureInitialized();
  @override
  ImprovisationModelCopyWith<$R, ImprovisationModel, ImprovisationModel>
  get improvisation =>
      $value.improvisation.copyWith.$chain((v) => call(improvisation: v));
  @override
  $R call({ImprovisationModel? improvisation, bool? editMode, int? index}) =>
      $apply(
        FieldCopyWithData({
          if (improvisation != null) #improvisation: improvisation,
          if (editMode != null) #editMode: editMode,
          if (index != null) #index: index,
        }),
      );
  @override
  MatchImprovisationState $make(CopyWithData data) => MatchImprovisationState(
    improvisation: data.get(#improvisation, or: $value.improvisation),
    editMode: data.get(#editMode, or: $value.editMode),
    index: data.get(#index, or: $value.index),
  );

  @override
  MatchImprovisationStateCopyWith<$R2, MatchImprovisationState, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MatchImprovisationStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

