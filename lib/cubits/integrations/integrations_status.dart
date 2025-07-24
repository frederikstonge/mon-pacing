import 'package:dart_mappable/dart_mappable.dart';

part 'integrations_status.mapper.dart';

@MappableEnum()
enum IntegrationsStatus { initial, loading, success, failure }
