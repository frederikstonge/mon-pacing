// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pacing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PacingModel _$PacingModelFromJson(Map<String, dynamic> json) {
  return _PacingModel.fromJson(json);
}

/// @nodoc
mixin _$PacingModel {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime? get createdDate => throw _privateConstructorUsedError;
  DateTime? get modifiedDate => throw _privateConstructorUsedError;
  bool get enablePaddingDuration => throw _privateConstructorUsedError;
  Duration get paddingDuration => throw _privateConstructorUsedError;
  List<ImprovisationModel> get improvisations =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PacingModelCopyWith<PacingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PacingModelCopyWith<$Res> {
  factory $PacingModelCopyWith(
          PacingModel value, $Res Function(PacingModel) then) =
      _$PacingModelCopyWithImpl<$Res, PacingModel>;
  @useResult
  $Res call(
      {int? id,
      String name,
      DateTime? createdDate,
      DateTime? modifiedDate,
      bool enablePaddingDuration,
      Duration paddingDuration,
      List<ImprovisationModel> improvisations});
}

/// @nodoc
class _$PacingModelCopyWithImpl<$Res, $Val extends PacingModel>
    implements $PacingModelCopyWith<$Res> {
  _$PacingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
    Object? enablePaddingDuration = null,
    Object? paddingDuration = null,
    Object? improvisations = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      enablePaddingDuration: null == enablePaddingDuration
          ? _value.enablePaddingDuration
          : enablePaddingDuration // ignore: cast_nullable_to_non_nullable
              as bool,
      paddingDuration: null == paddingDuration
          ? _value.paddingDuration
          : paddingDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      improvisations: null == improvisations
          ? _value.improvisations
          : improvisations // ignore: cast_nullable_to_non_nullable
              as List<ImprovisationModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PacingModelCopyWith<$Res>
    implements $PacingModelCopyWith<$Res> {
  factory _$$_PacingModelCopyWith(
          _$_PacingModel value, $Res Function(_$_PacingModel) then) =
      __$$_PacingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      DateTime? createdDate,
      DateTime? modifiedDate,
      bool enablePaddingDuration,
      Duration paddingDuration,
      List<ImprovisationModel> improvisations});
}

/// @nodoc
class __$$_PacingModelCopyWithImpl<$Res>
    extends _$PacingModelCopyWithImpl<$Res, _$_PacingModel>
    implements _$$_PacingModelCopyWith<$Res> {
  __$$_PacingModelCopyWithImpl(
      _$_PacingModel _value, $Res Function(_$_PacingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
    Object? enablePaddingDuration = null,
    Object? paddingDuration = null,
    Object? improvisations = null,
  }) {
    return _then(_$_PacingModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      enablePaddingDuration: null == enablePaddingDuration
          ? _value.enablePaddingDuration
          : enablePaddingDuration // ignore: cast_nullable_to_non_nullable
              as bool,
      paddingDuration: null == paddingDuration
          ? _value.paddingDuration
          : paddingDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      improvisations: null == improvisations
          ? _value._improvisations
          : improvisations // ignore: cast_nullable_to_non_nullable
              as List<ImprovisationModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PacingModel implements _PacingModel {
  const _$_PacingModel(
      {required this.id,
      required this.name,
      required this.createdDate,
      required this.modifiedDate,
      required this.enablePaddingDuration,
      required this.paddingDuration,
      required final List<ImprovisationModel> improvisations})
      : _improvisations = improvisations;

  factory _$_PacingModel.fromJson(Map<String, dynamic> json) =>
      _$$_PacingModelFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final DateTime? createdDate;
  @override
  final DateTime? modifiedDate;
  @override
  final bool enablePaddingDuration;
  @override
  final Duration paddingDuration;
  final List<ImprovisationModel> _improvisations;
  @override
  List<ImprovisationModel> get improvisations {
    if (_improvisations is EqualUnmodifiableListView) return _improvisations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_improvisations);
  }

  @override
  String toString() {
    return 'PacingModel(id: $id, name: $name, createdDate: $createdDate, modifiedDate: $modifiedDate, enablePaddingDuration: $enablePaddingDuration, paddingDuration: $paddingDuration, improvisations: $improvisations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PacingModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate) &&
            (identical(other.enablePaddingDuration, enablePaddingDuration) ||
                other.enablePaddingDuration == enablePaddingDuration) &&
            (identical(other.paddingDuration, paddingDuration) ||
                other.paddingDuration == paddingDuration) &&
            const DeepCollectionEquality()
                .equals(other._improvisations, _improvisations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      createdDate,
      modifiedDate,
      enablePaddingDuration,
      paddingDuration,
      const DeepCollectionEquality().hash(_improvisations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PacingModelCopyWith<_$_PacingModel> get copyWith =>
      __$$_PacingModelCopyWithImpl<_$_PacingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PacingModelToJson(
      this,
    );
  }
}

abstract class _PacingModel implements PacingModel, BaseModel {
  const factory _PacingModel(
      {required final int? id,
      required final String name,
      required final DateTime? createdDate,
      required final DateTime? modifiedDate,
      required final bool enablePaddingDuration,
      required final Duration paddingDuration,
      required final List<ImprovisationModel> improvisations}) = _$_PacingModel;

  factory _PacingModel.fromJson(Map<String, dynamic> json) =
      _$_PacingModel.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  DateTime? get createdDate;
  @override
  DateTime? get modifiedDate;
  @override
  bool get enablePaddingDuration;
  @override
  Duration get paddingDuration;
  @override
  List<ImprovisationModel> get improvisations;
  @override
  @JsonKey(ignore: true)
  _$$_PacingModelCopyWith<_$_PacingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
