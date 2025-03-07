import 'package:dart_mappable/dart_mappable.dart';

import '../../../models/pacing_model.dart';

part 'pacing_detail_state.mapper.dart';

@MappableClass()
class PacingDetailState with PacingDetailStateMappable {
  final bool editMode;
  final PacingModel pacing;

  const PacingDetailState({required this.editMode, required this.pacing});
}
