import 'package:dart_mappable/dart_mappable.dart';

import '../../models/improvisation_model.dart';
import 'improvisations_status.dart';

part 'improvisations_state.mapper.dart';

@MappableClass()
class ImprovisationsState with ImprovisationsStateMappable {
  final ImprovisationsStatus status;
  final String? error;
  final List<ImprovisationModel> improvisations;
  final bool hasMore;

  const ImprovisationsState({required this.status, this.error, this.improvisations = const [], this.hasMore = true});
}
