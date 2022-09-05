// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'penalty_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PenaltyModel _$PenaltyModelFromJson(Map<String, dynamic> json) {
  return _PenaltyModel.fromJson(json);
}

/// @nodoc
mixin _$PenaltyModel {
  bool get major => throw _privateConstructorUsedError;
  String get player => throw _privateConstructorUsedError;
  int get teamId => throw _privateConstructorUsedError;
  int get improvisationId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PenaltyModelCopyWith<PenaltyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PenaltyModelCopyWith<$Res> {
  factory $PenaltyModelCopyWith(
          PenaltyModel value, $Res Function(PenaltyModel) then) =
      _$PenaltyModelCopyWithImpl<$Res>;
  $Res call({bool major, String player, int teamId, int improvisationId});
}

/// @nodoc
class _$PenaltyModelCopyWithImpl<$Res> implements $PenaltyModelCopyWith<$Res> {
  _$PenaltyModelCopyWithImpl(this._value, this._then);

  final PenaltyModel _value;
  // ignore: unused_field
  final $Res Function(PenaltyModel) _then;

  @override
  $Res call({
    Object? major = freezed,
    Object? player = freezed,
    Object? teamId = freezed,
    Object? improvisationId = freezed,
  }) {
    return _then(_value.copyWith(
      major: major == freezed
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as bool,
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
      improvisationId: improvisationId == freezed
          ? _value.improvisationId
          : improvisationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_PenaltyModelCopyWith<$Res>
    implements $PenaltyModelCopyWith<$Res> {
  factory _$$_PenaltyModelCopyWith(
          _$_PenaltyModel value, $Res Function(_$_PenaltyModel) then) =
      __$$_PenaltyModelCopyWithImpl<$Res>;
  @override
  $Res call({bool major, String player, int teamId, int improvisationId});
}

/// @nodoc
class __$$_PenaltyModelCopyWithImpl<$Res>
    extends _$PenaltyModelCopyWithImpl<$Res>
    implements _$$_PenaltyModelCopyWith<$Res> {
  __$$_PenaltyModelCopyWithImpl(
      _$_PenaltyModel _value, $Res Function(_$_PenaltyModel) _then)
      : super(_value, (v) => _then(v as _$_PenaltyModel));

  @override
  _$_PenaltyModel get _value => super._value as _$_PenaltyModel;

  @override
  $Res call({
    Object? major = freezed,
    Object? player = freezed,
    Object? teamId = freezed,
    Object? improvisationId = freezed,
  }) {
    return _then(_$_PenaltyModel(
      major: major == freezed
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as bool,
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as String,
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
      improvisationId: improvisationId == freezed
          ? _value.improvisationId
          : improvisationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PenaltyModel implements _PenaltyModel {
  const _$_PenaltyModel(
      {required this.major,
      required this.player,
      required this.teamId,
      required this.improvisationId});

  factory _$_PenaltyModel.fromJson(Map<String, dynamic> json) =>
      _$$_PenaltyModelFromJson(json);

  @override
  final bool major;
  @override
  final String player;
  @override
  final int teamId;
  @override
  final int improvisationId;

  @override
  String toString() {
    return 'PenaltyModel(major: $major, player: $player, teamId: $teamId, improvisationId: $improvisationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PenaltyModel &&
            const DeepCollectionEquality().equals(other.major, major) &&
            const DeepCollectionEquality().equals(other.player, player) &&
            const DeepCollectionEquality().equals(other.teamId, teamId) &&
            const DeepCollectionEquality()
                .equals(other.improvisationId, improvisationId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(major),
      const DeepCollectionEquality().hash(player),
      const DeepCollectionEquality().hash(teamId),
      const DeepCollectionEquality().hash(improvisationId));

  @JsonKey(ignore: true)
  @override
  _$$_PenaltyModelCopyWith<_$_PenaltyModel> get copyWith =>
      __$$_PenaltyModelCopyWithImpl<_$_PenaltyModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PenaltyModelToJson(
      this,
    );
  }
}

abstract class _PenaltyModel implements PenaltyModel {
  const factory _PenaltyModel(
      {required final bool major,
      required final String player,
      required final int teamId,
      required final int improvisationId}) = _$_PenaltyModel;

  factory _PenaltyModel.fromJson(Map<String, dynamic> json) =
      _$_PenaltyModel.fromJson;

  @override
  bool get major;
  @override
  String get player;
  @override
  int get teamId;
  @override
  int get improvisationId;
  @override
  @JsonKey(ignore: true)
  _$$_PenaltyModelCopyWith<_$_PenaltyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
