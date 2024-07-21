import 'package:hydrated_bloc/hydrated_bloc.dart';

class TestStorage implements Storage {
  final Map<String, dynamic> data = {};

  @override
  dynamic read(String key) {
    return data[key];
  }

  @override
  Future<void> write(String key, dynamic value) async {
    data[key] = value;
  }

  @override
  Future<void> delete(String key) async {
    data.remove(key);
  }

  @override
  Future<void> clear() async {
    data.clear();
  }

  @override
  Future<void> close() async {
    data.clear();
  }
}
