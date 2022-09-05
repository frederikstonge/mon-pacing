// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$PacingModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String name,
      DateTime? createdDate,
      DateTime? modifiedDate,
      List<ImprovisationModel> improvisations});
}

/// @nodoc
class _$PacingModelCopyWithImpl<$Res> implements $PacingModelCopyWith<$Res> {
  _$PacingModelCopyWithImpl(this._value, this._then);

  final PacingModel _value;
  // ignore: unused_field
  final $Res Function(PacingModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
    Object? improvisations = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedDate: modifiedDate == freezed
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      improvisations: improvisations == freezed
          ? _value.improvisations
          : improvisations // ignore: cast_nullable_to_non_nullable
              as List<ImprovisationModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_PacingModelCopyWith<$Res>
    implements $PacingModelCopyWith<$Res> {
  factory _$$_PacingModelCopyWith(
          _$_PacingModel value, $Res Function(_$_PacingModel) then) =
      __$$_PacingModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String name,
      DateTime? createdDate,
      DateTime? modifiedDate,
      List<ImprovisationModel> improvisations});
}

/// @nodoc
class __$$_PacingModelCopyWithImpl<$Res> extends _$PacingModelCopyWithImpl<$Res>
    implements _$$_PacingModelCopyWith<$Res> {
  __$$_PacingModelCopyWithImpl(
      _$_PacingModel _value, $Res Function(_$_PacingModel) _then)
      : super(_value, (v) => _then(v as _$_PacingModel));

  @override
  _$_PacingModel get _value => super._value as _$_PacingModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
    Object? improvisations = freezed,
  }) {
    return _then(_$_PacingModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedDate: modifiedDate == freezed
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      improvisations: improvisations == freezed
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
  final List<ImprovisationModel> _improvisations;
  @override
  List<ImprovisationModel> get improvisations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_improvisations);
  }

  @override
  String toString() {
    return 'PacingModel(id: $id, name: $name, createdDate: $createdDate, modifiedDate: $modifiedDate, improvisations: $improvisations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PacingModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate) &&
            const DeepCollectionEquality()
                .equals(other.modifiedDate, modifiedDate) &&
            const DeepCollectionEquality()
                .equals(other._improvisations, _improvisations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(createdDate),
      const DeepCollectionEquality().hash(modifiedDate),
      const DeepCollectionEquality().hash(_improvisations));

  @JsonKey(ignore: true)
  @override
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
  List<ImprovisationModel> get improvisations;
  @override
  @JsonKey(ignore: true)
  _$$_PacingModelCopyWith<_$_PacingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
