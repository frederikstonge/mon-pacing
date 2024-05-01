// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:objectbox/objectbox.dart';

import 'base_model.dart';
import 'entities/pacing_entity_model.dart';
import 'improvisation_model.dart';
import 'improvisation_type.dart';

part 'pacing_model.freezed.dart';
part 'pacing_model.g.dart';

@freezed
@collection
class PacingModel with _$PacingModel implements BaseModel {
  const PacingModel._();

  @Implements<BaseModel>()
  const factory PacingModel({
    required int id,
    @index required String name,
    @index required DateTime? createdDate,
    required DateTime? modifiedDate,
    required List<ImprovisationModel> improvisations,
    @Default(2) int defaultNumberOfTeams,
  }) = _PacingModel;

  factory PacingModel.fromJson(Map<String, dynamic> json) => _$PacingModelFromJson(json);

  factory PacingModel.fromEntity(PacingEntityModel model) => PacingModel(
        id: model.id,
        name: model.name,
        createdDate: model.createdDate,
        modifiedDate: model.modifiedDate,
        improvisations: model.improvisations.map((e) => ImprovisationModel.fromEntity(e)).toList(),
        defaultNumberOfTeams: model.defaultNumberOfTeams,
      );

  PacingEntityModel toEntity() => PacingEntityModel(
        id: this.id,
        name: name,
        createdDate: createdDate,
        modifiedDate: modifiedDate,
        improvisations: ToMany(items: improvisations.map((e) => e.toEntity()).toList()),
        defaultNumberOfTeams: defaultNumberOfTeams,
      );
}
