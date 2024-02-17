import 'package:freezed_annotation/freezed_annotation.dart';

import 'improvisation_type.dart';

part 'improvisation_model.freezed.dart';
part 'improvisation_model.g.dart';

@freezed
class ImprovisationModel with _$ImprovisationModel {
  const factory ImprovisationModel({
    required int id,
    required int order,
    required ImprovisationType type,
    required String category,
    required String theme,
    required List<Duration> durations,
    required int? performers,
    String? notes,
  }) = _ImprovisationModel;

  factory ImprovisationModel.fromJson(Map<String, dynamic> json) =>
      _$ImprovisationModelFromJson(json);
}
