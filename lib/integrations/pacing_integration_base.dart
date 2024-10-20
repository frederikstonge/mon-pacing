import '../models/pacing_model.dart';
import 'integration_base.dart';

abstract class PacingIntegrationBase extends IntegrationBase {
  PacingModel getPacing(String data);
}
