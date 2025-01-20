import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../l10n/localizer.dart';
import '../../models/main_message.dart';
import '../../models/task_message.dart';
import '../../models/timer_model.dart';
import '../../models/timer_status.dart';
import '../../services/timer_service.dart';
import '../../services/toaster_service.dart';
import '../settings/settings_cubit.dart';
import 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  final SettingsCubit settingsCubit;
  final ToasterService toasterService;
  final TimerService timerService;

  TimerCubit({
    required this.settingsCubit,
    required this.toasterService,
    required this.timerService,
  }) : super(const TimerState());

  Future<void> initialize() async {
    await _requestPermissions();
    timerService.initialize(taskDataCallback: _onReceiveData);
  }

  Future<void> start(int matchId, String matchName, int improvisationId, int durationIndex, Duration duration) async {
    final hasPermissions = await _requestPermissions();
    if (!hasPermissions) {
      return;
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

    await timerService.start(path, enableWakelock: settingsCubit.state.enableWakelock);

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
    await timerService.stop();
  }

  @override
  Future<void> close() async {
    timerService.dispose(taskDataCallback: _onReceiveData);
    await stop();
    return await super.close();
  }

  Future<void> _onReceiveData(dynamic data) async {
    final event = MainMessageMapper.fromJson(data);
    if (state.timer != null) {
      final remainingDuration = Duration(milliseconds: event.remainingMilliseconds);
      if (event.requestedStatus == TimerStatus.stopped || remainingDuration.inSeconds <= 0) {
        await stop();
        return;
      }

      _updateTimer(state.timer!.copyWith(
        remainingMilliseconds: event.remainingMilliseconds,
        status: event.requestedStatus ?? state.timer!.status,
      ));
    }
  }

  void _updateTimer(TimerModel timer) {
    if (timer != state.timer) {
      emit(TimerState(timer: timer));

      final request = TaskMessage(
        status: timer.status,
        durationInSeconds: timer.durationInSeconds,
        hapticFeedback: timer.hapticFeedback,
        notificationTitle: timer.notificationTitle,
      );

      timerService.sendDataToTask(request);
    }
  }

  Future<bool> _requestPermissions() async {
    final notificationPermission = await timerService.requestNotificationPermission();
    if (!notificationPermission) {
      toasterService.show(
        type: ToastificationType.error,
        title: Localizer.current.toasterGenericError,
        description: Localizer.current.missingNotificationPermissionError,
      );
      return false;
    }

    final ignoreBatteryOptimization = await timerService.requestIgnoreBatteryOptimization();
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
