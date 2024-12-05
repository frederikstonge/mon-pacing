import 'dart:async';
import 'dart:io';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../extensions/duration_extensions.dart';
import '../models/timer_model.dart';
import '../models/timer_status.dart';

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
    foregroundTaskOptions: ForegroundTaskOptions(
      eventAction: ForegroundTaskEventAction.once(),
      allowWakeLock: true,
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
  TimerModel? _timerModel;
  Timer? _timer;

  @override
  Future<void> onStart(DateTime timestamp, TaskStarter starter) async {
    // Does nothing
  }

  @override
  Future<void> onRepeatEvent(DateTime timestamp) async {
    // Does nothing
  }

  @override
  void onNotificationButtonPressed(String id) {
    // Does nothing
  }

  @override
  void onReceiveData(dynamic data) {
    final event = TimerModel.fromJson(data);
    if (_timerModel == null) {
      _timerModel = event;
      _stopwatch = Stopwatch();
      _timer = Timer.periodic(Duration(milliseconds: 100), onTick);
      _stopwatch!.start();
    } else if (event.status == TimerStatus.started) {
      _stopwatch!.start();
    } else if (event.status == TimerStatus.paused) {
      _stopwatch!.stop();
    }
  }

  @override
  Future<void> onDestroy(DateTime timestamp) async {
    _timerModel = null;
    _stopwatch?.stop();
    _stopwatch = null;
    _timer?.cancel();
    _timer = null;
  }

  @override
  void onNotificationPressed() {
    final matchId = _timerModel!.matchId;
    final improvisationId = _timerModel!.improvisationId;
    final durationIndex = _timerModel!.durationIndex;
    final path = '/matches/details/$matchId?improvisationId=$improvisationId&durationIndex=$durationIndex';
    FlutterForegroundTask.launchApp(path);
  }

  void onTick(Timer timer) {
    var timerModel = _timerModel?.copyWith();

    if (timerModel == null) {
      return;
    }

    final remainingMilliseconds = timerModel.duration.inMilliseconds - _stopwatch!.elapsedMilliseconds;

    timerModel = timerModel.copyWith(remainingMilliseconds: remainingMilliseconds);
    FlutterForegroundTask.sendDataToMain(timerModel.toJson());

    final remainingDuration = Duration(milliseconds: remainingMilliseconds);

    if (remainingDuration.inSeconds >= 0) {
      if (remainingDuration.inSeconds % 60 == 0 ||
          remainingDuration.inSeconds == 30 ||
          remainingDuration.inSeconds == 10 ||
          remainingDuration.inSeconds <= 5) {
        unawaited(vibrate(HapticsType.light));
      }

      unawaited(
        FlutterForegroundTask.updateService(
          notificationTitle: timerModel.notificationTitle,
          notificationText: remainingDuration.toImprovDuration(),
        ),
      );
    }
  }

  Future<void> vibrate(HapticsType type) async {
    if ((_timerModel?.hapticFeedback ?? false) && await Haptics.canVibrate()) {
      await Haptics.vibrate(type);
    }
  }
}
