import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../integrations/appimpro_integration.dart';
import '../../integrations/citrus_integration.dart';
import '../../integrations/integration_base.dart';
import '../../integrations/scoreboardussy_integration.dart';
import 'integrations_state.dart';
import 'integrations_status.dart';

class IntegrationsCubit extends Cubit<IntegrationsState> {
  IntegrationsCubit() : super(const IntegrationsState(status: IntegrationsStatus.initial));
  Future<void> initialize() async {
    try {
      emit(state.copyWith(status: IntegrationsStatus.loading));
      final List<IntegrationBase> integrations = [
        CitrusIntegration(client: Dio()),
        ScoreboardussyIntegration(client: Dio()),
        AppImproIntegration(client: Dio()),
      ];
      emit(state.copyWith(status: IntegrationsStatus.success, integrations: integrations));
    } catch (e) {
      emit(state.copyWith(status: IntegrationsStatus.failure));
    }
  }
}
