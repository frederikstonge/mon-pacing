// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_detail_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeamDetailStateImpl _$$TeamDetailStateImplFromJson(
        Map<String, dynamic> json) =>
    _$TeamDetailStateImpl(
      editMode: json['editMode'] as bool,
      team: TeamModel.fromJson(json['team'] as Map<String, dynamic>),
      selectedTeamIndex: (json['selectedTeamIndex'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$TeamDetailStateImplToJson(
        _$TeamDetailStateImpl instance) =>
    <String, dynamic>{
      'editMode': instance.editMode,
      'team': instance.team,
      'selectedTeamIndex': instance.selectedTeamIndex,
    };
