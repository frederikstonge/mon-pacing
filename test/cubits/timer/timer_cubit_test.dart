import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mon_pacing/cubits/integrations/integrations_cubit.dart';
import 'package:mon_pacing/cubits/settings/settings_cubit.dart';
import 'package:mon_pacing/cubits/settings/settings_state.dart';
import 'package:mon_pacing/cubits/timer/timer_cubit.dart';
import 'package:mon_pacing/models/main_message.dart';
import 'package:mon_pacing/models/match_model.dart';
import 'package:mon_pacing/models/task_message.dart';
import 'package:mon_pacing/models/theme_type.dart';
import 'package:mon_pacing/models/timer_status.dart';
import 'package:mon_pacing/services/timer_service.dart';
import 'package:mon_pacing/services/toaster_service.dart';

class _MockSettingsCubit extends Mock implements SettingsCubit {}

class _FakeSettingsCubit extends Mock implements SettingsCubit {
  @override
  SettingsState get state => const SettingsState(language: 'en', theme: ThemeType.light);
}

class _MockToasterService extends Mock implements ToasterService {}

class _MockIntegrationsCubit extends Mock implements IntegrationsCubit {}

class _TimerService extends TimerService {
  final notificationPermission = Completer<bool>();
  final List<TaskMessage> messages = [];
  Function(Object data)? taskDataCallback;
  int startCount = 0;
  int stopCount = 0;

  @override
  void initialize({required Function(Object data) taskDataCallback}) {
    this.taskDataCallback = taskDataCallback;
  }

  @override
  Future<bool> requestNotificationPermission() => notificationPermission.future;

  @override
  Future<bool> requestIgnoreBatteryOptimization() async => true;

  @override
  Future<void> start(String initialRoute, {bool enableWakelock = false}) async {
    startCount++;
  }

  @override
  void sendDataToTask(TaskMessage data) {
    messages.add(data);
  }

  @override
  void dispose({required Function(Object data) taskDataCallback}) {}

  @override
  Future<void> stop() async {
    stopCount++;
  }
}

void main() {
  test('registers the task callback before waiting for permissions', () async {
    final timerService = _TimerService();
    final cubit = TimerCubit(
      settingsCubit: _MockSettingsCubit(),
      toasterService: _MockToasterService(),
      timerService: timerService,
      integrationsCubit: _MockIntegrationsCubit(),
    );

    final initialization = cubit.initialize();

    expect(timerService.taskDataCallback, isNotNull);

    timerService.notificationPermission.complete(true);
    await initialization;
    await cubit.close();
  });

  test('sends task messages for timer status changes, not remaining time updates', () async {
    final timerService = _TimerService()..notificationPermission.complete(true);
    final settingsCubit = _FakeSettingsCubit();
    final cubit = TimerCubit(
      settingsCubit: settingsCubit,
      toasterService: _MockToasterService(),
      timerService: timerService,
      integrationsCubit: _MockIntegrationsCubit(),
    );
    await cubit.initialize();
    await cubit.start(_match, 10, 0, const Duration(minutes: 2));
    final runId = timerService.messages.single.runId;

    await timerService.taskDataCallback!(MainMessage(runId: runId, remainingMilliseconds: 119000).toJson());
    expect(timerService.messages, hasLength(1));
    expect(cubit.state.timer?.remainingMilliseconds, 119000);

    await timerService.taskDataCallback!(
      MainMessage(runId: runId, remainingMilliseconds: 118000, requestedStatus: TimerStatus.paused).toJson(),
    );
    expect(timerService.messages, hasLength(2));
    expect(timerService.messages.last.status, TimerStatus.paused);

    await timerService.taskDataCallback!(MainMessage(runId: runId, remainingMilliseconds: 117000).toJson());
    expect(timerService.messages, hasLength(2));

    await cubit.close();
  });

  test('sends a fresh task message when restarting with unchanged timer values', () async {
    final timerService = _TimerService()..notificationPermission.complete(true);
    final settingsCubit = _FakeSettingsCubit();
    final cubit = TimerCubit(
      settingsCubit: settingsCubit,
      toasterService: _MockToasterService(),
      timerService: timerService,
      integrationsCubit: _MockIntegrationsCubit(),
    );
    final match = _match;

    await cubit.initialize();
    await cubit.start(match, 10, 0, const Duration(minutes: 2));
    await cubit.start(match, 10, 0, const Duration(minutes: 2));

    expect(timerService.startCount, 2);
    expect(timerService.messages, hasLength(2));
    expect(timerService.messages[0].runId, isNot(timerService.messages[1].runId));

    await timerService.taskDataCallback!(
      MainMessage(runId: timerService.messages[0].runId, remainingMilliseconds: 1000).toJson(),
    );
    expect(cubit.state.timer?.remainingMilliseconds, const Duration(minutes: 2).inMilliseconds);

    await cubit.close();
  });
}

final _match = MatchModel(
  id: 1,
  name: 'Test match',
  createdDate: null,
  modifiedDate: null,
  teams: const [],
  improvisations: const [],
  penalties: const [],
  points: const [],
);
