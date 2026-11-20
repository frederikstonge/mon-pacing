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
  static const _retryInterval = Duration(milliseconds: 250);
  static const _maxSendAttempts = 40;

  Function(Object data)? _taskDataCallback;
  Timer? _retryTimer;
  _PendingTaskMessage? _pendingMessage;

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

    final previousCallback = _taskDataCallback;
    if (previousCallback != null) {
      FlutterForegroundTask.removeTaskDataCallback(previousCallback);
    }

    _taskDataCallback = (data) {
      _handleAcknowledgement(data);
      taskDataCallback(data);
    };
    FlutterForegroundTask.addTaskDataCallback(_taskDataCallback!);
  }

  void dispose({required Function(Object data) taskDataCallback}) {
    final callback = _taskDataCallback;
    if (callback != null) {
      FlutterForegroundTask.removeTaskDataCallback(callback);
      _taskDataCallback = null;
    }
    _cancelRetries();
  }

  void sendDataToTask(TaskMessage data) {
    _cancelRetries();

    final pending = _PendingTaskMessage(data);
    _pendingMessage = pending;
    _sendPending(pending);
    _retryTimer = Timer.periodic(_retryInterval, (_) => _sendPending(pending));
  }

  void _sendPending(_PendingTaskMessage pending) {
    if (!identical(_pendingMessage, pending)) {
      return;
    }

    if (pending.attempts >= _maxSendAttempts) {
      _cancelRetries();
      return;
    }

    pending.attempts++;
    FlutterForegroundTask.sendDataToTask(pending.json);
  }

  void _handleAcknowledgement(Object data) {
    final pending = _pendingMessage;
    if (pending == null) {
      return;
    }

    final MainMessage message;
    try {
      message = MainMessageMapper.fromJson(data is String ? data : data.toString());
    } catch (_) {
      return;
    }

    if (message.runId == pending.message.runId && message.acknowledgedSequence == pending.message.sequence) {
      _cancelRetries();
    }
  }

  void _cancelRetries() {
    _retryTimer?.cancel();
    _retryTimer = null;
    _pendingMessage = null;
  }

  Future<bool> requestNotificationPermission() async {
    if (!Platform.isAndroid) {
      return true;
    }

    final permission = await FlutterForegroundTask.checkNotificationPermission();
    if (permission == NotificationPermission.granted) {
      return true;
    }

    return await FlutterForegroundTask.requestNotificationPermission() == NotificationPermission.granted;
  }

  Future<bool> requestIgnoreBatteryOptimization() async {
    if (!Platform.isAndroid || await FlutterForegroundTask.isIgnoringBatteryOptimizations) {
      return true;
    }

    return FlutterForegroundTask.requestIgnoreBatteryOptimization();
  }

  Future<void> start(String initialRoute, {bool enableWakelock = false}) async {
    await _stopRunningService();

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
      try {
        await WakelockPlus.enable();
      } catch (_) {
        await _stopRunningService();
        rethrow;
      }
    }
  }

  Future<void> stop() => _stopRunningService();

  Future<void> _stopRunningService() async {
    _cancelRetries();

    if (await FlutterForegroundTask.isRunningService) {
      await FlutterForegroundTask.stopService();
    }

    await WakelockPlus.disable();
  }
}

class _PendingTaskMessage {
  final TaskMessage message;
  late final String json = message.toJson();
  int attempts = 0;

  _PendingTaskMessage(this.message);
}

class TimerTaskHandler extends TaskHandler {
  static const _tickInterval = Duration(milliseconds: 100);

  Stopwatch? _stopwatch;
  Timer? _timer;
  TaskMessage? _taskMessage;
  Set<int> _pendingVibrations = const {};
  int? _lastSentSecond;
  int _lastSequence = -1;
  bool _handlingTick = false;

  @override
  Future<void> onStart(DateTime timestamp, TaskStarter starter) async {}

  @override
  Future<void> onRepeatEvent(DateTime timestamp) async {}

  @override
  void onReceiveData(dynamic data) {
    final TaskMessage message;
    try {
      message = TaskMessageMapper.fromJson(data is String ? data : data.toString());
    } catch (_) {
      return;
    }

    if (message.sequence < _lastSequence) {
      _sendSyncToMain();
      return;
    }

    final current = _taskMessage;
    if (current != null && message.runId == current.runId && message.sequence == _lastSequence) {
      _sendSyncToMain();
      return;
    }

    _lastSequence = message.sequence;
    if (current == null || message.runId != current.runId) {
      _startRun(message);
      return;
    }

    _taskMessage = message;
    _setRunning(message.status == TimerStatus.started);
    if (message.status == TimerStatus.stopped) {
      _finishRun();
      return;
    }

    _sendSyncToMain();
    _updateNotification(message.status);
  }

  @override
  void onNotificationButtonPressed(String id) {
    switch (id) {
      case 'resume':
        _requestStatus(TimerStatus.started);
      case 'pause':
        _requestStatus(TimerStatus.paused);
      case 'stop':
        _requestStatus(TimerStatus.stopped);
    }
  }

  @override
  Future<void> onDestroy(DateTime timestamp, bool isTimeout) async {
    _timer?.cancel();
    _timer = null;
    _stopwatch?.stop();
    _stopwatch = null;
    _taskMessage = null;
    _pendingVibrations = const {};
    _lastSentSecond = null;
    _lastSequence = -1;
    _handlingTick = false;
  }

