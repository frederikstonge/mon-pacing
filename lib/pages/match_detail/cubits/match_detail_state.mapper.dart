// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'match_detail_state.dart';

class MatchDetailStateMapper extends ClassMapperBase<MatchDetailState> {
  MatchDetailStateMapper._();

  static MatchDetailStateMapper? _instance;
  static MatchDetailStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MatchDetailStateMapper._());
      MatchModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MatchDetailState';

  static bool _$editMode(MatchDetailState v) => v.editMode;
  static const Field<MatchDetailState, bool> _f$editMode =
      Field('editMode', _$editMode);
  static MatchModel _$match(MatchDetailState v) => v.match;
  static const Field<MatchDetailState, MatchModel> _f$match =
      Field('match', _$match);

  @override
  final MappableFields<MatchDetailState> fields = const {
    #editMode: _f$editMode,
    #match: _f$match,
  };

  static MatchDetailState _instantiate(DecodingData data) {
    return MatchDetailState(
        editMode: data.dec(_f$editMode), match: data.dec(_f$match));
  }

  @override
  final Function instantiate = _instantiate;

  static MatchDetailState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MatchDetailState>(map);
  }

  static MatchDetailState fromJson(String json) {
    return ensureInitialized().decodeJson<MatchDetailState>(json);
  }
}

mixin MatchDetailStateMappable {
  String toJson() {
    return MatchDetailStateMapper.ensureInitialized()
        .encodeJson<MatchDetailState>(this as MatchDetailState);
  }

  Map<String, dynamic> toMap() {
    return MatchDetailStateMapper.ensureInitialized()
        .encodeMap<MatchDetailState>(this as MatchDetailState);
  }

  MatchDetailStateCopyWith<MatchDetailState, MatchDetailState, MatchDetailState>
      get copyWith => _MatchDetailStateCopyWithImpl(
          this as MatchDetailState, $identity, $identity);
  @override
  String toString() {
    return MatchDetailStateMapper.ensureInitialized()
        .stringifyValue(this as MatchDetailState);
  }

  @override
  bool operator ==(Object other) {
    return MatchDetailStateMapper.ensureInitialized()
        .equalsValue(this as MatchDetailState, other);
  }

  @override
  int get hashCode {
    return MatchDetailStateMapper.ensureInitialized()
        .hashValue(this as MatchDetailState);
  }
}

extension MatchDetailStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MatchDetailState, $Out> {
  MatchDetailStateCopyWith<$R, MatchDetailState, $Out>
      get $asMatchDetailState =>
          $base.as((v, t, t2) => _MatchDetailStateCopyWithImpl(v, t, t2));
}

abstract class MatchDetailStateCopyWith<$R, $In extends MatchDetailState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MatchModelCopyWith<$R, MatchModel, MatchModel> get match;
  $R call({bool? editMode, MatchModel? match});
  MatchDetailStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MatchDetailStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MatchDetailState, $Out>
    implements MatchDetailStateCopyWith<$R, MatchDetailState, $Out> {
  _MatchDetailStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MatchDetailState> $mapper =
      MatchDetailStateMapper.ensureInitialized();
  @override
  MatchModelCopyWith<$R, MatchModel, MatchModel> get match =>
      $value.match.copyWith.$chain((v) => call(match: v));
  @override
  $R call({bool? editMode, MatchModel? match}) => $apply(FieldCopyWithData({
        if (editMode != null) #editMode: editMode,
        if (match != null) #match: match
      }));
  @override
  MatchDetailState $make(CopyWithData data) => MatchDetailState(
      editMode: data.get(#editMode, or: $value.editMode),
      match: data.get(#match, or: $value.match));

  @override
  MatchDetailStateCopyWith<$R2, MatchDetailState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MatchDetailStateCopyWithImpl($value, $cast, t);
}
