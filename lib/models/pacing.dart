import 'package:json_annotation/json_annotation.dart';

part 'pacing.g.dart';

@JsonSerializable()
class Pacing {
  final int? id;
  final String name;
  final DateTime createdDate;
  final DateTime? modifiedDate;

  const Pacing({
    required this.id,
    required this.name,
    required this.createdDate,
    required this.modifiedDate,
  });

  factory Pacing.fromJson(Map<String, dynamic> json) => _$PacingFromJson(json);

  Map<String, dynamic> toJson() => _$PacingToJson(this);
}
