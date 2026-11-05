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
  static const _taskDataRetryInterval = Duration(milliseconds: 200);
  static const _maxTaskDataRetries = 50;

  Function(Object data)? _taskDataCallback;
  Timer? _taskDataRetryTimer;
  String? _pendingTaskData;
  String? _pendingRunId;
  String? _acknowledgedRunId;
  var _taskDataRetryCount = 0;

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

    final existingCallback = _taskDataCallback;
    if (existingCallback != null) {
      FlutterForegroundTask.removeTaskDataCallback(existingCallback);
    }

    _taskDataCallback = (data) {
      if (data is String && _pendingRunId != null) {
        try {
          final message = MainMessageMapper.fromJson(data);
          if (message.runId == _pendingRunId) {
            _acknowledgedRunId = _pendingRunId;
            _cancelTaskDataRetries();
          }
        } catch (_) {}
      }

      taskDataCallback(data);
    };
    FlutterForegroundTask.addTaskDataCallback(_taskDataCallback!);
  }

  void dispose({required Function(Object data) taskDataCallback}) {
    final registeredCallback = _taskDataCallback;
    if (registeredCallback != null) {
      FlutterForegroundTask.removeTaskDataCallback(registeredCallback);
      _taskDataCallback = null;
    }
    _cancelTaskDataRetries();
  }

  void sendDataToTask(TaskMessage data) {
    final taskData = data.toJson();
    if (_acknowledgedRunId == data.runId) {
      FlutterForegroundTask.sendDataToTask(taskData);
      return;
    }

    _taskDataRetryTimer?.cancel();
    _pendingTaskData = taskData;
    _pendingRunId = data.runId;
    _taskDataRetryCount = 0;
    FlutterForegroundTask.sendDataToTask(taskData);
    _taskDataRetryTimer = Timer.periodic(_taskDataRetryInterval, (timer) {
      if (!identical(_taskDataRetryTimer, timer) || _pendingTaskData != taskData) {
        timer.cancel();
        return;
      }

      if (++_taskDataRetryCount >= _maxTaskDataRetries) {
        timer.cancel();
        _taskDataRetryTimer = null;
        _pendingTaskData = null;
        _pendingRunId = null;
        return;
      }

      FlutterForegroundTask.sendDataToTask(taskData);
    });
  }

  void _cancelTaskDataRetries() {
    _taskDataRetryTimer?.cancel();
    _taskDataRetryTimer = null;
    _pendingTaskData = null;
    _pendingRunId = null;
    _taskDataRetryCount = 0;
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

    final result = await FlutterForegroundTask.startService(
      notificationTitle: Localizer.current.notificationTitle,
      notificationText: '',
      notificationInitialRoute: initialRoute,
      notificationIcon: NotificationIcon(metaDataName: 'com.stongef.monpacing.NOTIFICATION_ICON'),
      callback: startCallback,
    );
    if (result case ServiceRequestFailure(:final error)) {
      throw error;
    }

    if (enableWakelock) {
      await WakelockPlus.enable();
    }
  }

  Future<void> stop() => _stopRunningService();

  Future<void> _stopRunningService() async {
    _cancelTaskDataRetries();
    _acknowledgedRunId = null;
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
      _handleNotificationResume();
    } else if (id == 'pause') {
      _handleNotificationPause();
    } else if (id == 'stop') {
      _handleNotificationStop();
    }
  }

  @override
  void onReceiveData(dynamic data) {
    final TaskMessage event;
    try {
      event = TaskMessageMapper.fromJson(data is String ? data : data.toString());
    } catch (_) {
      return;
    }

    if (_taskMessage == null || event.runId != _taskMessage!.runId) {
      _initNewRun(event);
      return;
    }

    if (event.status == TimerStatus.started && _taskMessage!.status != TimerStatus.started) {
      if (_stopwatch?.isRunning == false) {
        _stopwatch?.start();
      }
      _taskMessage = _taskMessage?.copyWith(status: TimerStatus.started);
      _updateNotification(status: TimerStatus.started);
      _sendSyncToMain();
    } else if (event.status == TimerStatus.paused && _taskMessage!.status != TimerStatus.paused) {
      if (_stopwatch?.isRunning == true) {
        _stopwatch?.stop();
      }
      _taskMessage = _taskMessage?.copyWith(status: TimerStatus.paused);
      _updateNotification(status: TimerStatus.paused);
      _sendSyncToMain();
    } else {
      _sendSyncToMain();
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

  void _initNewRun(TaskMessage event) {
    _timer?.cancel();
    _stopwatch?.stop();
    _stopwatch = Stopwatch();
    _taskMessage = event;
    _lastSentRemainingSecond = null;
    _isTickRunning = false;
    _vibrationMap = _buildVibrationMap(event.durationInSeconds);

    if (event.status == TimerStatus.started) {
      _stopwatch!.start();
    }

    _timer = Timer.periodic(const Duration(milliseconds: 100), onTick);

    _sendSyncToMain();
    _updateNotification(status: event.status);
  }

  void _handleNotificationResume() {
    final taskMessage = _taskMessage;
    final stopwatch = _stopwatch;
    if (taskMessage == null || stopwatch == null) {
      return;
    }

    if (!stopwatch.isRunning) {
      stopwatch.start();
    }
    _taskMessage = taskMessage.copyWith(status: TimerStatus.started);

    _sendSyncToMain(requestedStatus: TimerStatus.started);
    _updateNotification(status: TimerStatus.started);
  }

  void _handleNotificationPause() {
    final taskMessage = _taskMessage;
    final stopwatch = _stopwatch;
    if (taskMessage == null || stopwatch == null) {
      return;
    }

    if (stopwatch.isRunning) {
      stopwatch.stop();
    }
    _taskMessage = taskMessage.copyWith(status: TimerStatus.paused);

    _sendSyncToMain(requestedStatus: TimerStatus.paused);
    _updateNotification(status: TimerStatus.paused);
  }

  void _handleNotificationStop() {
    final taskMessage = _taskMessage;
    final stopwatch = _stopwatch;
    if (taskMessage == null) {
      return;
    }

    stopwatch?.stop();
    _timer?.cancel();
    _timer = null;

    final remaining = _getRemainingMilliseconds();
    FlutterForegroundTask.sendDataToMain(
      MainMessage(
        runId: taskMessage.runId,
        remainingMilliseconds: remaining,
        requestedStatus: TimerStatus.stopped,
      ).toJson(),
    );
  }

  void onTick(Timer timer) {
    if (_isTickRunning) {
      return;
    }

    final taskMessage = _taskMessage;
    final stopwatch = _stopwatch;
    final vibrationMap = _vibrationMap;
    if (taskMessage == null || stopwatch == null || vibrationMap == null) {
      return;
    }

    if (!stopwatch.isRunning && taskMessage.status == TimerStatus.paused) {
      return;
    }

    _isTickRunning = true;
    try {
      final remainingMilliseconds = _getRemainingMilliseconds();

      if (remainingMilliseconds <= 0) {
        stopwatch.stop();
        timer.cancel();
        _timer = null;
        FlutterForegroundTask.sendDataToMain(
          MainMessage(
            runId: taskMessage.runId,
            remainingMilliseconds: 0,
            requestedStatus: TimerStatus.stopped,
          ).toJson(),
        );
        return;
      }

      final remainingDuration = Duration(milliseconds: remainingMilliseconds);
      final remainingSeconds = remainingDuration.inSeconds;

      if (remainingSeconds >= 0 && vibrationMap[remainingSeconds] == false) {
        unawaited(vibrate(HapticsType.light));
        vibrationMap[remainingSeconds] = true;
      }

      if (remainingSeconds != _lastSentRemainingSecond) {
        FlutterForegroundTask.sendDataToMain(
          MainMessage(runId: taskMessage.runId, remainingMilliseconds: remainingMilliseconds).toJson(),
        );
        _lastSentRemainingSecond = remainingSeconds;
      }

      if (timer.tick % 10 == 0) {
        _updateNotification(status: taskMessage.status, remainingDuration: remainingDuration);
      }
    } finally {
      _isTickRunning = false;
    }
  }

  int _getRemainingMilliseconds() {
    final taskMessage = _taskMessage;
    final stopwatch = _stopwatch;
    if (taskMessage == null || stopwatch == null) {
      return 0;
    }
    final total = taskMessage.durationInSeconds * 1000;
    return (total - stopwatch.elapsedMilliseconds).clamp(0, total);
  }

  void _sendSyncToMain({TimerStatus? requestedStatus}) {
    final taskMessage = _taskMessage;
    final stopwatch = _stopwatch;
    if (taskMessage == null || stopwatch == null) {
      return;
    }

    final remaining = _getRemainingMilliseconds();
    _lastSentRemainingSecond = Duration(milliseconds: remaining).inSeconds;

    FlutterForegroundTask.sendDataToMain(
      MainMessage(
        runId: taskMessage.runId,
        remainingMilliseconds: remaining,
        requestedStatus: requestedStatus,
      ).toJson(),
    );
  }

  void _updateNotification({required TimerStatus status, Duration? remainingDuration}) {
    final taskMessage = _taskMessage;
    final stopwatch = _stopwatch;
    if (taskMessage == null) {
      return;
    }

    final duration =
        remainingDuration ??
        (stopwatch != null
            ? Duration(milliseconds: _getRemainingMilliseconds())
            : Duration(seconds: taskMessage.durationInSeconds));

    unawaited(
      FlutterForegroundTask.updateService(
        notificationTitle: taskMessage.notificationTitle,
        notificationText: duration.toImprovDuration(),
        notificationButtons: [
          if (status == TimerStatus.paused) ...[NotificationButton(id: 'resume', text: Localizer.current.start)],
          if (status == TimerStatus.started) ...[NotificationButton(id: 'pause', text: Localizer.current.pause)],
          NotificationButton(id: 'stop', text: Localizer.current.stop),
        ],
      ),
    );
  }

  Map<int, bool> _buildVibrationMap(int durationInSeconds) {
    return {
      for (var i = 1; i < (durationInSeconds / 60).floor(); i++) ...{60 * i: false},
      if (durationInSeconds > 30) ...{30: false},
      if (durationInSeconds > 10) ...{10: false},
      if (durationInSeconds > 5) ...{5: false},
      if (durationInSeconds > 4) ...{4: false},
      if (durationInSeconds > 3) ...{3: false},
      if (durationInSeconds > 2) ...{2: false},
      if (durationInSeconds > 1) ...{1: false},
    };
  }

  Future<void> vibrate(HapticsType type) async {
    try {
      if ((_taskMessage?.hapticFeedback ?? false) && await Haptics.canVibrate()) {
        await Haptics.vibrate(type);
      }
    } catch (_) {}
  }
}
