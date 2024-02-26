// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimerEventModel _$TimerEventModelFromJson(Map<String, dynamic> json) {
  return _TimerEventModel.fromJson(json);
}

/// @nodoc
mixin _$TimerEventModel {
  String get eventName => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimerEventModelCopyWith<TimerEventModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerEventModelCopyWith<$Res> {
  factory $TimerEventModelCopyWith(
          TimerEventModel value, $Res Function(TimerEventModel) then) =
      _$TimerEventModelCopyWithImpl<$Res, TimerEventModel>;
  @useResult
  $Res call({String eventName, String? data});
}

/// @nodoc
class _$TimerEventModelCopyWithImpl<$Res, $Val extends TimerEventModel>
    implements $TimerEventModelCopyWith<$Res> {
  _$TimerEventModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventName = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      eventName: null == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimerEventModelImplCopyWith<$Res>
    implements $TimerEventModelCopyWith<$Res> {
  factory _$$TimerEventModelImplCopyWith(_$TimerEventModelImpl value,
          $Res Function(_$TimerEventModelImpl) then) =
      __$$TimerEventModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventName, String? data});
}

/// @nodoc
class __$$TimerEventModelImplCopyWithImpl<$Res>
    extends _$TimerEventModelCopyWithImpl<$Res, _$TimerEventModelImpl>
    implements _$$TimerEventModelImplCopyWith<$Res> {
  __$$TimerEventModelImplCopyWithImpl(
      _$TimerEventModelImpl _value, $Res Function(_$TimerEventModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventName = null,
    Object? data = freezed,
  }) {
    return _then(_$TimerEventModelImpl(
      eventName: null == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimerEventModelImpl implements _TimerEventModel {
  const _$TimerEventModelImpl({required this.eventName, this.data});

  factory _$TimerEventModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimerEventModelImplFromJson(json);

  @override
  final String eventName;
  @override
  final String? data;

  @override
  String toString() {
    return 'TimerEventModel(eventName: $eventName, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerEventModelImpl &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventName, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerEventModelImplCopyWith<_$TimerEventModelImpl> get copyWith =>
      __$$TimerEventModelImplCopyWithImpl<_$TimerEventModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimerEventModelImplToJson(
      this,
    );
  }
}

abstract class _TimerEventModel implements TimerEventModel {
  const factory _TimerEventModel(
      {required final String eventName,
      final String? data}) = _$TimerEventModelImpl;

  factory _TimerEventModel.fromJson(Map<String, dynamic> json) =
      _$TimerEventModelImpl.fromJson;

  @override
  String get eventName;
  @override
  String? get data;
  @override
  @JsonKey(ignore: true)
  _$$TimerEventModelImplCopyWith<_$TimerEventModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
