// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'improvisation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImprovisationModel _$ImprovisationModelFromJson(Map<String, dynamic> json) {
  return _ImprovisationModel.fromJson(json);
}

/// @nodoc
mixin _$ImprovisationModel {
  int get id => throw _privateConstructorUsedError;
  ImprovisationType get type => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;
  List<int> get durationsInSeconds => throw _privateConstructorUsedError;
  String get performers => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  int get timeBufferInSeconds => throw _privateConstructorUsedError;
  int get huddleTimerInSeconds => throw _privateConstructorUsedError;
  String? get integrationEntityId => throw _privateConstructorUsedError;

  /// Serializes this ImprovisationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImprovisationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImprovisationModelCopyWith<ImprovisationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImprovisationModelCopyWith<$Res> {
  factory $ImprovisationModelCopyWith(
          ImprovisationModel value, $Res Function(ImprovisationModel) then) =
      _$ImprovisationModelCopyWithImpl<$Res, ImprovisationModel>;
  @useResult
  $Res call(
      {int id,
      ImprovisationType type,
      String category,
      String theme,
      List<int> durationsInSeconds,
      String performers,
      String notes,
      int timeBufferInSeconds,
      int huddleTimerInSeconds,
      String? integrationEntityId});
}

/// @nodoc
class _$ImprovisationModelCopyWithImpl<$Res, $Val extends ImprovisationModel>
    implements $ImprovisationModelCopyWith<$Res> {
  _$ImprovisationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImprovisationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? category = null,
    Object? theme = null,
    Object? durationsInSeconds = null,
    Object? performers = null,
    Object? notes = null,
    Object? timeBufferInSeconds = null,
    Object? huddleTimerInSeconds = null,
    Object? integrationEntityId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ImprovisationType,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      durationsInSeconds: null == durationsInSeconds
          ? _value.durationsInSeconds
          : durationsInSeconds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      performers: null == performers
          ? _value.performers
          : performers // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      timeBufferInSeconds: null == timeBufferInSeconds
          ? _value.timeBufferInSeconds
          : timeBufferInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      huddleTimerInSeconds: null == huddleTimerInSeconds
          ? _value.huddleTimerInSeconds
          : huddleTimerInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      integrationEntityId: freezed == integrationEntityId
          ? _value.integrationEntityId
          : integrationEntityId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImprovisationModelImplCopyWith<$Res>
    implements $ImprovisationModelCopyWith<$Res> {
  factory _$$ImprovisationModelImplCopyWith(_$ImprovisationModelImpl value,
          $Res Function(_$ImprovisationModelImpl) then) =
      __$$ImprovisationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      ImprovisationType type,
      String category,
      String theme,
      List<int> durationsInSeconds,
      String performers,
      String notes,
      int timeBufferInSeconds,
      int huddleTimerInSeconds,
      String? integrationEntityId});
}

