// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_suggestion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategorySuggestionModel _$CategorySuggestionModelFromJson(
    Map<String, dynamic> json) {
  return _CategorySuggestionModel.fromJson(json);
}

/// @nodoc
mixin _$CategorySuggestionModel {
  int get id =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @Index(unique: true)
  String get name => throw _privateConstructorUsedError;
  DateTime? get createdDate => throw _privateConstructorUsedError;
  DateTime? get modifiedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategorySuggestionModelCopyWith<CategorySuggestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorySuggestionModelCopyWith<$Res> {
  factory $CategorySuggestionModelCopyWith(CategorySuggestionModel value,
          $Res Function(CategorySuggestionModel) then) =
      _$CategorySuggestionModelCopyWithImpl<$Res, CategorySuggestionModel>;
  @useResult
  $Res call(
      {int id,
      @Index(unique: true) String name,
      DateTime? createdDate,
      DateTime? modifiedDate});
}

/// @nodoc
class _$CategorySuggestionModelCopyWithImpl<$Res,
        $Val extends CategorySuggestionModel>
    implements $CategorySuggestionModelCopyWith<$Res> {
  _$CategorySuggestionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategorySuggestionModelImplCopyWith<$Res>
    implements $CategorySuggestionModelCopyWith<$Res> {
  factory _$$CategorySuggestionModelImplCopyWith(
          _$CategorySuggestionModelImpl value,
          $Res Function(_$CategorySuggestionModelImpl) then) =
      __$$CategorySuggestionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @Index(unique: true) String name,
      DateTime? createdDate,
      DateTime? modifiedDate});
}

/// @nodoc
class __$$CategorySuggestionModelImplCopyWithImpl<$Res>
    extends _$CategorySuggestionModelCopyWithImpl<$Res,
        _$CategorySuggestionModelImpl>
    implements _$$CategorySuggestionModelImplCopyWith<$Res> {
  __$$CategorySuggestionModelImplCopyWithImpl(
      _$CategorySuggestionModelImpl _value,
      $Res Function(_$CategorySuggestionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
  }) {
    return _then(_$CategorySuggestionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategorySuggestionModelImpl implements _CategorySuggestionModel {
  const _$CategorySuggestionModelImpl(
      {required this.id,
      @Index(unique: true) required this.name,
      required this.createdDate,
      required this.modifiedDate});

  factory _$CategorySuggestionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategorySuggestionModelImplFromJson(json);

  @override
  final int id;
// ignore: invalid_annotation_target
  @override
  @Index(unique: true)
  final String name;
  @override
  final DateTime? createdDate;
  @override
  final DateTime? modifiedDate;

  @override
  String toString() {
    return 'CategorySuggestionModel(id: $id, name: $name, createdDate: $createdDate, modifiedDate: $modifiedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorySuggestionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, createdDate, modifiedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorySuggestionModelImplCopyWith<_$CategorySuggestionModelImpl>
      get copyWith => __$$CategorySuggestionModelImplCopyWithImpl<
          _$CategorySuggestionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategorySuggestionModelImplToJson(
      this,
    );
  }
}

abstract class _CategorySuggestionModel
    implements CategorySuggestionModel, BaseModel {
  const factory _CategorySuggestionModel(
      {required final int id,
      @Index(unique: true) required final String name,
      required final DateTime? createdDate,
      required final DateTime? modifiedDate}) = _$CategorySuggestionModelImpl;

  factory _CategorySuggestionModel.fromJson(Map<String, dynamic> json) =
      _$CategorySuggestionModelImpl.fromJson;

  @override
  int get id;
  @override // ignore: invalid_annotation_target
  @Index(unique: true)
  String get name;
  @override
  DateTime? get createdDate;
  @override
  DateTime? get modifiedDate;
  @override
  @JsonKey(ignore: true)
  _$$CategorySuggestionModelImplCopyWith<_$CategorySuggestionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
