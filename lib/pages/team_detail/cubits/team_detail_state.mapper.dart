// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'team_detail_state.dart';

class TeamDetailStateMapper extends ClassMapperBase<TeamDetailState> {
  TeamDetailStateMapper._();

  static TeamDetailStateMapper? _instance;
  static TeamDetailStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TeamDetailStateMapper._());
      TeamModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TeamDetailState';

  static bool _$editMode(TeamDetailState v) => v.editMode;
  static const Field<TeamDetailState, bool> _f$editMode =
      Field('editMode', _$editMode);
  static TeamModel _$team(TeamDetailState v) => v.team;
  static const Field<TeamDetailState, TeamModel> _f$team =
      Field('team', _$team);
  static int _$selectedTeamIndex(TeamDetailState v) => v.selectedTeamIndex;
  static const Field<TeamDetailState, int> _f$selectedTeamIndex =
      Field('selectedTeamIndex', _$selectedTeamIndex, opt: true, def: 0);

  @override
  final MappableFields<TeamDetailState> fields = const {
    #editMode: _f$editMode,
    #team: _f$team,
    #selectedTeamIndex: _f$selectedTeamIndex,
  };

  static TeamDetailState _instantiate(DecodingData data) {
    return TeamDetailState(
        editMode: data.dec(_f$editMode),
        team: data.dec(_f$team),
        selectedTeamIndex: data.dec(_f$selectedTeamIndex));
  }

  @override
  final Function instantiate = _instantiate;

  static TeamDetailState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TeamDetailState>(map);
  }

  static TeamDetailState fromJson(String json) {
    return ensureInitialized().decodeJson<TeamDetailState>(json);
  }
}

mixin TeamDetailStateMappable {
  String toJson() {
    return TeamDetailStateMapper.ensureInitialized()
        .encodeJson<TeamDetailState>(this as TeamDetailState);
  }

  Map<String, dynamic> toMap() {
    return TeamDetailStateMapper.ensureInitialized()
        .encodeMap<TeamDetailState>(this as TeamDetailState);
  }

  TeamDetailStateCopyWith<TeamDetailState, TeamDetailState, TeamDetailState>
      get copyWith => _TeamDetailStateCopyWithImpl(
          this as TeamDetailState, $identity, $identity);
  @override
  String toString() {
    return TeamDetailStateMapper.ensureInitialized()
        .stringifyValue(this as TeamDetailState);
  }

  @override
  bool operator ==(Object other) {
    return TeamDetailStateMapper.ensureInitialized()
        .equalsValue(this as TeamDetailState, other);
  }

  @override
  int get hashCode {
    return TeamDetailStateMapper.ensureInitialized()
        .hashValue(this as TeamDetailState);
  }
}

extension TeamDetailStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TeamDetailState, $Out> {
  TeamDetailStateCopyWith<$R, TeamDetailState, $Out> get $asTeamDetailState =>
      $base.as((v, t, t2) => _TeamDetailStateCopyWithImpl(v, t, t2));
}

abstract class TeamDetailStateCopyWith<$R, $In extends TeamDetailState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  TeamModelCopyWith<$R, TeamModel, TeamModel> get team;
  $R call({bool? editMode, TeamModel? team, int? selectedTeamIndex});
  TeamDetailStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TeamDetailStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TeamDetailState, $Out>
    implements TeamDetailStateCopyWith<$R, TeamDetailState, $Out> {
  _TeamDetailStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TeamDetailState> $mapper =
      TeamDetailStateMapper.ensureInitialized();
  @override
  TeamModelCopyWith<$R, TeamModel, TeamModel> get team =>
      $value.team.copyWith.$chain((v) => call(team: v));
  @override
  $R call({bool? editMode, TeamModel? team, int? selectedTeamIndex}) =>
      $apply(FieldCopyWithData({
        if (editMode != null) #editMode: editMode,
        if (team != null) #team: team,
        if (selectedTeamIndex != null) #selectedTeamIndex: selectedTeamIndex
      }));
  @override
  TeamDetailState $make(CopyWithData data) => TeamDetailState(
      editMode: data.get(#editMode, or: $value.editMode),
      team: data.get(#team, or: $value.team),
      selectedTeamIndex:
          data.get(#selectedTeamIndex, or: $value.selectedTeamIndex));

  @override
  TeamDetailStateCopyWith<$R2, TeamDetailState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TeamDetailStateCopyWithImpl($value, $cast, t);
}
