import 'package:dart_mappable/dart_mappable.dart';

import '../../integrations/integration_base.dart';
import 'integrations_status.dart';

part 'integrations_state.mapper.dart';

@MappableClass()
class IntegrationsState with IntegrationsStateMappable {
  final IntegrationsStatus status;
  final List<IntegrationBase> integrations;

  const IntegrationsState({required this.status, this.integrations = const []});
}