/// @nodoc
class __$$ImprovisationModelImplCopyWithImpl<$Res>
    extends _$ImprovisationModelCopyWithImpl<$Res, _$ImprovisationModelImpl>
    implements _$$ImprovisationModelImplCopyWith<$Res> {
  __$$ImprovisationModelImplCopyWithImpl(_$ImprovisationModelImpl _value,
      $Res Function(_$ImprovisationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImprovisationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? category = null,
    Object? theme = null,
    Object? durationsInSeconds = null,
    Object? performers = null,
    Object? notes = null,
    Object? timeBufferInSeconds = null,
    Object? huddleTimerInSeconds = null,
    Object? integrationEntityId = freezed,
  }) {
    return _then(_$ImprovisationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ImprovisationType,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      durationsInSeconds: null == durationsInSeconds
          ? _value._durationsInSeconds
          : durationsInSeconds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      performers: null == performers
          ? _value.performers
          : performers // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      timeBufferInSeconds: null == timeBufferInSeconds
          ? _value.timeBufferInSeconds
          : timeBufferInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      huddleTimerInSeconds: null == huddleTimerInSeconds
          ? _value.huddleTimerInSeconds
          : huddleTimerInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      integrationEntityId: freezed == integrationEntityId
          ? _value.integrationEntityId
          : integrationEntityId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImprovisationModelImpl implements _ImprovisationModel {
  const _$ImprovisationModelImpl(
      {required this.id,
      required this.type,
      required this.category,
      required this.theme,
      required final List<int> durationsInSeconds,
      required this.performers,
      required this.notes,
      this.timeBufferInSeconds = 30,
      this.huddleTimerInSeconds = 30,
      this.integrationEntityId})
      : _durationsInSeconds = durationsInSeconds;

  factory _$ImprovisationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImprovisationModelImplFromJson(json);

  @override
  final int id;
  @override
  final ImprovisationType type;
  @override
  final String category;
  @override
  final String theme;
  final List<int> _durationsInSeconds;
  @override
  List<int> get durationsInSeconds {
    if (_durationsInSeconds is EqualUnmodifiableListView)
      return _durationsInSeconds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_durationsInSeconds);
  }

  @override
  final String performers;
  @override
  final String notes;
  @override
  @JsonKey()
  final int timeBufferInSeconds;
  @override
  @JsonKey()
  final int huddleTimerInSeconds;
  @override
  final String? integrationEntityId;

  @override
  String toString() {
    return 'ImprovisationModel(id: $id, type: $type, category: $category, theme: $theme, durationsInSeconds: $durationsInSeconds, performers: $performers, notes: $notes, timeBufferInSeconds: $timeBufferInSeconds, huddleTimerInSeconds: $huddleTimerInSeconds, integrationEntityId: $integrationEntityId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImprovisationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            const DeepCollectionEquality()
                .equals(other._durationsInSeconds, _durationsInSeconds) &&
            (identical(other.performers, performers) ||
                other.performers == performers) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.timeBufferInSeconds, timeBufferInSeconds) ||
                other.timeBufferInSeconds == timeBufferInSeconds) &&
            (identical(other.huddleTimerInSeconds, huddleTimerInSeconds) ||
                other.huddleTimerInSeconds == huddleTimerInSeconds) &&
            (identical(other.integrationEntityId, integrationEntityId) ||
                other.integrationEntityId == integrationEntityId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      category,
      theme,
      const DeepCollectionEquality().hash(_durationsInSeconds),
      performers,
      notes,
      timeBufferInSeconds,
      huddleTimerInSeconds,
      integrationEntityId);

  /// Create a copy of ImprovisationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImprovisationModelImplCopyWith<_$ImprovisationModelImpl> get copyWith =>
      __$$ImprovisationModelImplCopyWithImpl<_$ImprovisationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImprovisationModelImplToJson(
      this,
    );
  }
}

abstract class _ImprovisationModel implements ImprovisationModel {
  const factory _ImprovisationModel(
      {required final int id,
      required final ImprovisationType type,
      required final String category,
      required final String theme,
      required final List<int> durationsInSeconds,
      required final String performers,
      required final String notes,
      final int timeBufferInSeconds,
      final int huddleTimerInSeconds,
      final String? integrationEntityId}) = _$ImprovisationModelImpl;

  factory _ImprovisationModel.fromJson(Map<String, dynamic> json) =
      _$ImprovisationModelImpl.fromJson;

  @override
  int get id;
  @override
  ImprovisationType get type;
  @override
  String get category;
  @override
  String get theme;
  @override
  List<int> get durationsInSeconds;
  @override
  String get performers;
  @override
  String get notes;
  @override
  int get timeBufferInSeconds;
  @override
  int get huddleTimerInSeconds;
  @override
  String? get integrationEntityId;

  /// Create a copy of ImprovisationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImprovisationModelImplCopyWith<_$ImprovisationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
