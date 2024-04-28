// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import 'base_model.dart';
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
    required bool enableTimeBuffer,
    required int timeBufferInSeconds,
    required int defaultNumberOfTeams,
    required List<ImprovisationModel> improvisations,
  }) = _PacingModel;

  List<String> get categories => improvisations.where((e) => e.category.isNotEmpty).map((e) => e.category).toList();

  List<String> get themes => improvisations.where((e) => e.theme.isNotEmpty).map((e) => e.theme).toList();

  factory PacingModel.fromJson(Map<String, dynamic> json) => _$PacingModelFromJson(json);
}
