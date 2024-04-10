import 'dart:convert';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

import '../../l10n/app_localizations.dart';
import '../../services/foreground_service/foreground_service_init.dart';
import '../../services/foreground_service/foreground_service_task_handler.dart';
import '../../services/foreground_service/timer_status_model.dart';
import '../settings/settings_cubit.dart';
import 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  ReceivePort? _receivePort;
  final SettingsCubit settingsCubit;
  late S localizer;

  TimerCubit({required this.settingsCubit}) : super(const TimerState());

  Future<void> initialize() async {
    settingsCubit.stream.listen((event) async {
      localizer = await S.delegate.load(Locale(event.language));
    });

    localizer = await S.delegate.load(Locale(settingsCubit.state.language));

    initForegroundTask();
    await requestPermissionForAndroid();

    final isRegistered = _registerReceivePort(FlutterForegroundTask.receivePort);
    if (!isRegistered) {
      return;
    }

    final data = await FlutterForegroundTask.getData<String>(key: timerStatusDataKey);
    if (data == null) {
      return;
    }
    try {
      final timerStatus = TimerStatusModel.fromJson(json.decode(data));
      await _updateTimerStatus(timerStatus);
    } catch (_) {
      return;
    }
  }

  Future<bool> start(int matchId, String matchName, int improvisationId, int durationIndex, Duration duration) async {
    final timerStatus = TimerStatusModel(
      duration: duration,
      matchId: matchId,
      improvisationId: improvisationId,
      durationIndex: durationIndex,
      remainingMilliseconds: duration.inMilliseconds,
      status: TimerStatus.started,
      hapticFeedback: false,
      notificationTitle: matchName,
    );

    await _updateTimerStatus(timerStatus);

    if (await FlutterForegroundTask.isRunningService) {
      return await FlutterForegroundTask.restartService();
    } else {
      return await FlutterForegroundTask.startService(
        notificationTitle: localizer.notificationTitle,
        notificationText: '',
        callback: startCallback,
      );
    }
  }

  Future<bool> resume() async {
    final data = await FlutterForegroundTask.getData<String>(key: timerStatusDataKey);
    if (data == null) {
      emit(const TimerState());
      return false;
    }

    final timerStatus = TimerStatusModel.fromJson(json.decode(data)).copyWith(status: TimerStatus.started);
    return await _updateTimerStatus(timerStatus);
  }

  Future<bool> pause() async {
    final data = await FlutterForegroundTask.getData<String>(key: timerStatusDataKey);
    if (data == null) {
      emit(const TimerState());
      return false;
    }

    final timerStatus = TimerStatusModel.fromJson(json.decode(data)).copyWith(status: TimerStatus.paused);
    return await _updateTimerStatus(timerStatus);
  }

  Future<bool> stop() async {
    await FlutterForegroundTask.removeData(key: timerStatusDataKey);
    emit(const TimerState());
    return await FlutterForegroundTask.stopService();
  }

  @override
  Future<void> close() {
    _closeReceivePort();
    return super.close();
  }

  void _onReceiveData(dynamic data) {
    final event = TimerStatusModel.fromJson(data);
    _updateTimerStatus(event);
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

  Future<bool> _updateTimerStatus(TimerStatusModel timerStatus) async {
    emit(TimerState(timerStatus: timerStatus));
    return await FlutterForegroundTask.saveData(key: timerStatusDataKey, value: json.encode(timerStatus.toJson()));
  }
}
