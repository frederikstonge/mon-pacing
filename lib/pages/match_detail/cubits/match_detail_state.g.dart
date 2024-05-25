// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_detail_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchDetailStateImpl _$$MatchDetailStateImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchDetailStateImpl(
      editMode: json['editMode'] as bool,
      match: MatchModel.fromJson(json['match'] as Map<String, dynamic>),
      selectedTeamIndex: (json['selectedTeamIndex'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$MatchDetailStateImplToJson(
        _$MatchDetailStateImpl instance) =>
    <String, dynamic>{
      'editMode': instance.editMode,
      'match': instance.match,
      'selectedTeamIndex': instance.selectedTeamIndex,
    };
