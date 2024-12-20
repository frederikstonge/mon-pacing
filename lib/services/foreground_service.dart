import 'dart:async';
import 'dart:io';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../extensions/duration_extensions.dart';
import '../l10n/localizer.dart';
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
  Map<int, bool>? _vibrationMap;

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
    if (id == 'resume') {
      _timerModel = _timerModel?.copyWith(requestedStatus: TimerStatus.started);
    }

    if (id == 'pause') {
      _timerModel = _timerModel?.copyWith(requestedStatus: TimerStatus.paused);
    }
  }

  @override
  void onReceiveData(dynamic data) {
    final event = TimerModelMapper.fromJson(data);
    if (_timerModel == null) {
      _timerModel = event;
      _vibrationMap = {
        for (var i = 1; i <= (event.durationInSeconds / 60).ceil(); i++) ...{
          60 * i: false,
        },
        if (event.durationInSeconds >= 30) ...{
          30: false,
        },
        if (event.durationInSeconds >= 10) ...{
          10: false,
        },
        if (event.durationInSeconds >= 5) ...{
          5: false,
        },
        if (event.durationInSeconds >= 4) ...{
          4: false,
        },
        if (event.durationInSeconds >= 3) ...{
          3: false,
        },
        if (event.durationInSeconds >= 2) ...{
          2: false,
        },
        if (event.durationInSeconds >= 1) ...{
          1: false,
        },
      };
      _stopwatch = Stopwatch();
      _timer = Timer.periodic(Duration(milliseconds: 100), onTick);
      _stopwatch!.start();
    } else if (event.status == TimerStatus.started) {
      _stopwatch!.start();
      _timerModel = _timerModel?.copyWith(status: TimerStatus.started);
    } else if (event.status == TimerStatus.paused) {
      _stopwatch!.stop();
      _timerModel = _timerModel?.copyWith(status: TimerStatus.paused);
    }
  }

  @override
  Future<void> onDestroy(DateTime timestamp) async {
    _timerModel = null;
    _stopwatch?.stop();
    _stopwatch = null;
    _timer?.cancel();
    _timer = null;
    _vibrationMap = null;
  }

  void onTick(Timer timer) {
    if (_timerModel == null) {
      return;
    }

    final duration = Duration(seconds: _timerModel!.durationInSeconds);
    final remainingMilliseconds = duration.inMilliseconds - _stopwatch!.elapsedMilliseconds;

    FlutterForegroundTask.sendDataToMain(_timerModel!.copyWith(remainingMilliseconds: remainingMilliseconds).toJson());

    if (_timerModel!.requestedStatus != null) {
      _timerModel = _timerModel!.copyWith(requestedStatus: null);
    }

    final remainingDuration = Duration(milliseconds: remainingMilliseconds);

    if (remainingDuration.inSeconds >= 0) {
      if (_vibrationMap![remainingDuration.inSeconds] == false) {
        unawaited(vibrate(HapticsType.light));
        _vibrationMap![remainingDuration.inSeconds] = true;
      }

      unawaited(
        FlutterForegroundTask.updateService(
          notificationTitle: _timerModel!.notificationTitle,
          notificationText: remainingDuration.toImprovDuration(),
          notificationButtons: [
            if (_timerModel!.status == TimerStatus.paused) ...[
              NotificationButton(id: 'resume', text: Localizer.current.start),
            ],
            if (_timerModel!.status == TimerStatus.started) ...[
              NotificationButton(id: 'pause', text: Localizer.current.pause),
            ],
          ],
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
