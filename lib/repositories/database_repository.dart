import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'objectbox.g.dart';

class DatabaseRepository {
  Store? _database;

  Future<Store> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _getDatabase();
    return _database!;
  }

  Future<Store> _getDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(dir.path, 'mon-pacing'));
    _initialize(store);
    return store;
  }

  void _initialize(Store store) {
    // Add any additional setup code, e.g. build queries.
  }
}
