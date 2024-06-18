// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pacings_search_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PacingsSearchStateImpl _$$PacingsSearchStateImplFromJson(
        Map<String, dynamic> json) =>
    _$PacingsSearchStateImpl(
      searchQuery: json['searchQuery'] as String,
      pacings: (json['pacings'] as List<dynamic>)
          .map((e) => PacingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['hasMore'] as bool,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      selectedTags: (json['selectedTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PacingsSearchStateImplToJson(
        _$PacingsSearchStateImpl instance) =>
    <String, dynamic>{
      'searchQuery': instance.searchQuery,
      'pacings': instance.pacings,
      'hasMore': instance.hasMore,
      'tags': instance.tags,
      'selectedTags': instance.selectedTags,
    };
