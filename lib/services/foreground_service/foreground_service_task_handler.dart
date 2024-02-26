import 'dart:isolate';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';

import '../../extensions/duration_extensions.dart';
import 'timer_event_model.dart';
import 'timer_status_model.dart';

@pragma('vm:entry-point')
void startCallback() {
  FlutterForegroundTask.setTaskHandler(TimerTaskHandler());
}

class TimerTaskHandler extends TaskHandler {
  SendPort? _sendPort;
  Stopwatch? _stopwatch;
  TimerStatusModel? _timerStatus;

  @override
  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    _sendPort = sendPort;

    _timerStatus = await FlutterForegroundTask.getData<TimerStatusModel>(key: 'timerStatus');
    if (_timerStatus == null) {
      await FlutterForegroundTask.stopService();
      return;
    }

    _stopwatch = Stopwatch();

    await onTick();
  }

  @override
  Future<void> onRepeatEvent(DateTime timestamp, SendPort? sendPort) async {
    _timerStatus = await FlutterForegroundTask.getData<TimerStatusModel>(key: 'timerStatus');
    if (_timerStatus == null) {
      await FlutterForegroundTask.stopService();
      return;
    }

    await onTick();
  }

  @override
  Future<void> onDestroy(DateTime timestamp, SendPort? sendPort) async {
    _timerStatus = null;
    _stopwatch?.stop();
    _stopwatch = null;
  }

  @override
  void onNotificationButtonPressed(String id) {
    // No button implemented
  }

  @override
  void onNotificationPressed() {
    final matchId = _timerStatus?.matchId;
    if (matchId != null) {
      FlutterForegroundTask.launchApp('/resume-route');
      final event = TimerEventModel(eventName: 'onNotificationPressed', data: _timerStatus?.matchId.toString());
      _sendPort?.send(event.toJson());
    }

    FlutterForegroundTask.launchApp();
  }

  Future<void> onTick() async {
    if (!_stopwatch!.isRunning && _timerStatus!.status == TimerStatus.started) {
      _stopwatch!.start();
    } else if (_stopwatch!.isRunning && _timerStatus!.status == TimerStatus.paused) {
      _stopwatch!.stop();
    }

    final elapsed = _timerStatus!.duration.inMilliseconds - _stopwatch!.elapsedMilliseconds;
    if (elapsed <= 0) {
      await FlutterForegroundTask.stopService();
      return;
    }

    final elapsedDuration = Duration(milliseconds: elapsed);
    final event = TimerEventModel(eventName: 'update', data: elapsedDuration.inMilliseconds.toString());

    _sendPort?.send(event.toJson());

    await FlutterForegroundTask.updateService(
      notificationTitle: 'Timer',
      notificationText: elapsedDuration.toImprovDuration(),
    );
  }
}
