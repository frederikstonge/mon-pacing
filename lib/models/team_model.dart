import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'team_model.freezed.dart';
part 'team_model.g.dart';

@freezed
@Embedded(ignore: {'copyWith'})
class TeamModel with _$TeamModel {
  const factory TeamModel({
    required int id,
    required String name,
    required int color,
  }) = _TeamModel;

  factory TeamModel.fromJson(Map<String, dynamic> json) => _$TeamModelFromJson(json);
}
