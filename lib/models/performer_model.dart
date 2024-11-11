import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'performer_model.freezed.dart';
part 'performer_model.g.dart';

@freezed
@Embedded(ignore: {'copyWith'})
class PerformerModel with _$PerformerModel {
  const factory PerformerModel({
    required int id,
    required String name,
    String? integrationEntityId,
  }) = _PerformerModel;

  factory PerformerModel.fromJson(Map<String, dynamic> json) => _$PerformerModelFromJson(json);
}
