import 'tag_model.dart';

abstract class TagBaseModel {
  final List<TagModel> tags;

  const TagBaseModel({required this.tags});
}
