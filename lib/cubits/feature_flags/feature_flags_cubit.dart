import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'feature_flags_name.dart';
import 'feature_flags_state.dart';
import 'feature_flags_status.dart';

class FeatureFlagsCubit extends Cubit<FeatureFlagsState> {
  final FirebaseRemoteConfig remoteConfig;
  late StreamSubscription _subscription;
  FeatureFlagsCubit({
    required this.remoteConfig,
  }) : super(FeatureFlagsState(status: FeatureFlagsStatus.initial)) {
    _subscription = remoteConfig.onConfigUpdated.listen((data) async {
      await init();
    });
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  Future<void> init() async {
    try {
      emit(state.copyWith(status: FeatureFlagsStatus.loading));
      await remoteConfig.fetchAndActivate();
      emit(state.copyWith(
        status: FeatureFlagsStatus.success,
        enableIntegrations: remoteConfig.getBool(FeatureFlagsName.enableIntegrations),
      ));
    } catch (e) {
      emit(state.copyWith(status: FeatureFlagsStatus.failure));
    }
  }
}
