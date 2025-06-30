import 'dart:async';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../mutex/mutex.dart';
import 'objectbox.g.dart';

class DatabaseRepository {
  static const pageSize = 20;
  static Store? _database;

  DatabaseRepository();

  Future<Store> get database async {
    if (_database != null) {
      return _database!;
    }

    return await Mutex.protect(() async {
      if (_database != null) {
        return _database!;
      }

      _database = await _getDatabase();
      return _database!;
    });
  }

  Future<Store> _getDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, 'mon-pacing');

    if (Store.isOpen(path)) {
      if (_database == null) {
        throw Exception('Store is already open');
      }

      return _database!;
    }

    final store = await openStore(directory: path, queriesCaseSensitiveDefault: false);
    await _initialize(store);
    return store;
  }

  Future<void> _initialize(Store store) async {
    // Add any additional setup code, e.g. build queries.
  }

  Future<void> close() async {
    if (_database != null) {
      _database!.close();
      _database = null;
    }
  }
}
