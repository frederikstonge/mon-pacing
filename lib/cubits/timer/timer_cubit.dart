import 'dart:async';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/improvisation_model.dart';
import '../../models/match_model.dart';
import 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  final FlutterBackgroundService _service = FlutterBackgroundService();
  StreamSubscription? _timerRunningSubscription;
  StreamSubscription? _timerPausedSubscription;

  TimerCubit() : super(const TimerState.stopped()) {
    _timerRunningSubscription = FlutterBackgroundService().on('running').listen(_onRunning);
    _timerPausedSubscription = FlutterBackgroundService().on('paused').listen(_onPaused);
    _timerPausedSubscription = FlutterBackgroundService().on('stopped').listen(_onStopped);
  }

  @override
  Future<void> close() async {
    await _timerRunningSubscription?.cancel();
    await _timerPausedSubscription?.cancel();
    await super.close();
  }

  void resume() {
    _service.invoke('resumeTimer');
  }

  void pause() {
    _service.invoke('pauseTimer');
  }

  void stop() {
    _service.invoke('stopTimer');
  }

  void _onRunning(Map<String, dynamic>? data) {
    if (data != null) {
      emit(TimerState.running(
        improvisation: ImprovisationModel.fromJson(data['improvisation']),
        match: MatchModel.fromJson(data['match']),
        initialDuration: Duration(milliseconds: data['initialDuration']),
        elapsedTime: Duration(milliseconds: data['elapsedTime']),
      ));
    }
  }

  void _onPaused(Map<String, dynamic>? data) {
    if (data != null) {
      emit(TimerState.paused(
        improvisation: ImprovisationModel.fromJson(data['improvisation']),
        match: MatchModel.fromJson(data['match']),
        initialDuration: Duration(milliseconds: data['initialDuration']),
        elapsedTime: Duration(milliseconds: data['elapsedTime']),
      ));
    }
  }

  void _onStopped(Map<String, dynamic>? data) {
    emit(const TimerState.stopped());
  }

  Future<void> start(MatchModel match, ImprovisationModel improvisation, Duration initialDuration) async {
    await _service.startService();
    _service.invoke(
      'startTimer',
      {
        'match': match.toJson(),
        'improvisation': improvisation.toJson(),
        'initialDuration': initialDuration.inMilliseconds,
      },
    );
  }
}
