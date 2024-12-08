import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import 'improvisation_type.dart';

part 'improvisation_model.freezed.dart';
part 'improvisation_model.g.dart';

@freezed
@Embedded(ignore: {'copyWith'})
class ImprovisationModel with _$ImprovisationModel {
  const factory ImprovisationModel({
    required int id,
    required ImprovisationType type,
    required String category,
    required String theme,
    required List<int> durationsInSeconds,
    required String performers,
    required String notes,
    @Default(30) int timeBufferInSeconds,
    @Default(30) int huddleTimerInSeconds,
    String? integrationEntityId,
  }) = _ImprovisationModel;

  factory ImprovisationModel.fromJson(Map<String, dynamic> json) => _$ImprovisationModelFromJson(json);
}
