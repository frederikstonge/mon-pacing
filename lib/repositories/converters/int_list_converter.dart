import 'package:drift/drift.dart';

class IntListConverter extends TypeConverter<List<int>, String> with JsonTypeConverter<List<int>, String> {
  static const separator = ',';
  const IntListConverter();

  @override
  List<int> fromSql(String fromDb) {
    return fromDb.split(separator).map((e) => int.parse(e)).toList();
  }

  @override
  String toSql(List<int> value) {
    return value.join(separator);
  }
}
