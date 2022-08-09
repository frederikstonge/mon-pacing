import 'package:json_annotation/json_annotation.dart';

part 'improvisation.g.dart';

@JsonSerializable()
class Improvisation {
  final int? id;
  final String name;
  final int type;
  final String? category;
  final String? theme;
  final Duration duration;
  final int performers;
  final int pacingId;

  const Improvisation({
    required this.id,
    required this.name,
    required this.type,
    required this.category,
    required this.theme,
    required this.duration,
    required this.performers,
    required this.pacingId,
  });

  factory Improvisation.fromJson(Map<String, dynamic> json) =>
      _$ImprovisationFromJson(json);

  Map<String, dynamic> toJson() => _$ImprovisationToJson(this);
}
