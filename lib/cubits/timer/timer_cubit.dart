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

    if (await FlutterForegroundTask.isRunningService) {
      final data = await FlutterForegroundTask.getData<String>(key: timerDataKey);
      if (data == null) {
        return;
      }
      try {
        final timer = TimerModel.fromJson(json.decode(data));
        if (timer.remainingMilliseconds > 0) {
          await _updateTimer(timer);
        } else {
          await stop();
        }
      } catch (_) {
        return;
      }
    } else {
      await FlutterForegroundTask.removeData(key: timerDataKey);
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
    final timer = state.timer!.copyWith(status: TimerStatus.started);
    return await _updateTimer(timer);
  }

  Future<bool> pause() async {
    final timer = state.timer!.copyWith(status: TimerStatus.paused);
    return await _updateTimer(timer);
  }

  Future<bool> stop() async {
    await FlutterForegroundTask.removeData(key: timerDataKey);
    final result = await FlutterForegroundTask.stopService();
    emit(const TimerState());
    return result;
  }

  @override
  Future<void> close() async {
    _closeReceivePort();
    await stop();
    return await super.close();
  }

  Future<void> _onReceiveData(dynamic data) async {
    final event = TimerModel.fromJson(data);
    if (event.remainingMilliseconds <= 0) {
      await stop();
      return;
    }

    if (state.timer != null) {
      await _updateTimer(state.timer!.copyWith(remainingMilliseconds: event.remainingMilliseconds));
    }
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
