// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimerModelImpl _$$TimerModelImplFromJson(Map<String, dynamic> json) =>
    _$TimerModelImpl(
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
      matchId: (json['matchId'] as num).toInt(),
      improvisationId: (json['improvisationId'] as num).toInt(),
      durationIndex: (json['durationIndex'] as num).toInt(),
      status: $enumDecode(_$TimerStatusEnumMap, json['status']),
      remainingMilliseconds: (json['remainingMilliseconds'] as num).toInt(),
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
