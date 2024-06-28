// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_penalty_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchPenaltyStateImpl _$$MatchPenaltyStateImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchPenaltyStateImpl(
      editMode: json['editMode'] as bool,
      teams: (json['teams'] as List<dynamic>)
          .map((e) => MatchTeamModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      penalty: PenaltyModel.fromJson(json['penalty'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MatchPenaltyStateImplToJson(
        _$MatchPenaltyStateImpl instance) =>
    <String, dynamic>{
      'editMode': instance.editMode,
      'teams': instance.teams,
      'penalty': instance.penalty,
    };
