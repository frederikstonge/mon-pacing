// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimerStateImpl _$$TimerStateImplFromJson(Map<String, dynamic> json) =>
    _$TimerStateImpl(
      timer: json['timer'] == null
          ? null
          : TimerModel.fromJson(json['timer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TimerStateImplToJson(_$TimerStateImpl instance) =>
    <String, dynamic>{
      'timer': instance.timer,
    };
