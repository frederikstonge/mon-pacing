// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pacing_detail_state.dart';

class PacingDetailStateMapper extends ClassMapperBase<PacingDetailState> {
  PacingDetailStateMapper._();

  static PacingDetailStateMapper? _instance;
  static PacingDetailStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PacingDetailStateMapper._());
      PacingModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PacingDetailState';

  static bool _$editMode(PacingDetailState v) => v.editMode;
  static const Field<PacingDetailState, bool> _f$editMode =
      Field('editMode', _$editMode);
  static PacingModel _$pacing(PacingDetailState v) => v.pacing;
  static const Field<PacingDetailState, PacingModel> _f$pacing =
      Field('pacing', _$pacing);

  @override
  final MappableFields<PacingDetailState> fields = const {
    #editMode: _f$editMode,
    #pacing: _f$pacing,
  };

  static PacingDetailState _instantiate(DecodingData data) {
    return PacingDetailState(
        editMode: data.dec(_f$editMode), pacing: data.dec(_f$pacing));
  }

  @override
  final Function instantiate = _instantiate;

  static PacingDetailState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PacingDetailState>(map);
  }

  static PacingDetailState fromJson(String json) {
    return ensureInitialized().decodeJson<PacingDetailState>(json);
  }
}

mixin PacingDetailStateMappable {
  String toJson() {
    return PacingDetailStateMapper.ensureInitialized()
        .encodeJson<PacingDetailState>(this as PacingDetailState);
  }

  Map<String, dynamic> toMap() {
    return PacingDetailStateMapper.ensureInitialized()
        .encodeMap<PacingDetailState>(this as PacingDetailState);
  }

  PacingDetailStateCopyWith<PacingDetailState, PacingDetailState,
          PacingDetailState>
      get copyWith =>
          _PacingDetailStateCopyWithImpl<PacingDetailState, PacingDetailState>(
              this as PacingDetailState, $identity, $identity);
  @override
  String toString() {
    return PacingDetailStateMapper.ensureInitialized()
        .stringifyValue(this as PacingDetailState);
  }

  @override
  bool operator ==(Object other) {
    return PacingDetailStateMapper.ensureInitialized()
        .equalsValue(this as PacingDetailState, other);
  }

  @override
  int get hashCode {
    return PacingDetailStateMapper.ensureInitialized()
        .hashValue(this as PacingDetailState);
  }
}

extension PacingDetailStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PacingDetailState, $Out> {
  PacingDetailStateCopyWith<$R, PacingDetailState, $Out>
      get $asPacingDetailState => $base
          .as((v, t, t2) => _PacingDetailStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PacingDetailStateCopyWith<$R, $In extends PacingDetailState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  PacingModelCopyWith<$R, PacingModel, PacingModel> get pacing;
  $R call({bool? editMode, PacingModel? pacing});
  PacingDetailStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PacingDetailStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PacingDetailState, $Out>
    implements PacingDetailStateCopyWith<$R, PacingDetailState, $Out> {
  _PacingDetailStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PacingDetailState> $mapper =
      PacingDetailStateMapper.ensureInitialized();
  @override
  PacingModelCopyWith<$R, PacingModel, PacingModel> get pacing =>
      $value.pacing.copyWith.$chain((v) => call(pacing: v));
  @override
  $R call({bool? editMode, PacingModel? pacing}) => $apply(FieldCopyWithData({
        if (editMode != null) #editMode: editMode,
        if (pacing != null) #pacing: pacing
      }));
  @override
  PacingDetailState $make(CopyWithData data) => PacingDetailState(
      editMode: data.get(#editMode, or: $value.editMode),
      pacing: data.get(#pacing, or: $value.pacing));

  @override
  PacingDetailStateCopyWith<$R2, PacingDetailState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PacingDetailStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
