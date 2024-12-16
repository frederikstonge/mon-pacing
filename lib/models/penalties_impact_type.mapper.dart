// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'penalties_impact_type.dart';

class PenaltiesImpactTypeMapper extends EnumMapper<PenaltiesImpactType> {
  PenaltiesImpactTypeMapper._();

  static PenaltiesImpactTypeMapper? _instance;
  static PenaltiesImpactTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PenaltiesImpactTypeMapper._());
    }
    return _instance!;
  }

  static PenaltiesImpactType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  PenaltiesImpactType decode(dynamic value) {
    switch (value) {
      case 'addPoints':
        return PenaltiesImpactType.addPoints;
      case 'substractPoints':
        return PenaltiesImpactType.substractPoints;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(PenaltiesImpactType self) {
    switch (self) {
      case PenaltiesImpactType.addPoints:
        return 'addPoints';
      case PenaltiesImpactType.substractPoints:
        return 'substractPoints';
    }
  }
}

extension PenaltiesImpactTypeMapperExtension on PenaltiesImpactType {
  String toValue() {
    PenaltiesImpactTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<PenaltiesImpactType>(this) as String;
  }
}
