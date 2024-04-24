import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import 'base_model.dart';

part 'category_suggestion_model.freezed.dart';
part 'category_suggestion_model.g.dart';

@freezed
@collection
class CategorySuggestionModel with _$CategorySuggestionModel implements BaseModel {
  @Implements<BaseModel>()
  const factory CategorySuggestionModel({
    required int id,
    required String name,
    required DateTime? createdDate,
    required DateTime? modifiedDate,
  }) = _CategorySuggestionModel;

  factory CategorySuggestionModel.fromJson(Map<String, dynamic> json) => _$CategorySuggestionModelFromJson(json);
}
