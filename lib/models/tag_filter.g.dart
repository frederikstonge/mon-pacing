// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TagFilterImpl _$$TagFilterImplFromJson(Map<String, dynamic> json) =>
    _$TagFilterImpl(
      tag: json['tag'] as String,
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$$TagFilterImplToJson(_$TagFilterImpl instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'count': instance.count,
    };
