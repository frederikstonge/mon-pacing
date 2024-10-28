// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_flags_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeatureFlagsStateImpl _$$FeatureFlagsStateImplFromJson(
        Map<String, dynamic> json) =>
    _$FeatureFlagsStateImpl(
      status: $enumDecode(_$FeatureFlagsStatusEnumMap, json['status']),
      enableIntegrations: json['enableIntegrations'] as bool? ?? false,
    );

Map<String, dynamic> _$$FeatureFlagsStateImplToJson(
        _$FeatureFlagsStateImpl instance) =>
    <String, dynamic>{
      'status': _$FeatureFlagsStatusEnumMap[instance.status]!,
      'enableIntegrations': instance.enableIntegrations,
    };

const _$FeatureFlagsStatusEnumMap = {
  FeatureFlagsStatus.initial: 'initial',
  FeatureFlagsStatus.loading: 'loading',
  FeatureFlagsStatus.success: 'success',
  FeatureFlagsStatus.failure: 'failure',
};
