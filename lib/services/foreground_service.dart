import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../extensions/duration_extensions.dart';
import '../models/timer_model.dart';
import '../models/timer_status.dart';

const String timerDataKey = 'timer';

@pragma('vm:entry-point')
void startCallback() {
  FlutterForegroundTask.setTaskHandler(TimerTaskHandler());
}

void initForegroundTask() {
  FlutterForegroundTask.init(
    androidNotificationOptions: AndroidNotificationOptions(
      channelId: 'foreground_service',
      channelName: 'Foreground Service Notification',
      channelDescription: 'This notification appears when the foreground service is running.',
      channelImportance: NotificationChannelImportance.LOW,
      priority: NotificationPriority.LOW,
    ),
    iosNotificationOptions: const IOSNotificationOptions(
      showNotification: false,
      playSound: false,
    ),
    foregroundTaskOptions: const ForegroundTaskOptions(
      interval: 1000,
      allowWakeLock: true,
      isOnceEvent: false,
      autoRunOnBoot: false,
      autoRunOnMyPackageReplaced: false,
      allowWifiLock: false,
    ),
  );
}

Future<bool> requestNotificationPermission() async {
  if (!Platform.isAndroid) {
    return true;
  }

  final NotificationPermission notificationPermissionStatus = await FlutterForegroundTask.checkNotificationPermission();
  if (notificationPermissionStatus != NotificationPermission.granted) {
    final notificationPermission = await FlutterForegroundTask.requestNotificationPermission();
    if (notificationPermission != NotificationPermission.granted) {
      return false;
    }
  }

  return true;
}

Future<bool> requestIgnoreBatteryOptimization() async {
  if (!Platform.isAndroid) {
    return true;
  }

  if (!await FlutterForegroundTask.isIgnoringBatteryOptimizations) {
    final batteryOptimization = await FlutterForegroundTask.requestIgnoreBatteryOptimization();
    return batteryOptimization;
  }

  return true;
}

class TimerTaskHandler extends TaskHandler {
  Stopwatch? _stopwatch;
  TimerModel? _timer;

  @override
  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    _timer = await getTimer();
    _stopwatch = Stopwatch();
    await onTick(sendPort);
  }

  @override
  Future<void> onRepeatEvent(DateTime timestamp, SendPort? sendPort) async {
    _timer = await getTimer();
    await onTick(sendPort);
  }

  @override
  Future<void> onDestroy(DateTime timestamp, SendPort? sendPort) async {
    _timer = null;
    _stopwatch?.stop();
    _stopwatch = null;
  }

  @override
  void onNotificationButtonPressed(String id) {
    // No button implemented
  }

  @override
  void onNotificationPressed() {
    final matchId = _timer!.matchId;
    final improvisationId = _timer!.improvisationId;
    final durationIndex = _timer!.durationIndex;
    final path = '/matches/details/$matchId?improvisationId=$improvisationId&durationIndex=$durationIndex';
    FlutterForegroundTask.launchApp(path);
  }

  Future<void> onTick(SendPort? sendPort) async {
    var timer = _timer?.copyWith();

    // Handle STOP
    if (timer == null) {
      return;
    }
    if (timer.status == TimerStatus.started) {
      // Handle RESUME
      if (!_stopwatch!.isRunning) {
        _stopwatch!.start();
      }
    } else {
      // Handle PAUSED
      if (_stopwatch!.isRunning) {
        _stopwatch!.stop();
      }

      return;
    }

    final remainingMilliseconds = timer.duration.inMilliseconds - _stopwatch!.elapsedMilliseconds;

    timer = timer.copyWith(remainingMilliseconds: remainingMilliseconds);
    sendPort?.send(timer.toJson());

    final remainingDuration = Duration(milliseconds: remainingMilliseconds);

    if (remainingDuration.inSeconds >= 0) {
      if (remainingDuration.inSeconds % 60 == 0 ||
          remainingDuration.inSeconds == 30 ||
          remainingDuration.inSeconds == 10 ||
          remainingDuration.inSeconds <= 5) {
        unawaited(vibrate(HapticsType.light));
      }

      await FlutterForegroundTask.updateService(
        notificationTitle: timer.notificationTitle,
        notificationText: remainingDuration.toImprovDuration(),
      );
    }
  }

  Future<TimerModel?> getTimer() async {
    final data = await FlutterForegroundTask.getData<String>(key: timerDataKey);
    if (data == null) {
      return null;
    }

    return TimerModel.fromJson(json.decode(data));
  }

  Future<void> vibrate(HapticsType type) async {
    if ((_timer?.hapticFeedback ?? false) && await Haptics.canVibrate()) {
      await Haptics.vibrate(type);
    }
  }
}
