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

/// @nodoc
mixin _$MatchPenaltyState {
  bool get editMode => throw _privateConstructorUsedError;
  List<MatchTeamModel> get teams => throw _privateConstructorUsedError;
  PenaltyModel get penalty => throw _privateConstructorUsedError;
  List<String>? get integrationPenaltyTypes =>
      throw _privateConstructorUsedError;

  /// Create a copy of MatchPenaltyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchPenaltyStateCopyWith<MatchPenaltyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchPenaltyStateCopyWith<$Res> {
  factory $MatchPenaltyStateCopyWith(
          MatchPenaltyState value, $Res Function(MatchPenaltyState) then) =
      _$MatchPenaltyStateCopyWithImpl<$Res, MatchPenaltyState>;
  @useResult
  $Res call(
      {bool editMode,
      List<MatchTeamModel> teams,
      PenaltyModel penalty,
      List<String>? integrationPenaltyTypes});
}

/// @nodoc
class _$MatchPenaltyStateCopyWithImpl<$Res, $Val extends MatchPenaltyState>
    implements $MatchPenaltyStateCopyWith<$Res> {
  _$MatchPenaltyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchPenaltyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editMode = null,
    Object? teams = null,
    Object? penalty = null,
    Object? integrationPenaltyTypes = freezed,
  }) {
    return _then(_value.copyWith(
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      teams: null == teams
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<MatchTeamModel>,
      penalty: null == penalty
          ? _value.penalty
          : penalty // ignore: cast_nullable_to_non_nullable
              as PenaltyModel,
      integrationPenaltyTypes: freezed == integrationPenaltyTypes
          ? _value.integrationPenaltyTypes
          : integrationPenaltyTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
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
  $Res call(
      {bool editMode,
      List<MatchTeamModel> teams,
      PenaltyModel penalty,
      List<String>? integrationPenaltyTypes});
}

/// @nodoc
class __$$MatchPenaltyStateImplCopyWithImpl<$Res>
    extends _$MatchPenaltyStateCopyWithImpl<$Res, _$MatchPenaltyStateImpl>
    implements _$$MatchPenaltyStateImplCopyWith<$Res> {
  __$$MatchPenaltyStateImplCopyWithImpl(_$MatchPenaltyStateImpl _value,
      $Res Function(_$MatchPenaltyStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchPenaltyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editMode = null,
    Object? teams = null,
    Object? penalty = null,
    Object? integrationPenaltyTypes = freezed,
  }) {
    return _then(_$MatchPenaltyStateImpl(
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      teams: null == teams
          ? _value._teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<MatchTeamModel>,
      penalty: null == penalty
          ? _value.penalty
          : penalty // ignore: cast_nullable_to_non_nullable
              as PenaltyModel,
      integrationPenaltyTypes: freezed == integrationPenaltyTypes
          ? _value._integrationPenaltyTypes
          : integrationPenaltyTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$MatchPenaltyStateImpl implements _MatchPenaltyState {
  const _$MatchPenaltyStateImpl(
      {required this.editMode,
      required final List<MatchTeamModel> teams,
      required this.penalty,
      required final List<String>? integrationPenaltyTypes})
      : _teams = teams,
        _integrationPenaltyTypes = integrationPenaltyTypes;

  @override
  final bool editMode;
  final List<MatchTeamModel> _teams;
  @override
  List<MatchTeamModel> get teams {
    if (_teams is EqualUnmodifiableListView) return _teams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teams);
  }

  @override
  final PenaltyModel penalty;
  final List<String>? _integrationPenaltyTypes;
  @override
  List<String>? get integrationPenaltyTypes {
    final value = _integrationPenaltyTypes;
    if (value == null) return null;
    if (_integrationPenaltyTypes is EqualUnmodifiableListView)
      return _integrationPenaltyTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MatchPenaltyState(editMode: $editMode, teams: $teams, penalty: $penalty, integrationPenaltyTypes: $integrationPenaltyTypes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchPenaltyStateImpl &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode) &&
            const DeepCollectionEquality().equals(other._teams, _teams) &&
            (identical(other.penalty, penalty) || other.penalty == penalty) &&
            const DeepCollectionEquality().equals(
                other._integrationPenaltyTypes, _integrationPenaltyTypes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      editMode,
      const DeepCollectionEquality().hash(_teams),
      penalty,
      const DeepCollectionEquality().hash(_integrationPenaltyTypes));

  /// Create a copy of MatchPenaltyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchPenaltyStateImplCopyWith<_$MatchPenaltyStateImpl> get copyWith =>
      __$$MatchPenaltyStateImplCopyWithImpl<_$MatchPenaltyStateImpl>(
          this, _$identity);
}

abstract class _MatchPenaltyState implements MatchPenaltyState {
  const factory _MatchPenaltyState(
          {required final bool editMode,
          required final List<MatchTeamModel> teams,
          required final PenaltyModel penalty,
          required final List<String>? integrationPenaltyTypes}) =
      _$MatchPenaltyStateImpl;

  @override
  bool get editMode;
  @override
  List<MatchTeamModel> get teams;
  @override
  PenaltyModel get penalty;
  @override
  List<String>? get integrationPenaltyTypes;

  /// Create a copy of MatchPenaltyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchPenaltyStateImplCopyWith<_$MatchPenaltyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
