import 'package:flutter_bloc/flutter_bloc.dart';
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
  final ForegroundService foregroundService;

  TimerCubit({
    required this.settingsCubit,
    required this.toasterService,
    required this.foregroundService,
  }) : super(const TimerState());

  Future<void> initialize() async {
    await _requestPermissions();
    foregroundService.init(taskDataCallback: _onReceiveData);
  }

  Future<void> start(int matchId, String matchName, int improvisationId, int durationIndex, Duration duration) async {
    final hasPermissions = await _requestPermissions();
    if (!hasPermissions) {
      return;
    }

    if (await foregroundService.isRunning) {
      await foregroundService.stop();
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

    await foregroundService.start(path, enableWakelock: settingsCubit.state.enableWakelock);

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
    await foregroundService.stop();
  }

  @override
  Future<void> close() async {
    foregroundService.dispose(taskDataCallback: _onReceiveData);
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
    foregroundService.sendDataToTask(timer.toJson());
  }

  Future<bool> _requestPermissions() async {
    final notificationPermission = await foregroundService.requestNotificationPermission();
    if (!notificationPermission) {
      toasterService.show(
        type: ToastificationType.error,
        title: Localizer.current.toasterGenericError,
        description: Localizer.current.missingNotificationPermissionError,
      );
      return false;
    }

    final ignoreBatteryOptimization = await foregroundService.requestIgnoreBatteryOptimization();
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
