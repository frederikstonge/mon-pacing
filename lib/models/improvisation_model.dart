import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import 'entities/improvisation_entity_model.dart';
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
  }) = _ImprovisationModel;

  factory ImprovisationModel.fromJson(Map<String, dynamic> json) => _$ImprovisationModelFromJson(json);

  factory ImprovisationModel.fromEntity(ImprovisationEntityModel model) => ImprovisationModel(
        id: model.id,
        type: ImprovisationType.values.elementAt(model.type),
        category: model.category,
        theme: model.theme,
        durationsInSeconds: model.durationsInSeconds.split(',').map((e) => int.parse(e)).toList(),
        performers: model.performers,
        notes: model.notes,
        timeBufferInSeconds: model.timeBufferInSeconds,
        huddleTimerInSeconds: model.huddleTimerInSeconds,
      );

  ImprovisationEntityModel toEntity() => ImprovisationEntityModel(
        id: this.id,
        type: type.index,
        category: category,
        theme: theme,
        durationsInSeconds: durationsInSeconds.join(','),
        performers: performers,
        notes: notes,
        timeBufferInSeconds: timeBufferInSeconds,
        huddleTimerInSeconds: huddleTimerInSeconds,
      );
}
