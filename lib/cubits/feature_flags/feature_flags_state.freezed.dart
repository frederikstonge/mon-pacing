// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_flags_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeatureFlagsState _$FeatureFlagsStateFromJson(Map<String, dynamic> json) {
  return _FeatureFlagsState.fromJson(json);
}

/// @nodoc
mixin _$FeatureFlagsState {
  FeatureFlagsStatus get status => throw _privateConstructorUsedError;
  bool? get enableIntegrations => throw _privateConstructorUsedError;

  /// Serializes this FeatureFlagsState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeatureFlagsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeatureFlagsStateCopyWith<FeatureFlagsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureFlagsStateCopyWith<$Res> {
  factory $FeatureFlagsStateCopyWith(
          FeatureFlagsState value, $Res Function(FeatureFlagsState) then) =
      _$FeatureFlagsStateCopyWithImpl<$Res, FeatureFlagsState>;
  @useResult
  $Res call({FeatureFlagsStatus status, bool? enableIntegrations});
}

/// @nodoc
class _$FeatureFlagsStateCopyWithImpl<$Res, $Val extends FeatureFlagsState>
    implements $FeatureFlagsStateCopyWith<$Res> {
  _$FeatureFlagsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeatureFlagsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? enableIntegrations = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FeatureFlagsStatus,
      enableIntegrations: freezed == enableIntegrations
          ? _value.enableIntegrations
          : enableIntegrations // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeatureFlagsStateImplCopyWith<$Res>
    implements $FeatureFlagsStateCopyWith<$Res> {
  factory _$$FeatureFlagsStateImplCopyWith(_$FeatureFlagsStateImpl value,
          $Res Function(_$FeatureFlagsStateImpl) then) =
      __$$FeatureFlagsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FeatureFlagsStatus status, bool? enableIntegrations});
}

/// @nodoc
class __$$FeatureFlagsStateImplCopyWithImpl<$Res>
    extends _$FeatureFlagsStateCopyWithImpl<$Res, _$FeatureFlagsStateImpl>
    implements _$$FeatureFlagsStateImplCopyWith<$Res> {
  __$$FeatureFlagsStateImplCopyWithImpl(_$FeatureFlagsStateImpl _value,
      $Res Function(_$FeatureFlagsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeatureFlagsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? enableIntegrations = freezed,
  }) {
    return _then(_$FeatureFlagsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FeatureFlagsStatus,
      enableIntegrations: freezed == enableIntegrations
          ? _value.enableIntegrations
          : enableIntegrations // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeatureFlagsStateImpl implements _FeatureFlagsState {
  const _$FeatureFlagsStateImpl(
      {required this.status, this.enableIntegrations = false});

  factory _$FeatureFlagsStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeatureFlagsStateImplFromJson(json);

  @override
  final FeatureFlagsStatus status;
  @override
  @JsonKey()
  final bool? enableIntegrations;

  @override
  String toString() {
    return 'FeatureFlagsState(status: $status, enableIntegrations: $enableIntegrations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatureFlagsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.enableIntegrations, enableIntegrations) ||
                other.enableIntegrations == enableIntegrations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, enableIntegrations);

  /// Create a copy of FeatureFlagsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatureFlagsStateImplCopyWith<_$FeatureFlagsStateImpl> get copyWith =>
      __$$FeatureFlagsStateImplCopyWithImpl<_$FeatureFlagsStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeatureFlagsStateImplToJson(
      this,
    );
  }
}

abstract class _FeatureFlagsState implements FeatureFlagsState {
  const factory _FeatureFlagsState(
      {required final FeatureFlagsStatus status,
      final bool? enableIntegrations}) = _$FeatureFlagsStateImpl;

  factory _FeatureFlagsState.fromJson(Map<String, dynamic> json) =
      _$FeatureFlagsStateImpl.fromJson;

  @override
  FeatureFlagsStatus get status;
  @override
  bool? get enableIntegrations;

  /// Create a copy of FeatureFlagsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeatureFlagsStateImplCopyWith<_$FeatureFlagsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
