import '../integrations/citrus_integration.dart';
import '../integrations/integration_base.dart';

class IntegrationService {
  final List<IntegrationBase> integrations = [];

  IntegrationService() {
    integrations.add(CitrusIntegration());
  }

  T getIntegration<T extends IntegrationBase>(String integrationId) {
    return integrations.firstWhere((integration) => integration.integrationId == integrationId) as T;
  }

  List<T> getIntegrationsByType<T extends IntegrationBase>() {
    return integrations.whereType<T>().toList();
  }
}
