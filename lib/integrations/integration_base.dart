import 'dart:async';

abstract class IntegrationBase {
  String get integrationId;
  String get featureFlagName;

  FutureOr<bool> integrationIsValid(String data);
}
