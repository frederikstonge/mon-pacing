// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_improvisation_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchImprovisationStateImpl _$$MatchImprovisationStateImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchImprovisationStateImpl(
      improvisation: ImprovisationModel.fromJson(
          json['improvisation'] as Map<String, dynamic>),
      editMode: json['editMode'] as bool,
      index: (json['index'] as num).toInt(),
    );

Map<String, dynamic> _$$MatchImprovisationStateImplToJson(
        _$MatchImprovisationStateImpl instance) =>
    <String, dynamic>{
      'improvisation': instance.improvisation,
      'editMode': instance.editMode,
      'index': instance.index,
    };
