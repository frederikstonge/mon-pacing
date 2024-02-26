import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_event_model.freezed.dart';

@freezed
class TimerEventModel with _$TimerEventModel {
  const factory TimerEventModel({
    required String eventName,
    String? data,
  }) = _TimerEventModel;

  factory TimerEventModel.fromJson(Map<String, dynamic> json) => _$TimerEventModelFromJson(json);
}
