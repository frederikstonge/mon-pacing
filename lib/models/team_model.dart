// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import 'base_model.dart';
import 'performer_model.dart';

part 'team_model.freezed.dart';
part 'team_model.g.dart';

@freezed
@collection
class TeamModel with _$TeamModel implements BaseModel {
  const TeamModel._();

  @Implements<BaseModel>()
  const factory TeamModel({
    required int id,
    @index required DateTime? createdDate,
    required DateTime? modifiedDate,
    required String name,
    required int color,
    @Default([]) List<PerformerModel> performers,
    @Default([]) List<String> tags,
  }) = _TeamModel;

  List<String> get performerNames => performers.map((p) => p.name).toList();

  factory TeamModel.fromJson(Map<String, dynamic> json) => _$TeamModelFromJson(json);
}
