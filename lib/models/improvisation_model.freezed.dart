// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'improvisation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImprovisationModel _$ImprovisationModelFromJson(Map<String, dynamic> json) {
  return _ImprovisationModel.fromJson(json);
}

/// @nodoc
mixin _$ImprovisationModel {
  int get order => throw _privateConstructorUsedError;
  ImprovisationType get type => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get theme => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  int? get performers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImprovisationModelCopyWith<ImprovisationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImprovisationModelCopyWith<$Res> {
  factory $ImprovisationModelCopyWith(
          ImprovisationModel value, $Res Function(ImprovisationModel) then) =
      _$ImprovisationModelCopyWithImpl<$Res>;
  $Res call(
      {int order,
      ImprovisationType type,
      String? category,
      String? theme,
      Duration duration,
      int? performers});
}

/// @nodoc
class _$ImprovisationModelCopyWithImpl<$Res>
    implements $ImprovisationModelCopyWith<$Res> {
  _$ImprovisationModelCopyWithImpl(this._value, this._then);

  final ImprovisationModel _value;
  // ignore: unused_field
  final $Res Function(ImprovisationModel) _then;

  @override
  $Res call({
    Object? order = freezed,
    Object? type = freezed,
    Object? category = freezed,
    Object? theme = freezed,
    Object? duration = freezed,
    Object? performers = freezed,
  }) {
    return _then(_value.copyWith(
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ImprovisationType,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      performers: performers == freezed
          ? _value.performers
          : performers // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_ImprovisationModelCopyWith<$Res>
    implements $ImprovisationModelCopyWith<$Res> {
  factory _$$_ImprovisationModelCopyWith(_$_ImprovisationModel value,
          $Res Function(_$_ImprovisationModel) then) =
      __$$_ImprovisationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int order,
      ImprovisationType type,
      String? category,
      String? theme,
      Duration duration,
      int? performers});
}

/// @nodoc
class __$$_ImprovisationModelCopyWithImpl<$Res>
    extends _$ImprovisationModelCopyWithImpl<$Res>
    implements _$$_ImprovisationModelCopyWith<$Res> {
  __$$_ImprovisationModelCopyWithImpl(
      _$_ImprovisationModel _value, $Res Function(_$_ImprovisationModel) _then)
      : super(_value, (v) => _then(v as _$_ImprovisationModel));

  @override
  _$_ImprovisationModel get _value => super._value as _$_ImprovisationModel;

  @override
  $Res call({
    Object? order = freezed,
    Object? type = freezed,
    Object? category = freezed,
    Object? theme = freezed,
    Object? duration = freezed,
    Object? performers = freezed,
  }) {
    return _then(_$_ImprovisationModel(
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ImprovisationType,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      performers: performers == freezed
          ? _value.performers
          : performers // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImprovisationModel implements _ImprovisationModel {
  const _$_ImprovisationModel(
      {required this.order,
      required this.type,
      required this.category,
      required this.theme,
      required this.duration,
      required this.performers});

  factory _$_ImprovisationModel.fromJson(Map<String, dynamic> json) =>
      _$$_ImprovisationModelFromJson(json);

  @override
  final int order;
  @override
  final ImprovisationType type;
  @override
  final String? category;
  @override
  final String? theme;
  @override
  final Duration duration;
  @override
  final int? performers;

  @override
  String toString() {
    return 'ImprovisationModel(order: $order, type: $type, category: $category, theme: $theme, duration: $duration, performers: $performers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImprovisationModel &&
            const DeepCollectionEquality().equals(other.order, order) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.theme, theme) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality()
                .equals(other.performers, performers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(order),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(theme),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(performers));

  @JsonKey(ignore: true)
  @override
  _$$_ImprovisationModelCopyWith<_$_ImprovisationModel> get copyWith =>
      __$$_ImprovisationModelCopyWithImpl<_$_ImprovisationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImprovisationModelToJson(
      this,
    );
  }
}

abstract class _ImprovisationModel implements ImprovisationModel {
  const factory _ImprovisationModel(
      {required final int order,
      required final ImprovisationType type,
      required final String? category,
      required final String? theme,
      required final Duration duration,
      required final int? performers}) = _$_ImprovisationModel;

  factory _ImprovisationModel.fromJson(Map<String, dynamic> json) =
      _$_ImprovisationModel.fromJson;

  @override
  int get order;
  @override
  ImprovisationType get type;
  @override
  String? get category;
  @override
  String? get theme;
  @override
  Duration get duration;
  @override
  int? get performers;
  @override
  @JsonKey(ignore: true)
  _$$_ImprovisationModelCopyWith<_$_ImprovisationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
