// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pacings_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PacingsSearchState _$PacingsSearchStateFromJson(Map<String, dynamic> json) {
  return _PacingsSearchState.fromJson(json);
}

/// @nodoc
mixin _$PacingsSearchState {
  String get searchQuery => throw _privateConstructorUsedError;
  List<PacingModel> get pacings => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PacingsSearchStateCopyWith<PacingsSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PacingsSearchStateCopyWith<$Res> {
  factory $PacingsSearchStateCopyWith(
          PacingsSearchState value, $Res Function(PacingsSearchState) then) =
      _$PacingsSearchStateCopyWithImpl<$Res, PacingsSearchState>;
  @useResult
  $Res call({String searchQuery, List<PacingModel> pacings, bool hasMore});
}

/// @nodoc
class _$PacingsSearchStateCopyWithImpl<$Res, $Val extends PacingsSearchState>
    implements $PacingsSearchStateCopyWith<$Res> {
  _$PacingsSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? pacings = null,
    Object? hasMore = null,
  }) {
    return _then(_value.copyWith(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      pacings: null == pacings
          ? _value.pacings
          : pacings // ignore: cast_nullable_to_non_nullable
              as List<PacingModel>,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PacingsSearchStateImplCopyWith<$Res>
    implements $PacingsSearchStateCopyWith<$Res> {
  factory _$$PacingsSearchStateImplCopyWith(_$PacingsSearchStateImpl value,
          $Res Function(_$PacingsSearchStateImpl) then) =
      __$$PacingsSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String searchQuery, List<PacingModel> pacings, bool hasMore});
}

/// @nodoc
class __$$PacingsSearchStateImplCopyWithImpl<$Res>
    extends _$PacingsSearchStateCopyWithImpl<$Res, _$PacingsSearchStateImpl>
    implements _$$PacingsSearchStateImplCopyWith<$Res> {
  __$$PacingsSearchStateImplCopyWithImpl(_$PacingsSearchStateImpl _value,
      $Res Function(_$PacingsSearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? pacings = null,
    Object? hasMore = null,
  }) {
    return _then(_$PacingsSearchStateImpl(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      pacings: null == pacings
          ? _value._pacings
          : pacings // ignore: cast_nullable_to_non_nullable
              as List<PacingModel>,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PacingsSearchStateImpl implements _PacingsSearchState {
  const _$PacingsSearchStateImpl(
      {required this.searchQuery,
      required final List<PacingModel> pacings,
      required this.hasMore})
      : _pacings = pacings;

  factory _$PacingsSearchStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PacingsSearchStateImplFromJson(json);

  @override
  final String searchQuery;
  final List<PacingModel> _pacings;
  @override
  List<PacingModel> get pacings {
    if (_pacings is EqualUnmodifiableListView) return _pacings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pacings);
  }

  @override
  final bool hasMore;

  @override
  String toString() {
    return 'PacingsSearchState(searchQuery: $searchQuery, pacings: $pacings, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PacingsSearchStateImpl &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            const DeepCollectionEquality().equals(other._pacings, _pacings) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, searchQuery,
      const DeepCollectionEquality().hash(_pacings), hasMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PacingsSearchStateImplCopyWith<_$PacingsSearchStateImpl> get copyWith =>
      __$$PacingsSearchStateImplCopyWithImpl<_$PacingsSearchStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PacingsSearchStateImplToJson(
      this,
    );
  }
}

abstract class _PacingsSearchState implements PacingsSearchState {
  const factory _PacingsSearchState(
      {required final String searchQuery,
      required final List<PacingModel> pacings,
      required final bool hasMore}) = _$PacingsSearchStateImpl;

  factory _PacingsSearchState.fromJson(Map<String, dynamic> json) =
      _$PacingsSearchStateImpl.fromJson;

  @override
  String get searchQuery;
  @override
  List<PacingModel> get pacings;
  @override
  bool get hasMore;
  @override
  @JsonKey(ignore: true)
  _$$PacingsSearchStateImplCopyWith<_$PacingsSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
