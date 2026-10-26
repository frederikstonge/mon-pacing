import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mon_pacing/cubits/integrations/integrations_cubit.dart';
import 'package:mon_pacing/cubits/settings/settings_cubit.dart';
import 'package:mon_pacing/cubits/timer/timer_cubit.dart';
import 'package:mon_pacing/services/timer_service.dart';
import 'package:mon_pacing/services/toaster_service.dart';

class _MockSettingsCubit extends Mock implements SettingsCubit {}

class _MockToasterService extends Mock implements ToasterService {}

class _MockIntegrationsCubit extends Mock implements IntegrationsCubit {}

class _TimerService extends TimerService {
  final notificationPermission = Completer<bool>();
  Function(Object data)? taskDataCallback;

  @override
  void initialize({required Function(Object data) taskDataCallback}) {
    this.taskDataCallback = taskDataCallback;
  }

  @override
  Future<bool> requestNotificationPermission() => notificationPermission.future;

  @override
  Future<bool> requestIgnoreBatteryOptimization() async => true;

  @override
  void dispose({required Function(Object data) taskDataCallback}) {}

  @override
  Future<void> stop() async {}
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
}
