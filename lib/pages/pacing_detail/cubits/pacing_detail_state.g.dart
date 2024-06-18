// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pacing_detail_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PacingDetailStateImpl _$$PacingDetailStateImplFromJson(
        Map<String, dynamic> json) =>
    _$PacingDetailStateImpl(
      editMode: json['editMode'] as bool,
      pacing: PacingModel.fromJson(json['pacing'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PacingDetailStateImplToJson(
        _$PacingDetailStateImpl instance) =>
    <String, dynamic>{
      'editMode': instance.editMode,
      'pacing': instance.pacing,
    };
