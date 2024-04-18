// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimerModelImpl _$$TimerModelImplFromJson(Map<String, dynamic> json) =>
    _$TimerModelImpl(
      duration: Duration(microseconds: json['duration'] as int),
      matchId: json['matchId'] as int,
      improvisationId: json['improvisationId'] as int,
      durationIndex: json['durationIndex'] as int,
      status: $enumDecode(_$TimerStatusEnumMap, json['status']),
      remainingMilliseconds: json['remainingMilliseconds'] as int,
      hapticFeedback: json['hapticFeedback'] as bool,
      notificationTitle: json['notificationTitle'] as String,
    );

Map<String, dynamic> _$$TimerModelImplToJson(_$TimerModelImpl instance) =>
    <String, dynamic>{
      'duration': instance.duration.inMicroseconds,
      'matchId': instance.matchId,
      'improvisationId': instance.improvisationId,
      'durationIndex': instance.durationIndex,
      'status': _$TimerStatusEnumMap[instance.status]!,
      'remainingMilliseconds': instance.remainingMilliseconds,
      'hapticFeedback': instance.hapticFeedback,
      'notificationTitle': instance.notificationTitle,
    };

const _$TimerStatusEnumMap = {
  TimerStatus.started: 'started',
  TimerStatus.paused: 'paused',
};
