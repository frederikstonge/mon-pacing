abstract class IntegrationBaseModel {
  final String? integrationId;
  final String? integrationEntityId;
  final String? integrationAdditionalData;
  final int? integrationRestrictMaximumPointPerImprovisation;
  final int? integrationMinNumberOfImprovisations;
  final int? integrationMaxNumberOfImprovisations;
  final List<String>? integrationPenaltyTypes;

  const IntegrationBaseModel({
    required this.integrationEntityId,
    required this.integrationAdditionalData,
    this.integrationId,
    this.integrationRestrictMaximumPointPerImprovisation,
    this.integrationMinNumberOfImprovisations,
    this.integrationMaxNumberOfImprovisations,
    this.integrationPenaltyTypes,
  });
}
