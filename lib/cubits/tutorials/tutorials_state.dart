import 'package:dart_mappable/dart_mappable.dart';

part 'tutorials_state.mapper.dart';

@MappableClass()
class TutorialsState with TutorialsStateMappable {
  final bool pacingsFinished;

  const TutorialsState({this.pacingsFinished = false});
}
