abstract class IntegrationBaseModel {
  final String? integrationId;
  final String? integrationEntityId;
  final String? integrationAdditionalData;

  const IntegrationBaseModel({
    required this.integrationEntityId,
    required this.integrationAdditionalData,
    this.integrationId,
  });
}
