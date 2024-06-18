// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TagFilter _$TagFilterFromJson(Map<String, dynamic> json) {
  return _TagFilter.fromJson(json);
}

/// @nodoc
mixin _$TagFilter {
  String get tag => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagFilterCopyWith<TagFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagFilterCopyWith<$Res> {
  factory $TagFilterCopyWith(TagFilter value, $Res Function(TagFilter) then) =
      _$TagFilterCopyWithImpl<$Res, TagFilter>;
  @useResult
  $Res call({String tag, int count});
}

/// @nodoc
class _$TagFilterCopyWithImpl<$Res, $Val extends TagFilter>
    implements $TagFilterCopyWith<$Res> {
  _$TagFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagFilterImplCopyWith<$Res>
    implements $TagFilterCopyWith<$Res> {
  factory _$$TagFilterImplCopyWith(
          _$TagFilterImpl value, $Res Function(_$TagFilterImpl) then) =
      __$$TagFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String tag, int count});
}

/// @nodoc
class __$$TagFilterImplCopyWithImpl<$Res>
    extends _$TagFilterCopyWithImpl<$Res, _$TagFilterImpl>
    implements _$$TagFilterImplCopyWith<$Res> {
  __$$TagFilterImplCopyWithImpl(
      _$TagFilterImpl _value, $Res Function(_$TagFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
    Object? count = null,
  }) {
    return _then(_$TagFilterImpl(
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TagFilterImpl implements _TagFilter {
  const _$TagFilterImpl({required this.tag, required this.count});

  factory _$TagFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$TagFilterImplFromJson(json);

  @override
  final String tag;
  @override
  final int count;

  @override
  String toString() {
    return 'TagFilter(tag: $tag, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagFilterImpl &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tag, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TagFilterImplCopyWith<_$TagFilterImpl> get copyWith =>
      __$$TagFilterImplCopyWithImpl<_$TagFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TagFilterImplToJson(
      this,
    );
  }
}

abstract class _TagFilter implements TagFilter {
  const factory _TagFilter(
      {required final String tag, required final int count}) = _$TagFilterImpl;

  factory _TagFilter.fromJson(Map<String, dynamic> json) =
      _$TagFilterImpl.fromJson;

  @override
  String get tag;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$TagFilterImplCopyWith<_$TagFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
