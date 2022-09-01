// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchModel _$MatchModelFromJson(Map<String, dynamic> json) => MatchModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      teams: (json['teams'] as List<dynamic>?)
          ?.map((e) => TeamModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      improvisations: (json['improvisations'] as List<dynamic>?)
          ?.map((e) =>
              MatchImprovisationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      penalties: (json['penalties'] as List<dynamic>?)
          ?.map((e) => PenaltyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MatchModelToJson(MatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'teams': instance.teams,
      'improvisations': instance.improvisations,
      'penalties': instance.penalties,
    };
