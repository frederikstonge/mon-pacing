import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:toastification/toastification.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

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

  Future<void> start(int matchId, String matchName, int improvisationId, int durationIndex, Duration duration) async {
    final hasPermissions = await _requestPermissions();
    if (!hasPermissions) {
      return;
    }

    if (await FlutterForegroundTask.isRunningService) {
      await FlutterForegroundTask.stopService();
    }

    final timer = TimerModel(
      durationInSeconds: duration.inSeconds,
      matchId: matchId,
      improvisationId: improvisationId,
      durationIndex: durationIndex,
      remainingMilliseconds: duration.inMilliseconds,
      status: TimerStatus.started,
      hapticFeedback: settingsCubit.state.enableTimerHapticFeedback,
      notificationTitle: matchName,
    );

    final path = '/matches/details/$matchId?improvisationId=$improvisationId&durationIndex=$durationIndex';

    await FlutterForegroundTask.startService(
      notificationTitle: Localizer.current.notificationTitle,
      notificationText: '',
      notificationInitialRoute: path,
      notificationIcon: NotificationIcon(metaDataName: 'com.stongef.monpacing.NOTIFICATION_ICON'),
      callback: startCallback,
    );

    if (settingsCubit.state.enableWakelock) {
      await WakelockPlus.enable();
    }

    _updateTimer(timer);
  }

  void resume() {
    final timer = state.timer!.copyWith(status: TimerStatus.started);
    _updateTimer(timer);
  }

  void pause() {
    final timer = state.timer!.copyWith(status: TimerStatus.paused);
    _updateTimer(timer);
  }

  Future<void> stop() async {
    emit(const TimerState());
    await FlutterForegroundTask.stopService();
    await WakelockPlus.disable();
  }

  @override
  Future<void> close() async {
    FlutterForegroundTask.removeTaskDataCallback(_onReceiveData);
    await stop();
    return await super.close();
  }

  Future<void> _onReceiveData(dynamic data) async {
    final event = TimerModelMapper.fromJson(data);
    if (state.timer != null) {
      _updateTimer(state.timer!.copyWith(remainingMilliseconds: event.remainingMilliseconds));
    }

    if (event.requestedStatus != null) {
      switch (event.requestedStatus) {
        case TimerStatus.started:
          resume();
          return;
        case TimerStatus.paused:
          pause();
          return;
        default:
          break;
      }
    }

    final remainingDuration = Duration(milliseconds: event.remainingMilliseconds);
    if (remainingDuration.inSeconds <= 0) {
      await stop();
      return;
    }
  }

  void _updateTimer(TimerModel timer) {
    emit(TimerState(timer: timer));
    FlutterForegroundTask.sendDataToTask(timer.toJson());
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
