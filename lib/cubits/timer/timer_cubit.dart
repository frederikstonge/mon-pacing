import 'dart:convert';
import 'dart:isolate';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

import '../../models/timer_model.dart';
import '../../models/timer_status.dart';
import '../../services/foreground_service.dart';
import '../settings/settings_cubit.dart';
import 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  ReceivePort? _receivePort;
  final SettingsCubit settingsCubit;

  TimerCubit({required this.settingsCubit}) : super(const TimerState());

  Future<void> initialize() async {
    initForegroundTask();
    await requestPermissionForAndroid();

    final isRegistered = _registerReceivePort(FlutterForegroundTask.receivePort);
    if (!isRegistered) {
      return;
    }

    final data = await FlutterForegroundTask.getData<String>(key: timerDataKey);
    if (data == null) {
      return;
    }
    try {
      final timer = TimerModel.fromJson(json.decode(data));
      await _updateTimer(timer);
    } catch (_) {
      return;
    }
  }

  Future<bool> start(int matchId, String matchName, int improvisationId, int durationIndex, Duration duration) async {
    final timer = TimerModel(
      duration: duration,
      matchId: matchId,
      improvisationId: improvisationId,
      durationIndex: durationIndex,
      remainingMilliseconds: duration.inMilliseconds,
      status: TimerStatus.started,
      hapticFeedback: settingsCubit.state.enableTimerHapticFeedback,
      notificationTitle: matchName,
    );

    await _updateTimer(timer);

    if (await FlutterForegroundTask.isRunningService) {
      return await FlutterForegroundTask.restartService();
    } else {
      return await FlutterForegroundTask.startService(
        notificationTitle: settingsCubit.localizer.notificationTitle,
        notificationText: '',
        callback: startCallback,
      );
    }
  }

  Future<bool> resume() async {
    final data = await FlutterForegroundTask.getData<String>(key: timerDataKey);
    if (data == null) {
      emit(const TimerState());
      return false;
    }

    final timer = TimerModel.fromJson(json.decode(data)).copyWith(status: TimerStatus.started);
    return await _updateTimer(timer);
  }

  Future<bool> pause() async {
    final data = await FlutterForegroundTask.getData<String>(key: timerDataKey);
    if (data == null) {
      emit(const TimerState());
      return false;
    }

    final timer = TimerModel.fromJson(json.decode(data)).copyWith(status: TimerStatus.paused);
    return await _updateTimer(timer);
  }

  Future<bool> stop() async {
    await FlutterForegroundTask.removeData(key: timerDataKey);
    emit(const TimerState());
    return await FlutterForegroundTask.stopService();
  }

  @override
  Future<void> close() {
    _closeReceivePort();
    return super.close();
  }

  void _onReceiveData(dynamic data) {
    final event = TimerModel.fromJson(data);
    if (event.remainingMilliseconds <= 0) {
      stop();
      return;
    }
    _updateTimer(event);
  }

  bool _registerReceivePort(ReceivePort? newReceivePort) {
    if (newReceivePort == null) {
      return false;
    }

    _closeReceivePort();

    _receivePort = newReceivePort;
    _receivePort?.listen(_onReceiveData);

    return _receivePort != null;
  }

  void _closeReceivePort() {
    _receivePort?.close();
    _receivePort = null;
  }

  Future<bool> _updateTimer(TimerModel timer) async {
    timer = timer.copyWith(hapticFeedback: settingsCubit.state.enableTimerHapticFeedback);
    emit(TimerState(timer: timer));
    return await FlutterForegroundTask.saveData(key: timerDataKey, value: json.encode(timer.toJson()));
  }
}
