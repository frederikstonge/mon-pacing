// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  bool get enablePaddingDuration => throw _privateConstructorUsedError;
  Duration get paddingDuration => throw _privateConstructorUsedError;
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
      _$SettingsModelCopyWithImpl<$Res>;
  $Res call(
      {int color,
      bool enablePaddingDuration,
      Duration paddingDuration,
      String language});
}

/// @nodoc
class _$SettingsModelCopyWithImpl<$Res>
    implements $SettingsModelCopyWith<$Res> {
  _$SettingsModelCopyWithImpl(this._value, this._then);

  final SettingsModel _value;
  // ignore: unused_field
  final $Res Function(SettingsModel) _then;

  @override
  $Res call({
    Object? color = freezed,
    Object? enablePaddingDuration = freezed,
    Object? paddingDuration = freezed,
    Object? language = freezed,
  }) {
    return _then(_value.copyWith(
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      enablePaddingDuration: enablePaddingDuration == freezed
          ? _value.enablePaddingDuration
          : enablePaddingDuration // ignore: cast_nullable_to_non_nullable
              as bool,
      paddingDuration: paddingDuration == freezed
          ? _value.paddingDuration
          : paddingDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_SettingsModelCopyWith<$Res>
    implements $SettingsModelCopyWith<$Res> {
  factory _$$_SettingsModelCopyWith(
          _$_SettingsModel value, $Res Function(_$_SettingsModel) then) =
      __$$_SettingsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int color,
      bool enablePaddingDuration,
      Duration paddingDuration,
      String language});
}

/// @nodoc
class __$$_SettingsModelCopyWithImpl<$Res>
    extends _$SettingsModelCopyWithImpl<$Res>
    implements _$$_SettingsModelCopyWith<$Res> {
  __$$_SettingsModelCopyWithImpl(
      _$_SettingsModel _value, $Res Function(_$_SettingsModel) _then)
      : super(_value, (v) => _then(v as _$_SettingsModel));

  @override
  _$_SettingsModel get _value => super._value as _$_SettingsModel;

  @override
  $Res call({
    Object? color = freezed,
    Object? enablePaddingDuration = freezed,
    Object? paddingDuration = freezed,
    Object? language = freezed,
  }) {
    return _then(_$_SettingsModel(
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      enablePaddingDuration: enablePaddingDuration == freezed
          ? _value.enablePaddingDuration
          : enablePaddingDuration // ignore: cast_nullable_to_non_nullable
              as bool,
      paddingDuration: paddingDuration == freezed
          ? _value.paddingDuration
          : paddingDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      language: language == freezed
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
      required this.enablePaddingDuration,
      required this.paddingDuration,
      required this.language});

  factory _$_SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$$_SettingsModelFromJson(json);

  @override
  final int color;
  @override
  final bool enablePaddingDuration;
  @override
  final Duration paddingDuration;
  @override
  final String language;

  @override
  String toString() {
    return 'SettingsModel(color: $color, enablePaddingDuration: $enablePaddingDuration, paddingDuration: $paddingDuration, language: $language)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsModel &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality()
                .equals(other.enablePaddingDuration, enablePaddingDuration) &&
            const DeepCollectionEquality()
                .equals(other.paddingDuration, paddingDuration) &&
            const DeepCollectionEquality().equals(other.language, language));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(enablePaddingDuration),
      const DeepCollectionEquality().hash(paddingDuration),
      const DeepCollectionEquality().hash(language));

  @JsonKey(ignore: true)
  @override
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
      required final bool enablePaddingDuration,
      required final Duration paddingDuration,
      required final String language}) = _$_SettingsModel;

  factory _SettingsModel.fromJson(Map<String, dynamic> json) =
      _$_SettingsModel.fromJson;

  @override
  int get color;
  @override
  bool get enablePaddingDuration;
  @override
  Duration get paddingDuration;
  @override
  String get language;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsModelCopyWith<_$_SettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
