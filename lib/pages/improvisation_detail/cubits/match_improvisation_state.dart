import 'package:dart_mappable/dart_mappable.dart';

import '../../../models/improvisation_model.dart';

part 'match_improvisation_state.mapper.dart';

@MappableClass()
class MatchImprovisationState with MatchImprovisationStateMappable {
  final ImprovisationModel improvisation;
  final bool editMode;
  final int index;

  const MatchImprovisationState({required this.improvisation, required this.editMode, required this.index});
}
