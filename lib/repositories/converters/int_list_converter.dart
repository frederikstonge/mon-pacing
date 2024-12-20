import 'package:drift/drift.dart';

class IntListConverter extends TypeConverter<List<int>, String> with JsonTypeConverter<List<int>, String> {
  static const separator = ',';
  const IntListConverter();

  @override
  List<int> fromSql(String fromDb) {
    return fromDb.split(separator).cast<int>();
  }

  @override
  String toSql(List<int> value) {
    return value.join(separator);
  }
}
