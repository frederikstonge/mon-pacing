import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_filter.freezed.dart';
part 'tag_filter.g.dart';

@freezed
class TagFilter with _$TagFilter {
  const factory TagFilter({
    required String tag,
    required int count,
  }) = _TagFilter;

  factory TagFilter.fromJson(Map<String, dynamic> json) => _$TagFilterFromJson(json);
}
