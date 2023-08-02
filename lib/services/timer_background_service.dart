// this will be used as notification channel id
import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../models/improvisation_model.dart';
import '../models/match_model.dart';

const String _notificationChannelId = 'monpacing_timer';
const String _notificationChannelName = 'Mon Pacing';
const String _icon = 'ic_bg_service_small';
const int _notificationId = 888;

MatchModel? match;
ImprovisationModel? improvisation;
Duration? initialDuration;

Timer? timer;
Stopwatch? stopwatch;

Future<void> initializeTimerBackgroundService() async {
  final service = FlutterBackgroundService();

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    _notificationChannelId,
    _notificationChannelName,
    importance: Importance.low,
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();

  if (Platform.isIOS || Platform.isAndroid) {
    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings(_icon),
        iOS: DarwinInitializationSettings(),
      ),
    );
  }

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: false,
      isForegroundMode: true,
      notificationChannelId: _notificationChannelId,
      initialNotificationTitle: 'Mon Pacing',
      foregroundServiceNotificationId: _notificationId,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: false,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}

@pragma('vm:entry-point')
Future<void> onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();

  service.on('startTimer').listen((event) {
    if (event != null) {
      match = MatchModel.fromJson(event['match']);
      improvisation = ImprovisationModel.fromJson(event['improvisation']);
      initialDuration = Duration(milliseconds: event['initialDuration']);

      stopwatch = Stopwatch()..start();
      _createTimer(service);
    }
  });

  service.on('pauseTimer').listen((_) {
    timer!.cancel();
    timer = null;
    stopwatch!.stop();
    service.invoke(
      'paused',
      {
        'match': match!.toJson(),
        'improvisation': improvisation!.toJson(),
        'initialDuration': initialDuration!.inMilliseconds,
        'elapsedTime': stopwatch!.elapsed.inMilliseconds,
      },
    );
  });

  service.on('resumeTimer').listen((_) {
    stopwatch!.start();
    _createTimer(service);
  });

  service.on('stopTimer').listen((_) {
    timer!.cancel();
    timer = null;
    stopwatch!.stop();
    stopwatch = null;
    match = null;
    improvisation = null;
    initialDuration = null;
    service.invoke('stopped');
    service.stopSelf();
  });
}

void _createTimer(ServiceInstance service) {
  unawaited(_onTick(service));
  timer = Timer.periodic(
    const Duration(seconds: 1),
    (_) {
      unawaited(_onTick(service));
    },
  );
}

Future<void> _onTick(ServiceInstance service) async {
  final elapsed = stopwatch!.elapsed;
  debugPrint('Elapsed time: $elapsed');

  service.invoke(
    'running',
    {
      'match': match!.toJson(),
      'improvisation': improvisation!.toJson(),
      'initialDuration': initialDuration!.inMilliseconds,
      'elapsedTime': elapsed.inMilliseconds,
    },
  );

  final remainingTime = initialDuration! - elapsed;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin.show(
    _notificationId,
    'Mon Pacing',
    remainingTime.toString(),
    const NotificationDetails(
      android: AndroidNotificationDetails(
        _notificationChannelId,
        _notificationChannelName,
        icon: _icon,
        ongoing: true,
      ),
      iOS: DarwinNotificationDetails(),
    ),
  );
}
