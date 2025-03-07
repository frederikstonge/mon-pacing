// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'match_penalty_state.dart';

class MatchPenaltyStateMapper extends ClassMapperBase<MatchPenaltyState> {
  MatchPenaltyStateMapper._();

  static MatchPenaltyStateMapper? _instance;
  static MatchPenaltyStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MatchPenaltyStateMapper._());
      TeamModelMapper.ensureInitialized();
      PenaltyModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MatchPenaltyState';

  static bool _$editMode(MatchPenaltyState v) => v.editMode;
  static const Field<MatchPenaltyState, bool> _f$editMode =
      Field('editMode', _$editMode);
  static List<TeamModel> _$teams(MatchPenaltyState v) => v.teams;
  static const Field<MatchPenaltyState, List<TeamModel>> _f$teams =
      Field('teams', _$teams);
  static PenaltyModel _$penalty(MatchPenaltyState v) => v.penalty;
  static const Field<MatchPenaltyState, PenaltyModel> _f$penalty =
      Field('penalty', _$penalty);
  static List<String>? _$integrationPenaltyTypes(MatchPenaltyState v) =>
      v.integrationPenaltyTypes;
  static const Field<MatchPenaltyState, List<String>>
      _f$integrationPenaltyTypes =
      Field('integrationPenaltyTypes', _$integrationPenaltyTypes);

  @override
  final MappableFields<MatchPenaltyState> fields = const {
    #editMode: _f$editMode,
    #teams: _f$teams,
    #penalty: _f$penalty,
    #integrationPenaltyTypes: _f$integrationPenaltyTypes,
  };

  static MatchPenaltyState _instantiate(DecodingData data) {
    return MatchPenaltyState(
        editMode: data.dec(_f$editMode),
        teams: data.dec(_f$teams),
        penalty: data.dec(_f$penalty),
        integrationPenaltyTypes: data.dec(_f$integrationPenaltyTypes));
  }

  @override
  final Function instantiate = _instantiate;

  static MatchPenaltyState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MatchPenaltyState>(map);
  }

  static MatchPenaltyState fromJson(String json) {
    return ensureInitialized().decodeJson<MatchPenaltyState>(json);
  }
}

mixin MatchPenaltyStateMappable {
  String toJson() {
    return MatchPenaltyStateMapper.ensureInitialized()
        .encodeJson<MatchPenaltyState>(this as MatchPenaltyState);
  }

  Map<String, dynamic> toMap() {
    return MatchPenaltyStateMapper.ensureInitialized()
        .encodeMap<MatchPenaltyState>(this as MatchPenaltyState);
  }

  MatchPenaltyStateCopyWith<MatchPenaltyState, MatchPenaltyState,
          MatchPenaltyState>
      get copyWith => _MatchPenaltyStateCopyWithImpl(
          this as MatchPenaltyState, $identity, $identity);
  @override
  String toString() {
    return MatchPenaltyStateMapper.ensureInitialized()
        .stringifyValue(this as MatchPenaltyState);
  }

  @override
  bool operator ==(Object other) {
    return MatchPenaltyStateMapper.ensureInitialized()
        .equalsValue(this as MatchPenaltyState, other);
  }

  @override
  int get hashCode {
    return MatchPenaltyStateMapper.ensureInitialized()
        .hashValue(this as MatchPenaltyState);
  }
}

extension MatchPenaltyStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MatchPenaltyState, $Out> {
  MatchPenaltyStateCopyWith<$R, MatchPenaltyState, $Out>
      get $asMatchPenaltyState =>
          $base.as((v, t, t2) => _MatchPenaltyStateCopyWithImpl(v, t, t2));
}

abstract class MatchPenaltyStateCopyWith<$R, $In extends MatchPenaltyState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, TeamModel, TeamModelCopyWith<$R, TeamModel, TeamModel>>
      get teams;
  PenaltyModelCopyWith<$R, PenaltyModel, PenaltyModel> get penalty;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get integrationPenaltyTypes;
  $R call(
      {bool? editMode,
      List<TeamModel>? teams,
      PenaltyModel? penalty,
      List<String>? integrationPenaltyTypes});
  MatchPenaltyStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MatchPenaltyStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MatchPenaltyState, $Out>
    implements MatchPenaltyStateCopyWith<$R, MatchPenaltyState, $Out> {
  _MatchPenaltyStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MatchPenaltyState> $mapper =
      MatchPenaltyStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, TeamModel, TeamModelCopyWith<$R, TeamModel, TeamModel>>
      get teams => ListCopyWith(
          $value.teams, (v, t) => v.copyWith.$chain(t), (v) => call(teams: v));
  @override
  PenaltyModelCopyWith<$R, PenaltyModel, PenaltyModel> get penalty =>
      $value.penalty.copyWith.$chain((v) => call(penalty: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get integrationPenaltyTypes => $value.integrationPenaltyTypes != null
          ? ListCopyWith(
              $value.integrationPenaltyTypes!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(integrationPenaltyTypes: v))
          : null;
  @override
  $R call(
          {bool? editMode,
          List<TeamModel>? teams,
          PenaltyModel? penalty,
          Object? integrationPenaltyTypes = $none}) =>
      $apply(FieldCopyWithData({
        if (editMode != null) #editMode: editMode,
        if (teams != null) #teams: teams,
        if (penalty != null) #penalty: penalty,
        if (integrationPenaltyTypes != $none)
          #integrationPenaltyTypes: integrationPenaltyTypes
      }));
  @override
  MatchPenaltyState $make(CopyWithData data) => MatchPenaltyState(
      editMode: data.get(#editMode, or: $value.editMode),
      teams: data.get(#teams, or: $value.teams),
      penalty: data.get(#penalty, or: $value.penalty),
      integrationPenaltyTypes: data.get(#integrationPenaltyTypes,
          or: $value.integrationPenaltyTypes));

  @override
  MatchPenaltyStateCopyWith<$R2, MatchPenaltyState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MatchPenaltyStateCopyWithImpl($value, $cast, t);
}
