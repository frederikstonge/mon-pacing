// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MatchDetailState _$MatchDetailStateFromJson(Map<String, dynamic> json) {
  return _MatchDetailState.fromJson(json);
}

/// @nodoc
mixin _$MatchDetailState {
  bool get initialized => throw _privateConstructorUsedError;
  bool get editMode => throw _privateConstructorUsedError;
  MatchModel get match => throw _privateConstructorUsedError;
  List<String> get allTags => throw _privateConstructorUsedError;
  int get selectedTeamIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchDetailStateCopyWith<MatchDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchDetailStateCopyWith<$Res> {
  factory $MatchDetailStateCopyWith(
          MatchDetailState value, $Res Function(MatchDetailState) then) =
      _$MatchDetailStateCopyWithImpl<$Res, MatchDetailState>;
  @useResult
  $Res call(
      {bool initialized,
      bool editMode,
      MatchModel match,
      List<String> allTags,
      int selectedTeamIndex});

  $MatchModelCopyWith<$Res> get match;
}

/// @nodoc
class _$MatchDetailStateCopyWithImpl<$Res, $Val extends MatchDetailState>
    implements $MatchDetailStateCopyWith<$Res> {
  _$MatchDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialized = null,
    Object? editMode = null,
    Object? match = null,
    Object? allTags = null,
    Object? selectedTeamIndex = null,
  }) {
    return _then(_value.copyWith(
      initialized: null == initialized
          ? _value.initialized
          : initialized // ignore: cast_nullable_to_non_nullable
              as bool,
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      match: null == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as MatchModel,
      allTags: null == allTags
          ? _value.allTags
          : allTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedTeamIndex: null == selectedTeamIndex
          ? _value.selectedTeamIndex
          : selectedTeamIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MatchModelCopyWith<$Res> get match {
    return $MatchModelCopyWith<$Res>(_value.match, (value) {
      return _then(_value.copyWith(match: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MatchDetailStateImplCopyWith<$Res>
    implements $MatchDetailStateCopyWith<$Res> {
  factory _$$MatchDetailStateImplCopyWith(_$MatchDetailStateImpl value,
          $Res Function(_$MatchDetailStateImpl) then) =
      __$$MatchDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool initialized,
      bool editMode,
      MatchModel match,
      List<String> allTags,
      int selectedTeamIndex});

  @override
  $MatchModelCopyWith<$Res> get match;
}

/// @nodoc
class __$$MatchDetailStateImplCopyWithImpl<$Res>
    extends _$MatchDetailStateCopyWithImpl<$Res, _$MatchDetailStateImpl>
    implements _$$MatchDetailStateImplCopyWith<$Res> {
  __$$MatchDetailStateImplCopyWithImpl(_$MatchDetailStateImpl _value,
      $Res Function(_$MatchDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialized = null,
    Object? editMode = null,
    Object? match = null,
    Object? allTags = null,
    Object? selectedTeamIndex = null,
  }) {
    return _then(_$MatchDetailStateImpl(
      initialized: null == initialized
          ? _value.initialized
          : initialized // ignore: cast_nullable_to_non_nullable
              as bool,
      editMode: null == editMode
          ? _value.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      match: null == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as MatchModel,
      allTags: null == allTags
          ? _value._allTags
          : allTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedTeamIndex: null == selectedTeamIndex
          ? _value.selectedTeamIndex
          : selectedTeamIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchDetailStateImpl implements _MatchDetailState {
  const _$MatchDetailStateImpl(
      {required this.initialized,
      required this.editMode,
      required this.match,
      required final List<String> allTags,
      this.selectedTeamIndex = 0})
      : _allTags = allTags;

  factory _$MatchDetailStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchDetailStateImplFromJson(json);

  @override
  final bool initialized;
  @override
  final bool editMode;
  @override
  final MatchModel match;
  final List<String> _allTags;
  @override
  List<String> get allTags {
    if (_allTags is EqualUnmodifiableListView) return _allTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTags);
  }

  @override
  @JsonKey()
  final int selectedTeamIndex;

  @override
  String toString() {
    return 'MatchDetailState(initialized: $initialized, editMode: $editMode, match: $match, allTags: $allTags, selectedTeamIndex: $selectedTeamIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchDetailStateImpl &&
            (identical(other.initialized, initialized) ||
                other.initialized == initialized) &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode) &&
            (identical(other.match, match) || other.match == match) &&
            const DeepCollectionEquality().equals(other._allTags, _allTags) &&
            (identical(other.selectedTeamIndex, selectedTeamIndex) ||
                other.selectedTeamIndex == selectedTeamIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, initialized, editMode, match,
      const DeepCollectionEquality().hash(_allTags), selectedTeamIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchDetailStateImplCopyWith<_$MatchDetailStateImpl> get copyWith =>
      __$$MatchDetailStateImplCopyWithImpl<_$MatchDetailStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchDetailStateImplToJson(
      this,
    );
  }
}

abstract class _MatchDetailState implements MatchDetailState {
  const factory _MatchDetailState(
      {required final bool initialized,
      required final bool editMode,
      required final MatchModel match,
      required final List<String> allTags,
      final int selectedTeamIndex}) = _$MatchDetailStateImpl;

  factory _MatchDetailState.fromJson(Map<String, dynamic> json) =
      _$MatchDetailStateImpl.fromJson;

  @override
  bool get initialized;
  @override
  bool get editMode;
  @override
  MatchModel get match;
  @override
  List<String> get allTags;
  @override
  int get selectedTeamIndex;
  @override
  @JsonKey(ignore: true)
  _$$MatchDetailStateImplCopyWith<_$MatchDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
