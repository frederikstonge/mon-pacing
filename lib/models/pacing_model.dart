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
  @Implements<BaseModel>()
  const factory PacingModel({
    required int id,
    required String name,
    required DateTime? createdDate,
    required DateTime? modifiedDate,
    required bool enableTimeBuffer,
    required int timeBufferInSeconds,
    required int defaultNumberOfTeams,
    required List<ImprovisationModel> improvisations,
  }) = _PacingModel;

  factory PacingModel.fromJson(Map<String, dynamic> json) => _$PacingModelFromJson(json);
}
