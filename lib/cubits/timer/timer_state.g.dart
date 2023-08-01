// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimerStoppedState _$$TimerStoppedStateFromJson(Map<String, dynamic> json) =>
    _$TimerStoppedState(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TimerStoppedStateToJson(_$TimerStoppedState instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$TimerRunningState _$$TimerRunningStateFromJson(Map<String, dynamic> json) =>
    _$TimerRunningState(
      match: MatchModel.fromJson(json['match'] as Map<String, dynamic>),
      improvisation: ImprovisationModel.fromJson(
          json['improvisation'] as Map<String, dynamic>),
      initialDuration: Duration(microseconds: json['initialDuration'] as int),
      elapsedTime: json['elapsedTime'] == null
          ? null
          : Duration(microseconds: json['elapsedTime'] as int),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TimerRunningStateToJson(_$TimerRunningState instance) =>
    <String, dynamic>{
      'match': instance.match,
      'improvisation': instance.improvisation,
      'initialDuration': instance.initialDuration.inMicroseconds,
      'elapsedTime': instance.elapsedTime?.inMicroseconds,
      'runtimeType': instance.$type,
    };

_$TimerPausedState _$$TimerPausedStateFromJson(Map<String, dynamic> json) =>
    _$TimerPausedState(
      match: MatchModel.fromJson(json['match'] as Map<String, dynamic>),
      improvisation: ImprovisationModel.fromJson(
          json['improvisation'] as Map<String, dynamic>),
      initialDuration: Duration(microseconds: json['initialDuration'] as int),
      elapsedTime: json['elapsedTime'] == null
          ? null
          : Duration(microseconds: json['elapsedTime'] as int),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TimerPausedStateToJson(_$TimerPausedState instance) =>
    <String, dynamic>{
      'match': instance.match,
      'improvisation': instance.improvisation,
      'initialDuration': instance.initialDuration.inMicroseconds,
      'elapsedTime': instance.elapsedTime?.inMicroseconds,
      'runtimeType': instance.$type,
    };
