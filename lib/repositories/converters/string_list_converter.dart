import 'package:drift/drift.dart';

class StringListConverter extends TypeConverter<List<String>, String> with JsonTypeConverter<List<String>, String> {
  static const separator = ',';
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) {
    return fromDb.split(separator);
  }

  @override
  String toSql(List<String> value) {
    return value.join(separator);
  }
}
