// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_penalty_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MatchPenaltyState _$MatchPenaltyStateFromJson(Map<String, dynamic> json) {
  return _MatchPenaltyState.fromJson(json);
}

/// @nodoc
mixin _$MatchPenaltyState {
  bool get editMode => throw _privateConstructorUsedError;
  List<TeamModel> get teams => throw _privateConstructorUsedError;
  PenaltyModel get penalty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchPenaltyStateCopyWith<MatchPenaltyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchPenaltyStateCopyWith<$Res> {
  factory $MatchPenaltyStateCopyWith(
          MatchPenaltyState value, $Res Function(MatchPenaltyState) then) =
      _$MatchPenaltyStateCopyWithImpl<$Res, MatchPenaltyState>;
  @useResult
  $Res call({bool editMode, List<TeamModel> teams, PenaltyModel penalty});

  $PenaltyModelCopyWith<$Res> get penalty;
}

/// @nodoc
class _$MatchPenaltyStateCopyWithImpl<$Res, $Val extends MatchPenaltyState>
    implements $MatchPenaltyStateCopyWith<$Res> {
  _$MatchPenaltyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editMode = null,
    Object? teams = null,
    Object? penalty = null,
  }) {
    return _then(_value.copyWith(
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      teams: null == teams
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<TeamModel>,
      penalty: null == penalty
          ? _value.penalty
          : penalty // ignore: cast_nullable_to_non_nullable
              as PenaltyModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PenaltyModelCopyWith<$Res> get penalty {
    return $PenaltyModelCopyWith<$Res>(_value.penalty, (value) {
      return _then(_value.copyWith(penalty: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MatchPenaltyStateImplCopyWith<$Res>
    implements $MatchPenaltyStateCopyWith<$Res> {
  factory _$$MatchPenaltyStateImplCopyWith(_$MatchPenaltyStateImpl value,
          $Res Function(_$MatchPenaltyStateImpl) then) =
      __$$MatchPenaltyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool editMode, List<TeamModel> teams, PenaltyModel penalty});

  @override
  $PenaltyModelCopyWith<$Res> get penalty;
}

/// @nodoc
class __$$MatchPenaltyStateImplCopyWithImpl<$Res>
    extends _$MatchPenaltyStateCopyWithImpl<$Res, _$MatchPenaltyStateImpl>
    implements _$$MatchPenaltyStateImplCopyWith<$Res> {
  __$$MatchPenaltyStateImplCopyWithImpl(_$MatchPenaltyStateImpl _value,
      $Res Function(_$MatchPenaltyStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editMode = null,
    Object? teams = null,
    Object? penalty = null,
  }) {
    return _then(_$MatchPenaltyStateImpl(
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      teams: null == teams
          ? _value._teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<TeamModel>,
      penalty: null == penalty
          ? _value.penalty
          : penalty // ignore: cast_nullable_to_non_nullable
              as PenaltyModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchPenaltyStateImpl implements _MatchPenaltyState {
  const _$MatchPenaltyStateImpl(
      {required this.editMode,
      required final List<TeamModel> teams,
      required this.penalty})
      : _teams = teams;

  factory _$MatchPenaltyStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchPenaltyStateImplFromJson(json);

  @override
  final bool editMode;
  final List<TeamModel> _teams;
  @override
  List<TeamModel> get teams {
    if (_teams is EqualUnmodifiableListView) return _teams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teams);
  }

  @override
  final PenaltyModel penalty;

  @override
  String toString() {
    return 'MatchPenaltyState(editMode: $editMode, teams: $teams, penalty: $penalty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchPenaltyStateImpl &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode) &&
            const DeepCollectionEquality().equals(other._teams, _teams) &&
            (identical(other.penalty, penalty) || other.penalty == penalty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, editMode,
      const DeepCollectionEquality().hash(_teams), penalty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchPenaltyStateImplCopyWith<_$MatchPenaltyStateImpl> get copyWith =>
      __$$MatchPenaltyStateImplCopyWithImpl<_$MatchPenaltyStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchPenaltyStateImplToJson(
      this,
    );
  }
}

abstract class _MatchPenaltyState implements MatchPenaltyState {
  const factory _MatchPenaltyState(
      {required final bool editMode,
      required final List<TeamModel> teams,
      required final PenaltyModel penalty}) = _$MatchPenaltyStateImpl;

  factory _MatchPenaltyState.fromJson(Map<String, dynamic> json) =
      _$MatchPenaltyStateImpl.fromJson;

  @override
  bool get editMode;
  @override
  List<TeamModel> get teams;
  @override
  PenaltyModel get penalty;
  @override
  @JsonKey(ignore: true)
  _$$MatchPenaltyStateImplCopyWith<_$MatchPenaltyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
