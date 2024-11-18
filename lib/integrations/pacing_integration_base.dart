import 'dart:async';

import '../models/pacing_model.dart';
import 'integration_base.dart';

abstract class PacingIntegrationBase extends IntegrationBase {
  FutureOr<PacingModel> getPacing(String data);
}
