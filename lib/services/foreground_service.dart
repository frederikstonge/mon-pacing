import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../extensions/duration_extensions.dart';
import '../models/timer_model.dart';
import '../models/timer_status.dart';

const String timerStatusDataKey = 'timerStatus';

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
      iconData: const NotificationIconData(
        resType: ResourceType.mipmap,
        resPrefix: ResourcePrefix.ic,
        name: 'launcher',
      ),
    ),
    iosNotificationOptions: const IOSNotificationOptions(
      showNotification: false,
      playSound: false,
    ),
    foregroundTaskOptions: const ForegroundTaskOptions(
      interval: 1000,
      isOnceEvent: false,
      autoRunOnBoot: true,
      allowWakeLock: true,
      allowWifiLock: true,
    ),
  );
}

Future<void> requestPermissionForAndroid() async {
  if (!Platform.isAndroid) {
    return;
  }

  final NotificationPermission notificationPermissionStatus = await FlutterForegroundTask.checkNotificationPermission();
  if (notificationPermissionStatus != NotificationPermission.granted) {
    await FlutterForegroundTask.requestNotificationPermission();
  }

  if (!await FlutterForegroundTask.isIgnoringBatteryOptimizations) {
    await FlutterForegroundTask.requestIgnoreBatteryOptimization();
  }
}

class TimerTaskHandler extends TaskHandler {
  SendPort? _sendPort;
  Stopwatch? _stopwatch;
  TimerModel? _timer;

  @override
  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    _sendPort = sendPort;

    _timer = await getTimerStatus();
    if (_timer == null) {
      await FlutterForegroundTask.stopService();
      return;
    }

    _stopwatch = Stopwatch();

    await onTick();
  }

  @override
  Future<void> onRepeatEvent(DateTime timestamp, SendPort? sendPort) async {
    _timer = await getTimerStatus();
    if (_timer == null) {
      await FlutterForegroundTask.stopService();
      return;
    }

    await onTick();
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

  Future<void> onTick() async {
    if (_timer!.status == TimerStatus.paused) {
      if (_stopwatch!.isRunning) {
        _stopwatch!.stop();
      }

      return;
    }

    if (!_stopwatch!.isRunning) {
      _stopwatch!.start();
    }

    final remainingMilliseconds = _timer!.duration.inMilliseconds - _stopwatch!.elapsedMilliseconds;

    _timer = _timer!.copyWith(remainingMilliseconds: remainingMilliseconds);
    await FlutterForegroundTask.saveData(key: timerStatusDataKey, value: json.encode(_timer!.toJson()));

    _sendPort?.send(_timer!.toJson());

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
      notificationTitle: _timer!.notificationTitle,
      notificationText: remainingDuration.toImprovDuration(),
    );
  }

  Future<TimerModel?> getTimerStatus() async {
    final data = await FlutterForegroundTask.getData<String>(key: timerStatusDataKey);
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
