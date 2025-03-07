import 'package:dart_mappable/dart_mappable.dart';

import 'feature_flags_status.dart';

part 'feature_flags_state.mapper.dart';

@MappableClass()
class FeatureFlagsState with FeatureFlagsStateMappable {
  final FeatureFlagsStatus status;
  final bool enableIntegrations;

  const FeatureFlagsState({required this.status, this.enableIntegrations = false});
}
