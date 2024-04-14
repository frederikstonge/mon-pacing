import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../extensions/duration_extensions.dart';
import 'timer_status_model.dart';

const String timerStatusDataKey = 'timerStatus';

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

    _timerStatus = await getTimerStatus();
    if (_timerStatus == null) {
      await FlutterForegroundTask.stopService();
      return;
    }

    _stopwatch = Stopwatch();

    await onTick();
  }

  @override
  Future<void> onRepeatEvent(DateTime timestamp, SendPort? sendPort) async {
    _timerStatus = await getTimerStatus();
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
    final matchId = _timerStatus!.matchId;
    final improvisationId = _timerStatus!.improvisationId;
    final durationIndex = _timerStatus!.durationIndex;
    final path = '/matches/details/$matchId?improvisationId=$improvisationId&durationIndex=$durationIndex';
    FlutterForegroundTask.launchApp(path);
  }

  Future<void> onTick() async {
    if (_timerStatus!.status == TimerStatus.paused) {
      if (_stopwatch!.isRunning) {
        _stopwatch!.stop();
      }

      return;
    }

    if (!_stopwatch!.isRunning) {
      _stopwatch!.start();
    }

    final remainingMilliseconds = _timerStatus!.duration.inMilliseconds - _stopwatch!.elapsedMilliseconds;

    _timerStatus = _timerStatus!.copyWith(remainingMilliseconds: remainingMilliseconds);
    await FlutterForegroundTask.saveData(key: timerStatusDataKey, value: json.encode(_timerStatus!.toJson()));

    _sendPort?.send(_timerStatus!.toJson());

    if (remainingMilliseconds <= 0) {
      await FlutterForegroundTask.stopService();
      return;
    }

    final remainingDuration = Duration(milliseconds: remainingMilliseconds);

    if (remainingDuration.inSeconds % 60 == 0 ||
        remainingDuration.inSeconds == 30 ||
        remainingDuration.inSeconds == 10 ||
        remainingDuration.inSeconds <= 5) {
      unawaited(vibrate(HapticsType.medium));
    }

    await FlutterForegroundTask.updateService(
      notificationTitle: _timerStatus!.notificationTitle,
      notificationText: remainingDuration.toImprovDuration(),
    );
  }

  Future<TimerStatusModel?> getTimerStatus() async {
    final data = await FlutterForegroundTask.getData<String>(key: timerStatusDataKey);
    if (data == null) {
      return null;
    }
    return TimerStatusModel.fromJson(json.decode(data));
  }

  Future<void> vibrate(HapticsType type) async {
    if ((_timerStatus?.hapticFeedback ?? false) && await Haptics.canVibrate()) {
      await Haptics.vibrate(type);
    }
  }
}
