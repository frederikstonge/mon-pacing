// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimerStateImpl _$$TimerStateImplFromJson(Map<String, dynamic> json) =>
    _$TimerStateImpl(
      timerStatus: json['timerStatus'] == null
          ? null
          : TimerStatusModel.fromJson(
              json['timerStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TimerStateImplToJson(_$TimerStateImpl instance) =>
    <String, dynamic>{
      'timerStatus': instance.timerStatus,
    };
