// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'teams_state.dart';

class TeamsStateMapper extends ClassMapperBase<TeamsState> {
  TeamsStateMapper._();

  static TeamsStateMapper? _instance;
  static TeamsStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TeamsStateMapper._());
      TeamsStatusMapper.ensureInitialized();
      TeamModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TeamsState';

  static TeamsStatus _$status(TeamsState v) => v.status;
  static const Field<TeamsState, TeamsStatus> _f$status =
      Field('status', _$status);
  static String? _$error(TeamsState v) => v.error;
  static const Field<TeamsState, String> _f$error =
      Field('error', _$error, opt: true);
  static List<TeamModel> _$teams(TeamsState v) => v.teams;
  static const Field<TeamsState, List<TeamModel>> _f$teams =
      Field('teams', _$teams, opt: true, def: const []);
  static bool _$hasMore(TeamsState v) => v.hasMore;
  static const Field<TeamsState, bool> _f$hasMore =
      Field('hasMore', _$hasMore, opt: true, def: true);

  @override
  final MappableFields<TeamsState> fields = const {
    #status: _f$status,
    #error: _f$error,
    #teams: _f$teams,
    #hasMore: _f$hasMore,
  };

  static TeamsState _instantiate(DecodingData data) {
    return TeamsState(
        status: data.dec(_f$status),
        error: data.dec(_f$error),
        teams: data.dec(_f$teams),
        hasMore: data.dec(_f$hasMore));
  }

  @override
  final Function instantiate = _instantiate;

  static TeamsState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TeamsState>(map);
  }

  static TeamsState fromJson(String json) {
    return ensureInitialized().decodeJson<TeamsState>(json);
  }
}

mixin TeamsStateMappable {
  String toJson() {
    return TeamsStateMapper.ensureInitialized()
        .encodeJson<TeamsState>(this as TeamsState);
  }

  Map<String, dynamic> toMap() {
    return TeamsStateMapper.ensureInitialized()
        .encodeMap<TeamsState>(this as TeamsState);
  }

  TeamsStateCopyWith<TeamsState, TeamsState, TeamsState> get copyWith =>
      _TeamsStateCopyWithImpl<TeamsState, TeamsState>(
          this as TeamsState, $identity, $identity);
  @override
  String toString() {
    return TeamsStateMapper.ensureInitialized()
        .stringifyValue(this as TeamsState);
  }

  @override
  bool operator ==(Object other) {
    return TeamsStateMapper.ensureInitialized()
        .equalsValue(this as TeamsState, other);
  }

  @override
  int get hashCode {
    return TeamsStateMapper.ensureInitialized().hashValue(this as TeamsState);
  }
}

extension TeamsStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TeamsState, $Out> {
  TeamsStateCopyWith<$R, TeamsState, $Out> get $asTeamsState =>
      $base.as((v, t, t2) => _TeamsStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TeamsStateCopyWith<$R, $In extends TeamsState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, TeamModel, TeamModelCopyWith<$R, TeamModel, TeamModel>>
      get teams;
  $R call(
      {TeamsStatus? status,
      String? error,
      List<TeamModel>? teams,
      bool? hasMore});
  TeamsStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TeamsStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TeamsState, $Out>
    implements TeamsStateCopyWith<$R, TeamsState, $Out> {
  _TeamsStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TeamsState> $mapper =
      TeamsStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, TeamModel, TeamModelCopyWith<$R, TeamModel, TeamModel>>
      get teams => ListCopyWith(
          $value.teams, (v, t) => v.copyWith.$chain(t), (v) => call(teams: v));
  @override
  $R call(
          {TeamsStatus? status,
          Object? error = $none,
          List<TeamModel>? teams,
          bool? hasMore}) =>
      $apply(FieldCopyWithData({
        if (status != null) #status: status,
        if (error != $none) #error: error,
        if (teams != null) #teams: teams,
        if (hasMore != null) #hasMore: hasMore
      }));
  @override
  TeamsState $make(CopyWithData data) => TeamsState(
      status: data.get(#status, or: $value.status),
      error: data.get(#error, or: $value.error),
      teams: data.get(#teams, or: $value.teams),
      hasMore: data.get(#hasMore, or: $value.hasMore));

  @override
  TeamsStateCopyWith<$R2, TeamsState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TeamsStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
