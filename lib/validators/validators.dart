import '../l10n/localizer.dart';

class Validators {
  static String? stringRequired(String? value) {
    return value?.isEmpty ?? true ? Localizer.current.required : null;
  }

  static String? intRequired(int? value) {
    return value == null ? Localizer.current.required : null;
  }

  static String? lesserThan(int value, int? maxValue) {
    return maxValue != null && value > maxValue ? Localizer.current.lesserThan(max: maxValue) : null;
  }

  static String? greaterThan(int value, int? minValue) {
    return minValue != null && value < minValue ? Localizer.current.greaterThan(min: minValue) : null;
  }

  static String? intMultipleOf(int value, int? multiple) {
    return multiple != null && value % multiple != 0 ? Localizer.current.multipleOf(multiple: multiple) : null;
  }

  static String? duplicateTag(String value, List<String> tags) {
    return tags.contains(value) ? Localizer.current.duplicateTag(tag: value) : null;
  }
}
