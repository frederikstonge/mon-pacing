// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'match_improvisation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatchImprovisationModel _$MatchImprovisationModelFromJson(
    Map<String, dynamic> json) {
  return _MatchImprovisationModel.fromJson(json);
}

/// @nodoc
mixin _$MatchImprovisationModel {
  int get order => throw _privateConstructorUsedError;
  ImprovisationType get type => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  int? get performers => throw _privateConstructorUsedError;
  int? get wonByTeam => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchImprovisationModelCopyWith<MatchImprovisationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchImprovisationModelCopyWith<$Res> {
  factory $MatchImprovisationModelCopyWith(MatchImprovisationModel value,
          $Res Function(MatchImprovisationModel) then) =
      _$MatchImprovisationModelCopyWithImpl<$Res>;
  $Res call(
      {int order,
      ImprovisationType type,
      String category,
      String theme,
      Duration duration,
      int? performers,
      int? wonByTeam});
}

/// @nodoc
class _$MatchImprovisationModelCopyWithImpl<$Res>
    implements $MatchImprovisationModelCopyWith<$Res> {
  _$MatchImprovisationModelCopyWithImpl(this._value, this._then);

  final MatchImprovisationModel _value;
  // ignore: unused_field
  final $Res Function(MatchImprovisationModel) _then;

  @override
  $Res call({
    Object? order = freezed,
    Object? type = freezed,
    Object? category = freezed,
    Object? theme = freezed,
    Object? duration = freezed,
    Object? performers = freezed,
    Object? wonByTeam = freezed,
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
              as String,
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      performers: performers == freezed
          ? _value.performers
          : performers // ignore: cast_nullable_to_non_nullable
              as int?,
      wonByTeam: wonByTeam == freezed
          ? _value.wonByTeam
          : wonByTeam // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_MatchImprovisationModelCopyWith<$Res>
    implements $MatchImprovisationModelCopyWith<$Res> {
  factory _$$_MatchImprovisationModelCopyWith(_$_MatchImprovisationModel value,
          $Res Function(_$_MatchImprovisationModel) then) =
      __$$_MatchImprovisationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int order,
      ImprovisationType type,
      String category,
      String theme,
      Duration duration,
      int? performers,
      int? wonByTeam});
}

/// @nodoc
class __$$_MatchImprovisationModelCopyWithImpl<$Res>
    extends _$MatchImprovisationModelCopyWithImpl<$Res>
    implements _$$_MatchImprovisationModelCopyWith<$Res> {
  __$$_MatchImprovisationModelCopyWithImpl(_$_MatchImprovisationModel _value,
      $Res Function(_$_MatchImprovisationModel) _then)
      : super(_value, (v) => _then(v as _$_MatchImprovisationModel));

  @override
  _$_MatchImprovisationModel get _value =>
      super._value as _$_MatchImprovisationModel;

  @override
  $Res call({
    Object? order = freezed,
    Object? type = freezed,
    Object? category = freezed,
    Object? theme = freezed,
    Object? duration = freezed,
    Object? performers = freezed,
    Object? wonByTeam = freezed,
  }) {
    return _then(_$_MatchImprovisationModel(
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
              as String,
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      performers: performers == freezed
          ? _value.performers
          : performers // ignore: cast_nullable_to_non_nullable
              as int?,
      wonByTeam: wonByTeam == freezed
          ? _value.wonByTeam
          : wonByTeam // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MatchImprovisationModel implements _MatchImprovisationModel {
  const _$_MatchImprovisationModel(
      {required this.order,
      required this.type,
      required this.category,
      required this.theme,
      required this.duration,
      required this.performers,
      required this.wonByTeam});

  factory _$_MatchImprovisationModel.fromJson(Map<String, dynamic> json) =>
      _$$_MatchImprovisationModelFromJson(json);

  @override
  final int order;
  @override
  final ImprovisationType type;
  @override
  final String category;
  @override
  final String theme;
  @override
  final Duration duration;
  @override
  final int? performers;
  @override
  final int? wonByTeam;

  @override
  String toString() {
    return 'MatchImprovisationModel(order: $order, type: $type, category: $category, theme: $theme, duration: $duration, performers: $performers, wonByTeam: $wonByTeam)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MatchImprovisationModel &&
            const DeepCollectionEquality().equals(other.order, order) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.theme, theme) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality()
                .equals(other.performers, performers) &&
            const DeepCollectionEquality().equals(other.wonByTeam, wonByTeam));
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
      const DeepCollectionEquality().hash(performers),
      const DeepCollectionEquality().hash(wonByTeam));

  @JsonKey(ignore: true)
  @override
  _$$_MatchImprovisationModelCopyWith<_$_MatchImprovisationModel>
      get copyWith =>
          __$$_MatchImprovisationModelCopyWithImpl<_$_MatchImprovisationModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MatchImprovisationModelToJson(
      this,
    );
  }
}

abstract class _MatchImprovisationModel implements MatchImprovisationModel {
  const factory _MatchImprovisationModel(
      {required final int order,
      required final ImprovisationType type,
      required final String category,
      required final String theme,
      required final Duration duration,
      required final int? performers,
      required final int? wonByTeam}) = _$_MatchImprovisationModel;

  factory _MatchImprovisationModel.fromJson(Map<String, dynamic> json) =
      _$_MatchImprovisationModel.fromJson;

  @override
  int get order;
  @override
  ImprovisationType get type;
  @override
  String get category;
  @override
  String get theme;
  @override
  Duration get duration;
  @override
  int? get performers;
  @override
  int? get wonByTeam;
  @override
  @JsonKey(ignore: true)
  _$$_MatchImprovisationModelCopyWith<_$_MatchImprovisationModel>
      get copyWith => throw _privateConstructorUsedError;
}
