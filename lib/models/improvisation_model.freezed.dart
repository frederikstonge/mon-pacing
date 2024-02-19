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
  int get order => throw _privateConstructorUsedError;
  ImprovisationType get type => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;
  List<double> get durations => throw _privateConstructorUsedError;
  int? get performers => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      int order,
      ImprovisationType type,
      String category,
      String theme,
      List<double> durations,
      int? performers,
      String? notes});
}

/// @nodoc
class _$ImprovisationModelCopyWithImpl<$Res, $Val extends ImprovisationModel>
    implements $ImprovisationModelCopyWith<$Res> {
  _$ImprovisationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? order = null,
    Object? type = null,
    Object? category = null,
    Object? theme = null,
    Object? durations = null,
    Object? performers = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
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
      durations: null == durations
          ? _value.durations
          : durations // ignore: cast_nullable_to_non_nullable
              as List<double>,
      performers: freezed == performers
          ? _value.performers
          : performers // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
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
      int order,
      ImprovisationType type,
      String category,
      String theme,
      List<double> durations,
      int? performers,
      String? notes});
}

/// @nodoc
class __$$ImprovisationModelImplCopyWithImpl<$Res>
    extends _$ImprovisationModelCopyWithImpl<$Res, _$ImprovisationModelImpl>
    implements _$$ImprovisationModelImplCopyWith<$Res> {
  __$$ImprovisationModelImplCopyWithImpl(_$ImprovisationModelImpl _value,
      $Res Function(_$ImprovisationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? order = null,
    Object? type = null,
    Object? category = null,
    Object? theme = null,
    Object? durations = null,
    Object? performers = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$ImprovisationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
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
      durations: null == durations
          ? _value._durations
          : durations // ignore: cast_nullable_to_non_nullable
              as List<double>,
      performers: freezed == performers
          ? _value.performers
          : performers // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImprovisationModelImpl implements _ImprovisationModel {
  const _$ImprovisationModelImpl(
      {required this.id,
      required this.order,
      required this.type,
      required this.category,
      required this.theme,
      required final List<double> durations,
      required this.performers,
      this.notes})
      : _durations = durations;

  factory _$ImprovisationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImprovisationModelImplFromJson(json);

  @override
  final int id;
  @override
  final int order;
  @override
  final ImprovisationType type;
  @override
  final String category;
  @override
  final String theme;
  final List<double> _durations;
  @override
  List<double> get durations {
    if (_durations is EqualUnmodifiableListView) return _durations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_durations);
  }

  @override
  final int? performers;
  @override
  final String? notes;

  @override
  String toString() {
    return 'ImprovisationModel(id: $id, order: $order, type: $type, category: $category, theme: $theme, durations: $durations, performers: $performers, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImprovisationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            const DeepCollectionEquality()
                .equals(other._durations, _durations) &&
            (identical(other.performers, performers) ||
                other.performers == performers) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, order, type, category, theme,
      const DeepCollectionEquality().hash(_durations), performers, notes);

  @JsonKey(ignore: true)
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
      required final int order,
      required final ImprovisationType type,
      required final String category,
      required final String theme,
      required final List<double> durations,
      required final int? performers,
      final String? notes}) = _$ImprovisationModelImpl;

  factory _ImprovisationModel.fromJson(Map<String, dynamic> json) =
      _$ImprovisationModelImpl.fromJson;

  @override
  int get id;
  @override
  int get order;
  @override
  ImprovisationType get type;
  @override
  String get category;
  @override
  String get theme;
  @override
  List<double> get durations;
  @override
  int? get performers;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$ImprovisationModelImplCopyWith<_$ImprovisationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
