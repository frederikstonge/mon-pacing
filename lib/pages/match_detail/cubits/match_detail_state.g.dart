// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_detail_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchDetailStateImpl _$$MatchDetailStateImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchDetailStateImpl(
      initialized: json['initialized'] as bool,
      editMode: json['editMode'] as bool,
      match: MatchModel.fromJson(json['match'] as Map<String, dynamic>),
      allTags:
          (json['allTags'] as List<dynamic>).map((e) => e as String).toList(),
      selectedTeamIndex: (json['selectedTeamIndex'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$MatchDetailStateImplToJson(
        _$MatchDetailStateImpl instance) =>
    <String, dynamic>{
      'initialized': instance.initialized,
      'editMode': instance.editMode,
      'match': instance.match,
      'allTags': instance.allTags,
      'selectedTeamIndex': instance.selectedTeamIndex,
    };
