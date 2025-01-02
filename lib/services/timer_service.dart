import 'dart:async';
import 'dart:io';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../extensions/duration_extensions.dart';
import '../l10n/localizer.dart';
import '../models/main_message.dart';
import '../models/task_message.dart';
import '../models/timer_status.dart';

@pragma('vm:entry-point')
void startCallback() {
  FlutterForegroundTask.setTaskHandler(TimerTaskHandler());
}

class TimerService {
  Future<bool> get isRunning => FlutterForegroundTask.isRunningService;

  void initialize({required Function(Object data) taskDataCallback}) {
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

    FlutterForegroundTask.initCommunicationPort();
    FlutterForegroundTask.addTaskDataCallback(taskDataCallback);
  }

  void dispose({required Function(Object data) taskDataCallback}) {
    FlutterForegroundTask.removeTaskDataCallback(taskDataCallback);
  }

  void sendDataToTask(TaskMessage data) {
    FlutterForegroundTask.sendDataToTask(data.toJson());
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

  Future<void> start(String initialRoute, {bool enableWakelock = false}) async {
    await FlutterForegroundTask.startService(
      notificationTitle: Localizer.current.notificationTitle,
      notificationText: '',
      notificationInitialRoute: initialRoute,
      notificationIcon: NotificationIcon(metaDataName: 'com.stongef.monpacing.NOTIFICATION_ICON'),
      callback: startCallback,
    );

    if (enableWakelock) {
      await WakelockPlus.enable();
    }
  }

  Future<void> stop() async {
    if (await isRunning) {
      await FlutterForegroundTask.stopService();
      await WakelockPlus.disable();
    }
  }
}

class TimerTaskHandler extends TaskHandler {
  Stopwatch? _stopwatch;
  Timer? _timer;
  Map<int, bool>? _vibrationMap;
  TaskMessage? _taskMessage;
  TimerStatus? _requestedStatus;

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
      _requestedStatus = TimerStatus.started;
    }

    if (id == 'pause') {
      _requestedStatus = TimerStatus.paused;
    }

    if (id == 'stop') {
      _requestedStatus = TimerStatus.stopped;
    }
  }

  @override
  void onReceiveData(dynamic data) {
    final event = TaskMessageMapper.fromJson(data);
    if (_taskMessage == null) {
      _taskMessage = event;
      _vibrationMap = {
        for (var i = 1; i < (event.durationInSeconds / 60).floor(); i++) ...{
          60 * i: false,
        },
        if (event.durationInSeconds > 30) ...{
          30: false,
        },
        if (event.durationInSeconds > 10) ...{
          10: false,
        },
        if (event.durationInSeconds > 5) ...{
          5: false,
        },
        if (event.durationInSeconds > 4) ...{
          4: false,
        },
        if (event.durationInSeconds > 3) ...{
          3: false,
        },
        if (event.durationInSeconds > 2) ...{
          2: false,
        },
        if (event.durationInSeconds > 1) ...{
          1: false,
        },
      };
      _stopwatch = Stopwatch();
      _timer = Timer.periodic(Duration(milliseconds: 100), onTick);
      _stopwatch!.start();
    } else if (event.status == TimerStatus.started && _taskMessage!.status != TimerStatus.started) {
      _stopwatch!.start();
      _taskMessage = _taskMessage?.copyWith(status: TimerStatus.started);
    } else if (event.status == TimerStatus.paused && _taskMessage!.status != TimerStatus.paused) {
      _stopwatch!.stop();
      _taskMessage = _taskMessage?.copyWith(status: TimerStatus.paused);
    }
  }

  @override
  Future<void> onDestroy(DateTime timestamp) async {
    _taskMessage = null;
    _stopwatch?.stop();
    _stopwatch = null;
    _timer?.cancel();
    _timer = null;
    _vibrationMap = null;
  }

  void onTick(Timer timer) {
    if (_taskMessage == null) {
      return;
    }

    final duration = Duration(seconds: _taskMessage!.durationInSeconds);
    final remainingMilliseconds = duration.inMilliseconds - _stopwatch!.elapsedMilliseconds;

    final mainMessage = MainMessage(requestedStatus: _requestedStatus, remainingMilliseconds: remainingMilliseconds);
    _requestedStatus = null;

    FlutterForegroundTask.sendDataToMain(mainMessage.toJson());

    final remainingDuration = Duration(milliseconds: remainingMilliseconds);

    if (remainingDuration.inSeconds >= 0) {
      if (_vibrationMap![remainingDuration.inSeconds] == false) {
        unawaited(vibrate(HapticsType.light));
        _vibrationMap![remainingDuration.inSeconds] = true;
      }
    }

    if (_timer!.tick % 10 == 0 || mainMessage.requestedStatus != null) {
      final notificationStatus = mainMessage.requestedStatus ?? _taskMessage!.status;
      unawaited(
        FlutterForegroundTask.updateService(
          notificationTitle: _taskMessage!.notificationTitle,
          notificationText: remainingDuration.toImprovDuration(),
          notificationButtons: [
            if (notificationStatus == TimerStatus.paused) ...[
              NotificationButton(id: 'resume', text: Localizer.current.start),
            ],
            if (notificationStatus == TimerStatus.started) ...[
              NotificationButton(id: 'pause', text: Localizer.current.pause),
            ],
            NotificationButton(id: 'stop', text: Localizer.current.stop),
          ],
        ),
      );
    }
  }

  Future<void> vibrate(HapticsType type) async {
    if ((_taskMessage?.hapticFeedback ?? false) && await Haptics.canVibrate()) {
      await Haptics.vibrate(type);
    }
  }
}
