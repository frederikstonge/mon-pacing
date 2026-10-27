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
  void initialize({required Function(Object data) taskDataCallback}) {
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: 'foreground_service',
        channelName: 'Foreground Service Notification',
        channelDescription: 'This notification appears when the foreground service is running.',
        channelImportance: NotificationChannelImportance.LOW,
        priority: NotificationPriority.LOW,
      ),
      iosNotificationOptions: const IOSNotificationOptions(showNotification: false, playSound: false),
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

    final NotificationPermission notificationPermissionStatus =
        await FlutterForegroundTask.checkNotificationPermission();
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
    if (await FlutterForegroundTask.isRunningService) {
      await _stopRunningService();
    }

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

  Future<void> stop() => _stopRunningService();

  Future<void> _stopRunningService() async {
    if (await FlutterForegroundTask.isRunningService) {
      await FlutterForegroundTask.stopService();
    }
    await WakelockPlus.disable();
  }
}

class TimerTaskHandler extends TaskHandler {
  Stopwatch? _stopwatch;
  Timer? _timer;
  Map<int, bool>? _vibrationMap;
  TaskMessage? _taskMessage;
  TimerStatus? _requestedStatus;
  int? _lastSentRemainingSecond;
  bool _isTickRunning = false;

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
        for (var i = 1; i < (event.durationInSeconds / 60).floor(); i++) ...{60 * i: false},
        if (event.durationInSeconds > 30) ...{30: false},
        if (event.durationInSeconds > 10) ...{10: false},
        if (event.durationInSeconds > 5) ...{5: false},
        if (event.durationInSeconds > 4) ...{4: false},
        if (event.durationInSeconds > 3) ...{3: false},
        if (event.durationInSeconds > 2) ...{2: false},
        if (event.durationInSeconds > 1) ...{1: false},
      };
      _stopwatch = Stopwatch();
      _lastSentRemainingSecond = null;
      _timer = Timer.periodic(Duration(milliseconds: 100), onTick);
      if (event.status == TimerStatus.started) {
        _stopwatch!.start();
      }
    } else if (event.runId != _taskMessage!.runId) {
      return;
    } else if (event.status == TimerStatus.started && _taskMessage!.status != TimerStatus.started) {
      _stopwatch!.start();
      _taskMessage = _taskMessage?.copyWith(status: TimerStatus.started);
    } else if (event.status == TimerStatus.paused && _taskMessage!.status != TimerStatus.paused) {
      _stopwatch!.stop();
      _taskMessage = _taskMessage?.copyWith(status: TimerStatus.paused);
    }
  }

  @override
  Future<void> onDestroy(DateTime timestamp, bool isTimeout) async {
    _taskMessage = null;
    _stopwatch?.stop();
    _stopwatch = null;
    _timer?.cancel();
    _timer = null;
    _vibrationMap = null;
    _lastSentRemainingSecond = null;
    _isTickRunning = false;
  }

  Future<void> onTick(Timer timer) async {
    if (_isTickRunning) {
      return;
    }

    final taskMessage = _taskMessage;
    final stopwatch = _stopwatch;
    final vibrationMap = _vibrationMap;
    if (taskMessage == null || stopwatch == null || vibrationMap == null) {
      return;
    }

    _isTickRunning = true;
    try {
      final duration = Duration(seconds: taskMessage.durationInSeconds);
      final remainingMilliseconds = duration.inMilliseconds - stopwatch.elapsedMilliseconds;
      final requestedStatus = _requestedStatus;
      final mainMessage = MainMessage(
        runId: taskMessage.runId,
        requestedStatus: requestedStatus,
        remainingMilliseconds: remainingMilliseconds,
      );
      _requestedStatus = null;

      final remainingDuration = Duration(milliseconds: remainingMilliseconds);
      final isExpired = remainingMilliseconds <= 0;
      if (remainingDuration.inSeconds != _lastSentRemainingSecond || requestedStatus != null || isExpired) {
        FlutterForegroundTask.sendDataToMain(mainMessage.toJson());
        _lastSentRemainingSecond = remainingDuration.inSeconds;
      }
      if (isExpired) {
        timer.cancel();
      }

      if (remainingDuration.inSeconds >= 0 && vibrationMap[remainingDuration.inSeconds] == false) {
        unawaited(vibrate(HapticsType.light));
        vibrationMap[remainingDuration.inSeconds] = true;
      }

      if (timer.tick % 10 == 0 || requestedStatus != null) {
        final isRunning = await FlutterForegroundTask.isRunningService;
        final currentTaskMessage = _taskMessage;
        if (isRunning && currentTaskMessage != null && currentTaskMessage.runId == taskMessage.runId) {
          final notificationStatus = requestedStatus ?? currentTaskMessage.status;
          unawaited(
            FlutterForegroundTask.updateService(
              notificationTitle: currentTaskMessage.notificationTitle,
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
    } finally {
      _isTickRunning = false;
    }
  }

  Future<void> vibrate(HapticsType type) async {
    if ((_taskMessage?.hapticFeedback ?? false) && await Haptics.canVibrate()) {
      await Haptics.vibrate(type);
    }
  }
}
