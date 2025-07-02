import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'onboarding_state.dart';

class OnboardingCubit extends HydratedCubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState());

  void finishOnboarding() {
    emit(state.copyWith(onboardingFinished: true));
  }

  @override
  OnboardingState? fromJson(Map<String, dynamic> json) {
    return OnboardingStateMapper.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(OnboardingState state) {
    return state.toMap();
  }
}
