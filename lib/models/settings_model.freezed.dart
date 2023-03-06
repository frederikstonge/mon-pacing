// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingsModel _$SettingsModelFromJson(Map<String, dynamic> json) {
  return _SettingsModel.fromJson(json);
}

/// @nodoc
mixin _$SettingsModel {
  int get color => throw _privateConstructorUsedError;
  bool get enableDefaultPaddingDuration => throw _privateConstructorUsedError;
  Duration get defaultPaddingDuration => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsModelCopyWith<SettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsModelCopyWith<$Res> {
  factory $SettingsModelCopyWith(
          SettingsModel value, $Res Function(SettingsModel) then) =
      _$SettingsModelCopyWithImpl<$Res, SettingsModel>;
  @useResult
  $Res call(
      {int color,
      bool enableDefaultPaddingDuration,
      Duration defaultPaddingDuration,
      String language});
}

/// @nodoc
class _$SettingsModelCopyWithImpl<$Res, $Val extends SettingsModel>
    implements $SettingsModelCopyWith<$Res> {
  _$SettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? enableDefaultPaddingDuration = null,
    Object? defaultPaddingDuration = null,
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      enableDefaultPaddingDuration: null == enableDefaultPaddingDuration
          ? _value.enableDefaultPaddingDuration
          : enableDefaultPaddingDuration // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultPaddingDuration: null == defaultPaddingDuration
          ? _value.defaultPaddingDuration
          : defaultPaddingDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingsModelCopyWith<$Res>
    implements $SettingsModelCopyWith<$Res> {
  factory _$$_SettingsModelCopyWith(
          _$_SettingsModel value, $Res Function(_$_SettingsModel) then) =
      __$$_SettingsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int color,
      bool enableDefaultPaddingDuration,
      Duration defaultPaddingDuration,
      String language});
}

/// @nodoc
class __$$_SettingsModelCopyWithImpl<$Res>
    extends _$SettingsModelCopyWithImpl<$Res, _$_SettingsModel>
    implements _$$_SettingsModelCopyWith<$Res> {
  __$$_SettingsModelCopyWithImpl(
      _$_SettingsModel _value, $Res Function(_$_SettingsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? enableDefaultPaddingDuration = null,
    Object? defaultPaddingDuration = null,
    Object? language = null,
  }) {
    return _then(_$_SettingsModel(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      enableDefaultPaddingDuration: null == enableDefaultPaddingDuration
          ? _value.enableDefaultPaddingDuration
          : enableDefaultPaddingDuration // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultPaddingDuration: null == defaultPaddingDuration
          ? _value.defaultPaddingDuration
          : defaultPaddingDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SettingsModel implements _SettingsModel {
  const _$_SettingsModel(
      {required this.color,
      required this.enableDefaultPaddingDuration,
      required this.defaultPaddingDuration,
      required this.language});

  factory _$_SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$$_SettingsModelFromJson(json);

  @override
  final int color;
  @override
  final bool enableDefaultPaddingDuration;
  @override
  final Duration defaultPaddingDuration;
  @override
  final String language;

  @override
  String toString() {
    return 'SettingsModel(color: $color, enableDefaultPaddingDuration: $enableDefaultPaddingDuration, defaultPaddingDuration: $defaultPaddingDuration, language: $language)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsModel &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.enableDefaultPaddingDuration,
                    enableDefaultPaddingDuration) ||
                other.enableDefaultPaddingDuration ==
                    enableDefaultPaddingDuration) &&
            (identical(other.defaultPaddingDuration, defaultPaddingDuration) ||
                other.defaultPaddingDuration == defaultPaddingDuration) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, color,
      enableDefaultPaddingDuration, defaultPaddingDuration, language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsModelCopyWith<_$_SettingsModel> get copyWith =>
      __$$_SettingsModelCopyWithImpl<_$_SettingsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingsModelToJson(
      this,
    );
  }
}

abstract class _SettingsModel implements SettingsModel {
  const factory _SettingsModel(
      {required final int color,
      required final bool enableDefaultPaddingDuration,
      required final Duration defaultPaddingDuration,
      required final String language}) = _$_SettingsModel;

  factory _SettingsModel.fromJson(Map<String, dynamic> json) =
      _$_SettingsModel.fromJson;

  @override
  int get color;
  @override
  bool get enableDefaultPaddingDuration;
  @override
  Duration get defaultPaddingDuration;
  @override
  String get language;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsModelCopyWith<_$_SettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
