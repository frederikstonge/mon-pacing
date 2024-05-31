import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'star_model.freezed.dart';
part 'star_model.g.dart';

@freezed
@Embedded(ignore: {'copyWith'})
class StarModel with _$StarModel {
  const factory StarModel({
    required int id,
    required int performerId,
    required int teamId,
  }) = _StarModel;

  factory StarModel.fromJson(Map<String, dynamic> json) => _$StarModelFromJson(json);
}
