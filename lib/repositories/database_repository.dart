import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'legacy_database_repository.dart';
import 'objectbox.g.dart';

class DatabaseRepository {
  final LegacyDatabaseRepository legacyDatabaseRepository;
  Store? _database;

  DatabaseRepository({required this.legacyDatabaseRepository});

  Future<Store> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _getDatabase();
    return _database!;
  }

  Future<Store> _getDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(dir.path, 'mon-pacing'), queriesCaseSensitiveDefault: false);
    await _initialize(store);
    return store;
  }

  Future<void> _initialize(Store store) async {
    // Add any additional setup code, e.g. build queries.
  }
}
