// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_search_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchesSearchStateImpl _$$MatchesSearchStateImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchesSearchStateImpl(
      searchQuery: json['searchQuery'] as String,
      matches: (json['matches'] as List<dynamic>)
          .map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['hasMore'] as bool,
    );

Map<String, dynamic> _$$MatchesSearchStateImplToJson(
        _$MatchesSearchStateImpl instance) =>
    <String, dynamic>{
      'searchQuery': instance.searchQuery,
      'matches': instance.matches,
      'hasMore': instance.hasMore,
    };
