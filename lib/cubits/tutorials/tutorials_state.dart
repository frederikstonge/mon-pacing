import 'package:dart_mappable/dart_mappable.dart';

part 'tutorials_state.mapper.dart';

@MappableClass()
class TutorialsState with TutorialsStateMappable {
  final bool addPacingFinished;
  final bool startMatchFinished;
  final bool addImprovisationFinished;
  final bool improvisationFinished;

  const TutorialsState({
    this.addPacingFinished = false,
    this.startMatchFinished = false,
    this.addImprovisationFinished = false,
    this.improvisationFinished = false,
  });
}
