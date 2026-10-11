import 'dart:async';

abstract class IntegrationBase {
  String get integrationId;

  FutureOr<bool> integrationIsValid(String data);
}
