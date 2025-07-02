import 'package:dart_mappable/dart_mappable.dart';

part 'onboarding_state.mapper.dart';

@MappableClass()
class OnboardingState with OnboardingStateMappable {
  final bool onboardingFinished;

  const OnboardingState({this.onboardingFinished = false});
}
