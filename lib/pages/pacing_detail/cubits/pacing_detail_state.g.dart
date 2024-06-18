// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pacing_detail_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PacingDetailStateImpl _$$PacingDetailStateImplFromJson(
        Map<String, dynamic> json) =>
    _$PacingDetailStateImpl(
      initialized: json['initialized'] as bool,
      editMode: json['editMode'] as bool,
      pacing: PacingModel.fromJson(json['pacing'] as Map<String, dynamic>),
      allTags:
          (json['allTags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$PacingDetailStateImplToJson(
        _$PacingDetailStateImpl instance) =>
    <String, dynamic>{
      'initialized': instance.initialized,
      'editMode': instance.editMode,
      'pacing': instance.pacing,
      'allTags': instance.allTags,
    };
