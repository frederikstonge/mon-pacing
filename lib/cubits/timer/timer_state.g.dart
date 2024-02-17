// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimerStoppedStateImpl _$$TimerStoppedStateImplFromJson(
        Map<String, dynamic> json) =>
    _$TimerStoppedStateImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TimerStoppedStateImplToJson(
        _$TimerStoppedStateImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$TimerRunningStateImpl _$$TimerRunningStateImplFromJson(
        Map<String, dynamic> json) =>
    _$TimerRunningStateImpl(
      match: MatchModel.fromJson(json['match'] as Map<String, dynamic>),
      improvisation: ImprovisationModel.fromJson(
          json['improvisation'] as Map<String, dynamic>),
      initialDuration: Duration(microseconds: json['initialDuration'] as int),
      elapsedTime: json['elapsedTime'] == null
          ? null
          : Duration(microseconds: json['elapsedTime'] as int),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TimerRunningStateImplToJson(
        _$TimerRunningStateImpl instance) =>
    <String, dynamic>{
      'match': instance.match,
      'improvisation': instance.improvisation,
      'initialDuration': instance.initialDuration.inMicroseconds,
      'elapsedTime': instance.elapsedTime?.inMicroseconds,
      'runtimeType': instance.$type,
    };

_$TimerPausedStateImpl _$$TimerPausedStateImplFromJson(
        Map<String, dynamic> json) =>
    _$TimerPausedStateImpl(
      match: MatchModel.fromJson(json['match'] as Map<String, dynamic>),
      improvisation: ImprovisationModel.fromJson(
          json['improvisation'] as Map<String, dynamic>),
      initialDuration: Duration(microseconds: json['initialDuration'] as int),
      elapsedTime: json['elapsedTime'] == null
          ? null
          : Duration(microseconds: json['elapsedTime'] as int),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TimerPausedStateImplToJson(
        _$TimerPausedStateImpl instance) =>
    <String, dynamic>{
      'match': instance.match,
      'improvisation': instance.improvisation,
      'initialDuration': instance.initialDuration.inMicroseconds,
      'elapsedTime': instance.elapsedTime?.inMicroseconds,
      'runtimeType': instance.$type,
    };
