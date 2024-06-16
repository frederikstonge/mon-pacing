// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matches_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MatchesSearchState _$MatchesSearchStateFromJson(Map<String, dynamic> json) {
  return _MatchesSearchState.fromJson(json);
}

/// @nodoc
mixin _$MatchesSearchState {
  String get searchQuery => throw _privateConstructorUsedError;
  List<MatchModel> get matches => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  Map<String, int> get tags => throw _privateConstructorUsedError;
  List<String> get selectedTags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchesSearchStateCopyWith<MatchesSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchesSearchStateCopyWith<$Res> {
  factory $MatchesSearchStateCopyWith(
          MatchesSearchState value, $Res Function(MatchesSearchState) then) =
      _$MatchesSearchStateCopyWithImpl<$Res, MatchesSearchState>;
  @useResult
  $Res call(
      {String searchQuery,
      List<MatchModel> matches,
      bool hasMore,
      Map<String, int> tags,
      List<String> selectedTags});
}

/// @nodoc
class _$MatchesSearchStateCopyWithImpl<$Res, $Val extends MatchesSearchState>
    implements $MatchesSearchStateCopyWith<$Res> {
  _$MatchesSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? matches = null,
    Object? hasMore = null,
    Object? tags = null,
    Object? selectedTags = null,
  }) {
    return _then(_value.copyWith(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      matches: null == matches
          ? _value.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as List<MatchModel>,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      selectedTags: null == selectedTags
          ? _value.selectedTags
          : selectedTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchesSearchStateImplCopyWith<$Res>
    implements $MatchesSearchStateCopyWith<$Res> {
  factory _$$MatchesSearchStateImplCopyWith(_$MatchesSearchStateImpl value,
          $Res Function(_$MatchesSearchStateImpl) then) =
      __$$MatchesSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String searchQuery,
      List<MatchModel> matches,
      bool hasMore,
      Map<String, int> tags,
      List<String> selectedTags});
}

/// @nodoc
class __$$MatchesSearchStateImplCopyWithImpl<$Res>
    extends _$MatchesSearchStateCopyWithImpl<$Res, _$MatchesSearchStateImpl>
    implements _$$MatchesSearchStateImplCopyWith<$Res> {
  __$$MatchesSearchStateImplCopyWithImpl(_$MatchesSearchStateImpl _value,
      $Res Function(_$MatchesSearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? matches = null,
    Object? hasMore = null,
    Object? tags = null,
    Object? selectedTags = null,
  }) {
    return _then(_$MatchesSearchStateImpl(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      matches: null == matches
          ? _value._matches
          : matches // ignore: cast_nullable_to_non_nullable
              as List<MatchModel>,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      selectedTags: null == selectedTags
          ? _value._selectedTags
          : selectedTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchesSearchStateImpl implements _MatchesSearchState {
  const _$MatchesSearchStateImpl(
      {required this.searchQuery,
      required final List<MatchModel> matches,
      required this.hasMore,
      required final Map<String, int> tags,
      final List<String> selectedTags = const []})
      : _matches = matches,
        _tags = tags,
        _selectedTags = selectedTags;

  factory _$MatchesSearchStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchesSearchStateImplFromJson(json);

  @override
  final String searchQuery;
  final List<MatchModel> _matches;
  @override
  List<MatchModel> get matches {
    if (_matches is EqualUnmodifiableListView) return _matches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matches);
  }

  @override
  final bool hasMore;
  final Map<String, int> _tags;
  @override
  Map<String, int> get tags {
    if (_tags is EqualUnmodifiableMapView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tags);
  }

  final List<String> _selectedTags;
  @override
  @JsonKey()
  List<String> get selectedTags {
    if (_selectedTags is EqualUnmodifiableListView) return _selectedTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedTags);
  }

  @override
  String toString() {
    return 'MatchesSearchState(searchQuery: $searchQuery, matches: $matches, hasMore: $hasMore, tags: $tags, selectedTags: $selectedTags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchesSearchStateImpl &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            const DeepCollectionEquality().equals(other._matches, _matches) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._selectedTags, _selectedTags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      searchQuery,
      const DeepCollectionEquality().hash(_matches),
      hasMore,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_selectedTags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchesSearchStateImplCopyWith<_$MatchesSearchStateImpl> get copyWith =>
      __$$MatchesSearchStateImplCopyWithImpl<_$MatchesSearchStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchesSearchStateImplToJson(
      this,
    );
  }
}

abstract class _MatchesSearchState implements MatchesSearchState {
  const factory _MatchesSearchState(
      {required final String searchQuery,
      required final List<MatchModel> matches,
      required final bool hasMore,
      required final Map<String, int> tags,
      final List<String> selectedTags}) = _$MatchesSearchStateImpl;

  factory _MatchesSearchState.fromJson(Map<String, dynamic> json) =
      _$MatchesSearchStateImpl.fromJson;

  @override
  String get searchQuery;
  @override
  List<MatchModel> get matches;
  @override
  bool get hasMore;
  @override
  Map<String, int> get tags;
  @override
  List<String> get selectedTags;
  @override
  @JsonKey(ignore: true)
  _$$MatchesSearchStateImplCopyWith<_$MatchesSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