  void _startRun(TaskMessage message) {
    _timer?.cancel();
    _stopwatch?.stop();
    _stopwatch = Stopwatch();
    _taskMessage = message;
    _pendingVibrations = _buildVibrationSeconds(message.durationInSeconds);
    _lastSentSecond = null;

    if (message.status == TimerStatus.started) {
      _stopwatch!.start();
    }

    if (message.status == TimerStatus.stopped) {
      _finishRun();
      return;
    }

    _timer = Timer.periodic(_tickInterval, _onTick);
    _sendSyncToMain();
    _updateNotification(message.status);
  }

  void _requestStatus(TimerStatus status) {
    final message = _taskMessage;
    if (message == null) {
      return;
    }

    if (status == TimerStatus.stopped) {
      _finishRun();
      return;
    }

    _taskMessage = message.copyWith(status: status);
    _setRunning(status == TimerStatus.started);
    _sendSyncToMain(requestedStatus: status);
    _updateNotification(status);
  }

  void _setRunning(bool running) {
    final stopwatch = _stopwatch;
    if (stopwatch == null || stopwatch.isRunning == running) {
      return;
    }

    running ? stopwatch.start() : stopwatch.stop();
  }

  void _finishRun() {
    final message = _taskMessage;
    final stopwatch = _stopwatch;
    if (message == null) {
      return;
    }

    stopwatch?.stop();
    _timer?.cancel();
    _timer = null;

    _sendMainMessage(
      MainMessage(
        runId: message.runId,
        remainingMilliseconds: _remainingMilliseconds(),
        status: TimerStatus.stopped,
        requestedStatus: TimerStatus.stopped,
      ),
    );
  }

  void _onTick(Timer timer) {
    if (_handlingTick) {
      return;
    }

    final message = _taskMessage;
    final stopwatch = _stopwatch;
    if (message == null || stopwatch == null || (!stopwatch.isRunning && message.status == TimerStatus.paused)) {
      return;
    }

    _handlingTick = true;
    try {
      final remaining = _remainingMilliseconds();
      if (remaining <= 0) {
        _finishRun();
        return;
      }

      final duration = Duration(milliseconds: remaining);
      final remainingSecond = duration.inSeconds;

      if (_pendingVibrations.remove(remainingSecond)) {
        unawaited(_vibrate());
      }

      if (remainingSecond != _lastSentSecond) {
        _sendMainMessage(MainMessage(runId: message.runId, remainingMilliseconds: remaining, status: message.status));
        _lastSentSecond = remainingSecond;
      }

      if (timer.tick % 10 == 0) {
        _updateNotification(message.status, duration);
      }
    } finally {
      _handlingTick = false;
    }
  }

  int _remainingMilliseconds() {
    final message = _taskMessage;
    final stopwatch = _stopwatch;
    if (message == null || stopwatch == null) {
      return 0;
    }

    final total = message.durationInSeconds * Duration.millisecondsPerSecond;
    return (total - stopwatch.elapsedMilliseconds).clamp(0, total);
  }

  void _sendSyncToMain({TimerStatus? requestedStatus}) {
    final message = _taskMessage;
    if (message == null) {
      return;
    }

    final remaining = _remainingMilliseconds();
    _lastSentSecond = Duration(milliseconds: remaining).inSeconds;
    _sendMainMessage(
      MainMessage(
        runId: message.runId,
        remainingMilliseconds: remaining,
        status: message.status,
        requestedStatus: requestedStatus,
        acknowledgedSequence: _lastSequence,
      ),
    );
  }

  void _sendMainMessage(MainMessage message) {
    FlutterForegroundTask.sendDataToMain(message.toJson());
  }

  void _updateNotification(TimerStatus status, [Duration? remaining]) {
    final message = _taskMessage;
    if (message == null) {
      return;
    }

    final duration = remaining ?? Duration(milliseconds: _remainingMilliseconds());
    unawaited(
      FlutterForegroundTask.updateService(
        notificationTitle: message.notificationTitle,
        notificationText: duration.toImprovDuration(),
        notificationButtons: [
          if (status == TimerStatus.paused) NotificationButton(id: 'resume', text: Localizer.current.start),
          if (status == TimerStatus.started) NotificationButton(id: 'pause', text: Localizer.current.pause),
          NotificationButton(id: 'stop', text: Localizer.current.stop),
        ],
      ),
    );
  }

  Set<int> _buildVibrationSeconds(int durationInSeconds) {
    return {
      for (var minute = 1; minute < (durationInSeconds / 60).floor(); minute++) minute * 60,
      if (durationInSeconds > 30) 30,
      if (durationInSeconds > 10) 10,
      if (durationInSeconds > 5) 5,
      if (durationInSeconds > 4) 4,
      if (durationInSeconds > 3) 3,
      if (durationInSeconds > 2) 2,
      if (durationInSeconds > 1) 1,
    };
  }

  Future<void> _vibrate() async {
    if (!(_taskMessage?.hapticFeedback ?? false)) {
      return;
    }

    try {
      if (await Haptics.canVibrate()) {
        await Haptics.vibrate(HapticsType.light);
      }
    } catch (_) {
      // Vibration is best-effort and must not interrupt the timer.
    }
  }
}
