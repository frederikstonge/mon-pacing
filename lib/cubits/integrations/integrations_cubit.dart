import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../integrations/citrus_integration.dart';
import '../../integrations/integration_base.dart';
import '../../integrations/scoreboardussy_integration.dart';
import 'integrations_state.dart';
import 'integrations_status.dart';

class IntegrationsCubit extends Cubit<IntegrationsState> {
  final FirebaseRemoteConfig remoteConfig;
  late StreamSubscription _subscription;

  IntegrationsCubit({required this.remoteConfig}) : super(const IntegrationsState(status: IntegrationsStatus.initial)) {
    _subscription = remoteConfig.onConfigUpdated.listen((data) async {
      await initialize();
    });
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  Future<void> initialize() async {
    try {
      emit(state.copyWith(status: IntegrationsStatus.loading));
      final List<IntegrationBase> integrations = [
        CitrusIntegration(client: Dio()),
        ScoreboardussyIntegration(client: Dio()),
      ];
      await remoteConfig.activate();
      emit(
        state.copyWith(
          status: IntegrationsStatus.success,
          integrations: integrations.where((i) => remoteConfig.getBool(i.featureFlagName)).toList(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: IntegrationsStatus.failure));
    }
  }
}
