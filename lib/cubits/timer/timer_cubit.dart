import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';
import 'package:uuid/uuid.dart';

import '../../integrations/real_time_match_integration_base.dart';
import '../../l10n/localizer.dart';
import '../../models/integration_base_model.dart';
import '../../models/main_message.dart';
import '../../models/match_model.dart';
import '../../models/task_message.dart';
import '../../models/timer_model.dart';
import '../../models/timer_status.dart';
import '../../services/timer_service.dart';
import '../../services/toaster_service.dart';
import '../integrations/integrations_cubit.dart';
import '../settings/settings_cubit.dart';
import 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  final SettingsCubit settingsCubit;
  final ToasterService toasterService;
  final TimerService timerService;
  final IntegrationsCubit integrationsCubit;
  Future<void> _pendingOperation = Future<void>.value();
  String? _activeRunId;
  String? _sentTaskRunId;
  TimerStatus? _sentTaskStatus;
  int _taskSequence = 0;

  TimerCubit({
    required this.settingsCubit,
    required this.toasterService,
    required this.timerService,
    required this.integrationsCubit,
  }) : super(const TimerState());

  Future<void> initialize() async {
    timerService.initialize(taskDataCallback: _onReceiveData);
    await _requestPermissions();
  }

  Future<void> start(MatchModel match, int improvisationId, int durationIndex, Duration duration) {
    return _serialize(() async {
      final hasPermissions = await _requestPermissions();
      if (!hasPermissions) {
        return;
      }

      final timer = TimerModel(
        durationInSeconds: duration.inSeconds,
        matchId: match.id,
        improvisationId: improvisationId,
        durationIndex: durationIndex,
        remainingMilliseconds: duration.inMilliseconds,
        status: TimerStatus.started,
        hapticFeedback: settingsCubit.state.enableTimerHapticFeedback,
        notificationTitle: match.name,
      );

      final path = '/matches/details/${match.id}?improvisationId=$improvisationId&durationIndex=$durationIndex';
      final runId = const Uuid().v4();

      _activeRunId = null;
      _sentTaskRunId = null;
      _sentTaskStatus = null;
      await timerService.start(path, enableWakelock: settingsCubit.state.enableWakelock);

      _activeRunId = runId;
      _updateTimer(timer: timer, runId: runId);
    });
  }

  Future<void> resume() {
    return _serialize(() async {
      final timer = state.timer;
      final runId = _activeRunId;
      if (timer == null || runId == null) {
        return;
      }

      _updateTimer(
        timer: timer.copyWith(status: TimerStatus.started),
        runId: runId,
      );
    });
  }

  Future<void> pause() {
    return _serialize(() async {
      final timer = state.timer;
      final runId = _activeRunId;
      if (timer == null || runId == null) {
        return;
      }

      _updateTimer(
        timer: timer.copyWith(status: TimerStatus.paused),
        runId: runId,
      );
    });
  }

  Future<void> stop() {
    return _serialize(_stopActiveTimer);
  }

  @override
  void onChange(Change<TimerState> change) {
    final integration = change.nextState.integration ?? change.currentState.integration;

    if (integration != null) {
      try {
        integrationsCubit.state.integrations
            .whereType<RealTimeMatchIntegrationBase>()
            .firstWhereOrNull((i) => i.integrationId == integration.integrationId)
            ?.onTimerUpdate(integration, change.nextState.timer);
      } catch (_) {
        // Handle any errors that occur during the integration update
      }
    }

    super.onChange(change);
  }

  @override
  Future<void> close() async {
    await stop();
    timerService.dispose(taskDataCallback: _onReceiveData);
    return super.close();
  }

  Future<void> _onReceiveData(dynamic data) {
    return _serialize(() async {
      final MainMessage event;
      try {
        event = MainMessageMapper.fromJson(data is String ? data : data.toString());
      } catch (_) {
        return;
      }

      final timer = state.timer;
      if (timer == null || event.runId != _activeRunId) {
        return;
      }

      if (event.requestedStatus == TimerStatus.stopped || event.remainingMilliseconds <= 0) {
        await _stopActiveTimer();
        return;
      }

      final requestedStatus = event.requestedStatus;
      if (requestedStatus != null && requestedStatus != TimerStatus.started && requestedStatus != TimerStatus.paused) {
        return;
      }

      final remainingMilliseconds = event.remainingMilliseconds.clamp(
        0,
        timer.durationInSeconds * Duration.millisecondsPerSecond,
      );
      _updateTimer(
        timer: timer.copyWith(remainingMilliseconds: remainingMilliseconds, status: requestedStatus ?? timer.status),
        runId: event.runId,
        sendToTask: requestedStatus != null,
      );
    });
  }

  void _updateTimer({
    required TimerModel timer,
    IntegrationBaseModel? integration,
    required String runId,
    bool sendToTask = true,
  }) {
    final previousTimer = state.timer;
    if (timer != previousTimer || integration != null) {
      emit(TimerState(timer: timer, integration: integration ?? state.integration));
    }

    if (!sendToTask || (_sentTaskRunId == runId && _sentTaskStatus == timer.status)) {
      return;
    }

    _sentTaskRunId = runId;
    _sentTaskStatus = timer.status;
    final request = TaskMessage(
      runId: runId,
      status: timer.status,
      durationInSeconds: timer.durationInSeconds,
      hapticFeedback: timer.hapticFeedback,
      notificationTitle: timer.notificationTitle,
      sequence: ++_taskSequence,
    );

    timerService.sendDataToTask(request);
  }

  Future<void> _stopActiveTimer() async {
    _activeRunId = null;
    _sentTaskRunId = null;
    _sentTaskStatus = null;
    emit(const TimerState());
    await timerService.stop();
  }

  Future<void> _serialize(Future<void> Function() operation) {
    final result = _pendingOperation.then((_) => operation());
    _pendingOperation = result.then<void>((_) {}, onError: (Object error, StackTrace stackTrace) {});
    return result;
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
