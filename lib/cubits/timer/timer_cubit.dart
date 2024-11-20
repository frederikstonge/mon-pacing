import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:toastification/toastification.dart';

import '../../l10n/localizer.dart';
import '../../models/timer_model.dart';
import '../../models/timer_status.dart';
import '../../services/foreground_service.dart';
import '../../services/toaster_service.dart';
import '../settings/settings_cubit.dart';
import 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  final SettingsCubit settingsCubit;
  final ToasterService toasterService;

  TimerCubit({
    required this.settingsCubit,
    required this.toasterService,
  }) : super(const TimerState());

  Future<void> initialize() async {
    await _requestPermissions();
    initForegroundTask();
    FlutterForegroundTask.initCommunicationPort();
    FlutterForegroundTask.addTaskDataCallback(_onReceiveData);
  }

  Future<bool> start(int matchId, String matchName, int improvisationId, int durationIndex, Duration duration) async {
    final hasPermissions = await _requestPermissions();
    if (!hasPermissions) {
      return false;
    }

    if (await FlutterForegroundTask.isRunningService) {
      await FlutterForegroundTask.stopService();
    }

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

    final result = await FlutterForegroundTask.startService(
      notificationTitle: Localizer.current.notificationTitle,
      notificationText: '',
      callback: startCallback,
    );

    return result.success;
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
    final result = await FlutterForegroundTask.stopService();
    await FlutterForegroundTask.removeData(key: timerDataKey);
    emit(const TimerState());
    return result.success;
  }

  @override
  Future<void> close() async {
    await stop();
    FlutterForegroundTask.removeTaskDataCallback(_onReceiveData);
    return await super.close();
  }

  Future<void> _onReceiveData(dynamic data) async {
    final event = TimerModel.fromJson(data);
    if (Duration(milliseconds: event.remainingMilliseconds).inSeconds <= 0) {
      await stop();
      return;
    }

    if (state.timer != null) {
      await _updateTimer(state.timer!.copyWith(remainingMilliseconds: event.remainingMilliseconds));
    }
  }

  Future<bool> _updateTimer(TimerModel timer) async {
    timer = timer.copyWith(hapticFeedback: settingsCubit.state.enableTimerHapticFeedback);
    emit(TimerState(timer: timer));
    return await FlutterForegroundTask.saveData(key: timerDataKey, value: json.encode(timer.toJson()));
  }

  Future<bool> _requestPermissions() async {
    final notificationPermission = await requestNotificationPermission();
    if (!notificationPermission) {
      toasterService.show(
        type: ToastificationType.error,
        title: Localizer.current.toasterGenericError,
        description: Localizer.current.missingNotificationPermissionError,
      );
      return false;
    }

    final ignoreBatteryOptimization = await requestIgnoreBatteryOptimization();
    if (!ignoreBatteryOptimization) {
      toasterService.show(
        type: ToastificationType.error,
        title: Localizer.current.toasterGenericError,
        description: Localizer.current.missingIgnoreBatteryOptimizationError,
      );
      return false;
    }

    return true;
  }
}
