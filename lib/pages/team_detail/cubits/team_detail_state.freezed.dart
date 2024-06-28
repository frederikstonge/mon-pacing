// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TeamDetailState _$TeamDetailStateFromJson(Map<String, dynamic> json) {
  return _TeamDetailState.fromJson(json);
}

/// @nodoc
mixin _$TeamDetailState {
  bool get editMode => throw _privateConstructorUsedError;
  TeamModel get team => throw _privateConstructorUsedError;
  int get selectedTeamIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamDetailStateCopyWith<TeamDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamDetailStateCopyWith<$Res> {
  factory $TeamDetailStateCopyWith(
          TeamDetailState value, $Res Function(TeamDetailState) then) =
      _$TeamDetailStateCopyWithImpl<$Res, TeamDetailState>;
  @useResult
  $Res call({bool editMode, TeamModel team, int selectedTeamIndex});

  $TeamModelCopyWith<$Res> get team;
}

/// @nodoc
class _$TeamDetailStateCopyWithImpl<$Res, $Val extends TeamDetailState>
    implements $TeamDetailStateCopyWith<$Res> {
  _$TeamDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editMode = null,
    Object? team = null,
    Object? selectedTeamIndex = null,
  }) {
    return _then(_value.copyWith(
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as TeamModel,
      selectedTeamIndex: null == selectedTeamIndex
          ? _value.selectedTeamIndex
          : selectedTeamIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamModelCopyWith<$Res> get team {
    return $TeamModelCopyWith<$Res>(_value.team, (value) {
      return _then(_value.copyWith(team: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TeamDetailStateImplCopyWith<$Res>
    implements $TeamDetailStateCopyWith<$Res> {
  factory _$$TeamDetailStateImplCopyWith(_$TeamDetailStateImpl value,
          $Res Function(_$TeamDetailStateImpl) then) =
      __$$TeamDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool editMode, TeamModel team, int selectedTeamIndex});

  @override
  $TeamModelCopyWith<$Res> get team;
}

/// @nodoc
class __$$TeamDetailStateImplCopyWithImpl<$Res>
    extends _$TeamDetailStateCopyWithImpl<$Res, _$TeamDetailStateImpl>
    implements _$$TeamDetailStateImplCopyWith<$Res> {
  __$$TeamDetailStateImplCopyWithImpl(
      _$TeamDetailStateImpl _value, $Res Function(_$TeamDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editMode = null,
    Object? team = null,
    Object? selectedTeamIndex = null,
  }) {
    return _then(_$TeamDetailStateImpl(
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as TeamModel,
      selectedTeamIndex: null == selectedTeamIndex
          ? _value.selectedTeamIndex
          : selectedTeamIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeamDetailStateImpl implements _TeamDetailState {
  const _$TeamDetailStateImpl(
      {required this.editMode, required this.team, this.selectedTeamIndex = 0});

  factory _$TeamDetailStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeamDetailStateImplFromJson(json);

  @override
  final bool editMode;
  @override
  final TeamModel team;
  @override
  @JsonKey()
  final int selectedTeamIndex;

  @override
  String toString() {
    return 'TeamDetailState(editMode: $editMode, team: $team, selectedTeamIndex: $selectedTeamIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamDetailStateImpl &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode) &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.selectedTeamIndex, selectedTeamIndex) ||
                other.selectedTeamIndex == selectedTeamIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, editMode, team, selectedTeamIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamDetailStateImplCopyWith<_$TeamDetailStateImpl> get copyWith =>
      __$$TeamDetailStateImplCopyWithImpl<_$TeamDetailStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeamDetailStateImplToJson(
      this,
    );
  }
}

abstract class _TeamDetailState implements TeamDetailState {
  const factory _TeamDetailState(
      {required final bool editMode,
      required final TeamModel team,
      final int selectedTeamIndex}) = _$TeamDetailStateImpl;

  factory _TeamDetailState.fromJson(Map<String, dynamic> json) =
      _$TeamDetailStateImpl.fromJson;

  @override
  bool get editMode;
  @override
  TeamModel get team;
  @override
  int get selectedTeamIndex;
  @override
  @JsonKey(ignore: true)
  _$$TeamDetailStateImplCopyWith<_$TeamDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
